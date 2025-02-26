from typing import Annotated

import ibis
import pandas as pd
from fastapi import Depends
from ibis import BaseBackend
from tests.resource.manifest import manifest

from chatbi.model import DuckDbConnectionInfo
from chatbi.utils import file_path, obj_to_base64

connection_url = "duckdb://anyflow-dev.ddb"


class Duckdb:
    conn: BaseBackend | None = None

    def __init__(self):
        self.connection_info = DuckDbConnectionInfo(
            connection_url=connection_url,
        )
        self.manifest = manifest

    def connection(self):
        if self.conn is None:
            self.conn = ibis.connect(
                self.connection_info.connection_url.get_secret_value()
            )
        return self.conn

    def get_manifest(self, encode: bool = False):
        if encode:
            return obj_to_base64(self.manifest)
        return self.manifest

    def init_data(self, is_force: bool = False):
        try:
            con = self.connection()
            # con.create_namespace("main", database="duckdb")
            tables = con.list_tables()
            if "orders" not in tables or is_force:
                # create table from parquet file, and execute the query
                print("Create table orders, by reading parquet file orders.parquet")
                con.create_table(
                    name="orders",
                    obj=pd.read_parquet(
                        file_path("../tests/resource/tpch/data/orders.parquet")
                    ),
                    overwrite=True,
                )
            else:
                print("Table orders already exists")

            if "customer" not in tables or is_force:
                print("Create table customer, by reading parquet file customer.parquet")
                con.create_table(
                    name="customer",
                    obj=pd.read_parquet(
                        file_path("../tests/resource/tpch/data/customer.parquet")
                    ),
                    overwrite=True,
                )
            else:
                print("Table customer already exists")

            # add hero table
            if "hero" not in tables or is_force:
                print("Create table hero")
                con.drop_table("hero", force=True)
                con.create_table(
                    name="hero",
                    obj=pd.DataFrame(
                        {
                            "id": [1, 2, 3],
                            "name": ["Alice", "Bob", "Cathy"],
                            "age": [20, 30, 40],
                        }
                    ),
                    overwrite=True,
                )

            print("Table list:")
            print(con.list_tables())
            hero = con.table("hero")
            print(hero.schema())

            self.connection.disconnect()
        except Exception as e:
            raise e


duckdb = Duckdb()


def get_connection() -> BaseBackend:
    return duckdb.connection()


DuckdbDep = Annotated[BaseBackend, Depends(get_connection)]
