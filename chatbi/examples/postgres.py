import ibis
import pandas as pd

# from fastapi import requests
from fastapi.testclient import TestClient
from tests.resource.manifest import manifest

from chatbi.examples.data import tpch
from chatbi.main import app
from chatbi.model import PostgresConnectionInfo
from chatbi.utils import obj_to_base64

client = TestClient(app)

base_url = "/api/v1/connector/postgres"

connection_info = PostgresConnectionInfo(
    host="localhost",
    user="test",
    password="test",
    database="test",
    port="55071",
)

connection_dict = {
    "host": connection_info.host.get_secret_value(),
    "user": connection_info.user.get_secret_value(),
    "password": connection_info.password.get_secret_value(),
    "database": connection_info.database.get_secret_value(),
    "port": connection_info.port.get_secret_value(),
}

manifest_str = obj_to_base64(manifest)


def main():
    # init data
    init_data()

    body = {
        "connectionInfo": connection_dict,
        "manifestStr": manifest_str,
        "sql": "SELECT * FROM anyflow.public.orders LIMIT 1",
    }
    response = client.post(
        url=f"{base_url}/query",
        json=body,
    )

    assert response.status_code == 200

    result = response.json()

    print("Result:")
    print(result)


def init_data():
    print("Init data")
    con: ibis.BaseBackend = ibis.postgres.connect(**connection_dict)

    # create table from parquet file, and execute the query
    print("Create table orders, by reading parquet file orders.parquet")
    con.create_table(
        name="orders",
        obj=pd.read_parquet(tpch.orders),
        overwrite=True,
    )

    print("Create table customer, by reading parquet file customer.parquet")
    con.create_table(
        name="customer",
        obj=pd.read_parquet(tpch.customer),
        overwrite=True,
    )

    print("Table list:")
    print(con.list_tables())


if __name__ == "__main__":
    main()
