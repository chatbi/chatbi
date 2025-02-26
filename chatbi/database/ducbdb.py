from typing import Annotated
from uuid import uuid4

from fastapi import Depends
from loguru import logger
from sqlalchemy import text
from sqlmodel import Field, Session, SQLModel, create_engine

from chatbi.utils import file_path

connection_url = "chatbi-dev.ddb"


engine = create_engine(f"duckdb:///{connection_url}", echo=True)
# engine = create_engine(f"duckdb://", echo=True)


class Hero(SQLModel, table=True):
    id: str = Field(default=uuid4(), primary_key=True)

    name: str = Field(index=True)
    age: int | None = Field(default=None, index=True)


# store chat history
class Conversation(SQLModel, table=True):
    # id: int | None = Field(primary_key=True)
    id: str = Field(default=uuid4(), primary_key=True)

    chat_id: str = Field(index=True)

    # index
    index: int = Field(default=0, index=False)

    # user input
    prompt: str = Field(index=True)

    # agent name/id
    agent: str = Field(index=False)

    # agent input, prompt messages
    input: str = Field(index=False)

    # agent output, response message
    output: str = Field(index=False)


def get_session():
    with Session(engine) as session:
        yield session


DuckdbDep = Annotated[Session, Depends(get_session)]


def init_database(
    is_force: bool = False,
    db: DuckdbDep = Annotated[Session, Depends(get_session)],
):
    try:
        SQLModel.metadata.create_all(engine)

        conn = next(get_session())
        tables = conn.exec(text("SHOW TABLES;")).all()

        tables = [table[0] for table in tables]

        logger.debug(f"Tables: {tables}")

        # 1. init hero table
        if "hero" in tables and is_force:
            conn.exec(text("DROP TABLE IF EXISTS hero;"))

        conn.exec(
            text(
                """
            CREATE SEQUENCE IF NOT EXISTS id_sequence START 1;
            CREATE TABLE IF NOT EXISTS hero (id INTEGER PRIMARY KEY DEFAULT nextval('id_sequence'), name TEXT, age INTEGER);
            """
            )
        )

        # add demo data
        conn.exec(
            text(
                """
            INSERT INTO hero (name, age) VALUES ('Alice', 20), ('Bob', 30), ('Cathy', 40);
            """
            )
        )

        # 2. init orders table
        if "orders" in tables and is_force:
            conn.exec(text("DROP TABLE IF EXISTS orders;"))

        orders_parquet = file_path("tests/resource/tpch/data/orders.parquet")
        logger.debug(f"Reading parquet file: {orders_parquet}")
        conn.exec(
            text(
                f"""
            CREATE TABLE IF NOT EXISTS orders AS SELECT * FROM read_parquet('{orders_parquet}');
            """
            )
        )
        logger.debug(f"Read parquet file: {orders_parquet}, done.")

        # 3. init customer table
        if "customer" in tables and is_force:
            conn.exec(text("DROP TABLE IF EXISTS customer;"))

        customer_parquet = file_path("tests/resource/tpch/data/customer.parquet")
        logger.debug(f"Reading parquet file: {customer_parquet}")
        conn.exec(
            text(
                f"""
            CREATE TABLE IF NOT EXISTS customer AS SELECT * FROM read_parquet('{customer_parquet}');
            """
            )
        )
        logger.debug(f"Read parquet file: {customer_parquet}, done.")

        tables = conn.exec(text("SHOW TABLES")).all()
        tables = [table[0] for table in tables]
        logger.debug(f"Tables created: {tables}")

        conn.close()
    except Exception as e:
        logger.error(e)
