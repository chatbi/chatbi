import ibis
import pandas as pd
from fastapi.testclient import TestClient
from tests.resource.manifest import manifest

from chatbi.main import app
from chatbi.model import DuckDbConnectionInfo
from chatbi.utils import file_path, obj_to_base64

client = TestClient(app)

base_url = "/api/v1/connector/duckdb"

manifest_str = obj_to_base64(manifest)

connection_info = DuckDbConnectionInfo(
    connection_url="duckdb://public.ddb",
)

connection_dict = {
    "connection_url": connection_info.connection_url.get_secret_value(),
}


def main():
    # init data
    init_data()

    body = {
        "connectionInfo": connection_dict,
        "manifestStr": manifest_str,
        "sql": "SELECT * FROM public.orders LIMIT 1",
    }
    response = client.post(
        url=f"{base_url}/query",
        json=body,
    )

    result = response.json()

    assert result.get("data") is not None
    data = result["data"]

    print("Result:")
    print(data)


def init_data():
    print("Init data")
    con: ibis.BaseBackend = ibis.connect(
        connection_info.connection_url.get_secret_value()
    )

    # create table from parquet file, and execute the query
    print("Create table orders, by reading parquet file orders.parquet")
    con.create_table(
        name="orders",
        obj=pd.read_parquet(file_path("../tests/resource/tpch/data/orders.parquet")),
        overwrite=True,
    )

    print("Create table customer, by reading parquet file customer.parquet")
    con.create_table(
        name="customer",
        obj=pd.read_parquet(file_path("../tests/resource/tpch/data/customer.parquet")),
        overwrite=True,
    )

    print("Table list:")
    print(con.list_tables())
    con.disconnect()
