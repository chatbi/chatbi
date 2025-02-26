from functools import wraps
from uuid import uuid4

import orjson
import pandas as pd
from fastapi import HTTPException, Request
from loguru import logger
from sqlalchemy import text
from sqlmodel import select

from chatbi.agent.schema_agent import SchemaAgent
from chatbi.agent.sql_agent import SqlAgent
from chatbi.agent.visualize_agent import VisualizeAgent
from chatbi.cache.base import Cache
from chatbi.cache.memory import MemoryCache
from chatbi.database.ducbdb import Conversation, DuckdbDep
from chatbi.database.postgres import PostgresDep, get_schemas
from chatbi.model.chat import ChatDTO, RunSqlData

sql_agent = SqlAgent()
schema_agent = SchemaAgent()
visualize_agent = VisualizeAgent()


def requires_cache(required_fields, optional_fields=[]):
    def decorator(f):
        @wraps(f)
        def decorated(*args, **kwargs):
            logger.debug(f"args: {args}")
            logger.debug(f"kwargs: {kwargs}")
            instance: ChatService = args[0]
            cache: Cache = instance.cache

            id = kwargs.get("id")
            logger.debug(f"Get id by request query: {id}")
            if id is None:
                if id is None:
                    raise HTTPException(status_code=400, detail="No id provided")

            for field in required_fields:
                if cache.get(id=id, field=field) is None:
                    raise HTTPException(status_code=400, detail=f"No {field} found")

            field_values = {
                field: cache.get(id=id, field=field) for field in required_fields
            }

            for field in optional_fields:
                field_values[field] = cache.get(id=id, field=field)

            # remove duplicate field in field_values compare to args
            field_values = {
                k: v
                for k, v in field_values.items()
                if k not in args and k not in kwargs
            }

            logger.debug(f"field_values: {field_values}")
            return f(*args, **field_values, **kwargs)

        return decorated

    return decorator


