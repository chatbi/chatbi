import pandas as pd
import pytest
import sqlalchemy
from fastapi.testclient import TestClient
from testcontainers.postgres import PostgresContainer
from tests.resource.manifest import manifest

from chatbi.examples.data import tpch
from chatbi.main import app
from chatbi.utils import obj_to_base64

client = TestClient(app)

base_url = "/api/v1/connector/postgres"

manifest_str = obj_to_base64(manifest)


# Initialize the Postgres container
@pytest.fixture(scope="module")
def postgres(request) -> PostgresContainer:
    pg = PostgresContainer(
        image="postgres:16-alpine",
    ).start()
    engine = sqlalchemy.create_engine(pg.get_connection_url())
    pd.read_parquet(tpch.orders).to_sql("orders", engine, index=False)
    pd.read_parquet(tpch.customer).to_sql("customer", engine, index=False)
    request.addfinalizer(pg.stop)
    return pg


def test_query(postgres: PostgresContainer):
    connection_info = to_connection_info(postgres)
    body = {
        "connectionInfo": connection_info,
        "manifestStr": manifest_str,
        "sql": "SELECT * FROM anyflow.public.orders LIMIT 1",
    }
    response = client.post(
        url=f"{base_url}/query",
        json=body,
    )

    assert response.status_code == 200

    result = response.json()

    assert result.get("data") is not None
    data = result["data"]

    assert len(data["columns"]) == len(manifest["models"][0]["columns"])


def to_connection_info(pg: PostgresContainer):
    return {
        "host": pg.get_container_host_ip(),
        "port": pg.get_exposed_port(pg.port),
        "user": pg.username,
        "password": pg.password,
        "database": pg.dbname,
    }


def to_connection_url(pg: PostgresContainer):
    info = to_connection_info(pg)
    return f"postgres://{info['user']}:{info['password']}@{info['host']}:{info['port']}/{info['database']}"
