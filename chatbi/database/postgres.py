import os
from typing import Annotated

from dotenv import load_dotenv
from fastapi import Depends
from loguru import logger
from psycopg2 import connect
from sqlalchemy import create_engine
from sqlmodel import Session

load_dotenv()

logger.debug(f"DB_NAME: {os.getenv('DB_NAME')}")


db_host = os.getenv("DB_HOST", "localhost")
db_port = os.getenv("DB_PORT", "5432")
db_name = os.getenv("DB_NAME", "anyflow")
db_user = os.getenv("DB_USER", "cube")
db_password = os.getenv("DB_PASSWORD", "12345")
connection_url = (
    f"postgresql+psycopg2://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
)

logger.debug(f"Connection URL: {connection_url}")

engine = create_engine(connection_url, echo=True)


def get_db_conn(is_shared=False):
    return connect(
        dbname=db_name, user=db_user, password=db_password, host=db_host, port=db_port
    )


def init_database(is_force: bool = False):
    try:
        conn = get_db_conn()
        cursor = conn.cursor()
        # init tables by duckdb sql
        cursor.execute(
            """
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public';
        """
        )

        # do something with the connection

        # parse tables, table example: ('table_name',)
        tables = cursor.fetchall()
        table_list = [table[0] for table in tables]
        logger.debug(f"Table list: {table_list}")

        conn.commit()

        cursor.close()
        conn.close()
    except Exception as e:
        logger.error(e)


def get_schemas():
    try:
        conn = get_db_conn()
        cursor = conn.cursor()
        # init tables by duckdb sql
        cursor.execute(
            """
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public';
        """
        )

        # do something with the connection

        # parse tables, table example: ('table_name',)
        tables = cursor.fetchall()
        table_list = [table[0] for table in tables]

        result = []
        for table in table_list:
            cursor.execute(
                f"""
                SELECT 
                    c.table_schema as tableSchema,
                    c.table_name as tableMame,
                    c.column_name as column,
                    c.udt_name as type,
                    c.is_nullable as nullable
                FROM 
                    information_schema.columns c
                WHERE 
                    c.table_schema = 'public' AND c.table_name = '{table}'
                ORDER BY 
                    c.table_schema, c.table_name, c.ordinal_position;
                """
            )
            rows = cursor.fetchall()
            fields = [
                {
                    "column": row[2],
                    "type": row[3],
                    "nullable": row[4],
                }
                for row in rows
            ]
            logger.debug(f"Table: {table}, Rows: {rows}")

            result.append(
                {
                    "name": table,
                    "fields": fields,
                }
            )

        conn.commit()

        cursor.close()
        conn.close()

        return result
    except Exception as e:
        logger.error(e)


def get_session():
    with Session(engine) as session:
        yield session


PostgresDep = Annotated[Session, Depends(get_session)]