class ChatService:
    table_schema = None

    def __init__(self, cache: Cache = None):
        if cache is None:
            cache = MemoryCache()
        self.cache = cache

    def set_cache(self, id: str, value="test"):
        self.cache.set(id, "test_field", value)
        return self.cache.get(id, "test_field")

    @requires_cache(["test_field"])
    def get_cache(self, requiest: Request, id: str, test_field: str):
        value = test_field
        logger.debug(f"test_field: {value}")
        return value

    def get_conversation(self, id: str, db: DuckdbDep):
        statement = (
            select(Conversation)
            .where(Conversation.id == id)
            .order_by(Conversation.index.desc())
        )

        logger.debug(
            f"[Execute SQL]: {statement.compile(compile_kwargs={'literal_binds': True})}"
        )

        conversation = db.exec(statement).first()
        logger.debug(f"get_conversation: {conversation}")

        return conversation

    def init_conversation(self, dto: ChatDTO, db: DuckdbDep):
        conversation: Conversation

        # create new context
        conversation = Conversation(
            id=uuid4().hex,
            chat_id=uuid4().hex,
            prompt=dto.text,
        )

        return conversation

    def get_table_scheme(self) -> str:
        if self.table_schema is None:
            self.table_schema = get_schemas()

        logger.debug(f"Table schema: {self.table_schema}")
        return orjson.dumps(self.table_schema)

    # return type: str | list
    # if json is True, return type is str, otherwise return type is list
    # def get_table_scheme1(self) -> str | list:
    #     if self.table_schema is None:
    #         metadata = cube_service.get_meta()
    #         self.table_schema = metadata.get("data", [])

    #     logger.debug(f"Table schema: {self.table_schema}")

    #     return orjson.dumps(self.table_schema)

    def analysis(
        self,
        request: Request,
        dto: ChatDTO,
        db: PostgresDep,
    ):
        try:
            id = dto.id
            question = dto.question
            if id is None:
                id = self.cache.generate_id(question=dto.text)

            question = dto.question

            table_schema = dto.table_schema

            if table_schema is None:
                # get all table schema
                all_table_schema = self.get_table_scheme()

                # before generate sql, we need retrieval relative table schemas
                response = schema_agent.reply(
                    id=id,
                    question=question,
                    table_schema=all_table_schema,
                )
                table_schema = response.answer

            logger.debug(f"Table schema: {table_schema}")
            dto.table_schema = table_schema

            # 1. get sql from text
            generate_sql_result = self.generate_sql(
                request=request, id=id, question=question, db=db
            )

            sql = generate_sql_result.answer
            logger.debug(f"Generated SQL: {sql}")

            # 2. get data from sql
            run_sql_result = self.run_sql(request=request, id=id, req_sql=sql, db=db)

            logger.debug(f"Query Data: {run_sql_result}")

            # 3. generate chart spec from data
            if dto.visualize:
                visualize_agent_result = visualize_agent.reply(
                    id=id, question=question, sql=sql, table_schema=table_schema
                )
                visualize_config = visualize_agent_result.answer
                response["visualize_config"] = visualize_config
                logger.debug(f"Generated Chart Config: {visualize_config}")
                self.cache.set(id, "visualize_config", visualize_config)

            self.cache.set(id, "question", question)
            self.cache.set(id, "table_schema", table_schema)
            self.cache.set(id, "sql", sql)

            # TODO: if data is too large, no need to save the data to cache
            # self.cache.set(id, "data", run_sql_result)

            return response

        except Exception as e:
            db.rollback()
            raise e

    def generate_sql(
        self,
        # request argument is required for decorator "requires_cache"
        request: Request,
        id: str | None,
        question: str,
        db: PostgresDep,
    ):
        """Generate SQL query

        Args:
            request (Request): FastAPI request
            id (str | None): Conversation ID, default is None
            question (str): User input chat message
            db (PostgresDep): Postgres database connection

        Returns:
            AgentMessage: SQL query result
        """
        try:
            # if id is None, create a new conversation
            if id is None:
                id = self.cache.generate_id(question=question)

            logger.debug(f"Current conversation ID: {id}")

            # get all table schema
            all_table_schema = self.get_table_scheme()

            # before generate sql, we need retrieval relative table schemas
            response = schema_agent.reply(
                id=id,
                question=question,
                table_schema=all_table_schema,
            )
            logger.debug(f"schema_agent: {response}")
            table_schema = response.answer

            logger.debug(f"Table schema: {table_schema}")

            # 1. get sql from text
            response = sql_agent.reply(
                id=id,
                question=question,
                table_schema=table_schema,
            )

            sql = response.answer
            logger.debug(f"Generated SQL: {sql}")

            self.cache.set(id, "question", question)
            self.cache.set(id, "table_schema", table_schema)
            self.cache.set(id, "sql", sql)

            return response

        except Exception as e:
            db.rollback()
            raise e

    @requires_cache(["sql"])
    def run_sql(
        self,
        # request argument is required for decorator "requires_cache"
        request: Request,
        id: str,
        req_sql: str,
        db: PostgresDep,
        sql: str,
    ) -> RunSqlData:
        """Run SQL query

        Args:
            request (Request): FastAPI request
            id (str): Conversation ID
            req_sql (str): SQL query
            db (PostgresDep): Postgres database connection
            sql (str): SQL query

        Returns:
            RunSqlData: SQL query result

        """
        limit = 10

        if req_sql is not None:
            sql = req_sql

        logger.debug(f"Execute SQL: {sql}")

        # if sql does not contain limit, add limit 1000, sql end may contain char ;
        if "limit" not in sql.lower():
            if sql.endswith(";"):
                sql = f"{sql[:-1]} LIMIT {limit};"
            else:
                sql = f"{sql} LIMIT {limit};"

        statement = text(sql)
        results = db.exec(statement).all()

        # get column names
        columns = []
        for row in results:
            row_dict = dict(row._mapping)
            for key, value in row_dict.items():
                if key not in columns:
                    columns.append(key)

        logger.debug(f"SQL result: {columns}")

        # Create a pandas dataframe from the results
        df = pd.DataFrame(results, columns=columns)
        logger.debug(f"SQL result: {df}")

        return RunSqlData(
            data=df.to_json(orient="records"),
            should_visualize=self.should_visualize(df),
        )

    @requires_cache(["question", "sql", "table_schema"])
    def generateVisualize(
        self,
        # request argument is required for decorator "requires_cache"
        request: Request,
        id: str,
        data: list,
        question: str,
        sql: str,
        table_schema: str,
    ):
        """Generate visualization

        Args:
            request (Request): FastAPI request
            id (str): Conversation ID
            data (list): Data for visualization
            question (str): User input chat message
            sql (str): SQL query
            table_schema (str): Table schema

        Returns:
            CommonResponse: Visualization result
        """
        response = visualize_agent.reply(
            id=id, question=question, sql=sql, table_schema=table_schema
        )

        self.cache.set(
            id,
            "visualize_config",
            response.answer,
        )

        logger.debug(f"response: {response}")

        return response

    def should_visualize(self, df: pd.DataFrame) -> bool:
        """Check if a chart should be generated

        Example:
        ```python
        vn.should_generate_chart(df)
        ```

        Checks if a chart should be generated for the given DataFrame. By default, it checks if the DataFrame has more than one row and has numerical columns.
        You can override this method to customize the logic for generating charts.

        Args:
            df (pd.DataFrame): The DataFrame to check.

        Returns:
            bool: True if a chart should be generated, False otherwise.
        """

        return bool(len(df) > 1 and df.select_dtypes(include=["number"]).shape[1] > 0)


chat_service = ChatService()
