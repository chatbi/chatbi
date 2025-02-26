import base64
from enum import Enum, StrEnum, auto
from json import loads
from urllib.parse import urlparse

import ibis
from google.oauth2 import service_account
from ibis import BaseBackend

from chatbi.model import (
    ClickHouseConnectionInfo,
    ConnectionInfo,
    ConnectionUrl,
    MSSqlConnectionInfo,
    MySqlConnectionInfo,
    PostgresConnectionInfo,
    QueryBigQueryDTO,
    QueryClickHouseDTO,
    QueryDTO,
    QueryDuckDbDTO,
    QueryMSSqlDTO,
    QueryMySqlDTO,
    QueryPostgresDTO,
    QuerySnowflakeDTO,
    QueryTrinoDTO,
    SnowflakeConnectionInfo,
    TrinoConnectionInfo,
)


class DataSource(StrEnum):
    duckdb = auto()
    bigquery = auto()
    clickhouse = auto()
    mssql = auto()
    mysql = auto()
    postgres = auto()
    snowflake = auto()
    trino = auto()

    def get_connection(self, info: ConnectionInfo) -> BaseBackend:
        try:
            return DataSourceExtension[self].get_connection(info)
        except KeyError:
            raise NotImplementedError(f"Unsupported datasource: {self}")

    def get_dto_type(self):
        try:
            return DataSourceExtension[self].dto
        except KeyError:
            raise NotImplementedError(f"Unsupported datasource: {self}")


class DataSourceExtension(Enum):
    duckdb = QueryDuckDbDTO
    bigquery = QueryBigQueryDTO
    clickhouse = QueryClickHouseDTO
    mssql = QueryMSSqlDTO
    mysql = QueryMySqlDTO
    postgres = QueryPostgresDTO
    snowflake = QuerySnowflakeDTO
    trino = QueryTrinoDTO

    def __init__(self, dto: QueryDTO) -> None:
        self.dto = dto

    def get_connection(self, info: ConnectionInfo) -> BaseBackend:
        try:
            return getattr(self, f"get_{self.name}_connection")(info)
        except KeyError:
            raise NotImplementedError(f"Unsupported datasource: {self}")

    @staticmethod
    def get_duckdb_connection(info: ConnectionUrl) -> BaseBackend:
        return ibis.connect(info.connection_url.get_secret_value())

    @staticmethod
    def get_bigquery_connection(info: ConnectionInfo) -> BaseBackend:
        credits_json = loads(
            base64.b64decode(info.credentials.get_secret_value()).decode("utf-8")
        )
        credentials = service_account.Credentials.from_service_account_info(
            credits_json
        )
        return ibis.bigquery.connect(
            project_id=info.project_id.get_secret_value(),
            dataset_id=info.dataset_id.get_secret_value(),
            credentials=credentials,
        )

    @staticmethod
    def get_clickhouse_connection(
        info: ConnectionUrl | ClickHouseConnectionInfo,
    ) -> BaseBackend:
        if hasattr(info, "connection_url"):
            url = info.connection_url.get_secret_value()
            return ibis.connect(url, port=urlparse(url).port)

        return ibis.clickhouse.connect(
            host=info.host.get_secret_value(),
            port=info.port.get_secret_value(),
            database=info.database.get_secret_value(),
            user=info.user.get_secret_value(),
            password=info.password.get_secret_value(),
        )

    @staticmethod
    def get_mssql_connection(info: MSSqlConnectionInfo) -> BaseBackend:
        return ibis.mssql.connect(
            host=info.host.get_secret_value(),
            port=info.port.get_secret_value(),
            database=info.database.get_secret_value(),
            user=info.user.get_secret_value(),
            password=info.password.get_secret_value(),
            driver=info.driver,
        )

    @staticmethod
    def get_mysql_connection(info: ConnectionUrl | MySqlConnectionInfo) -> BaseBackend:
        if hasattr(info, "connection_url"):
            url = info.connection_url.get_secret_value()
            return ibis.connect(url, port=urlparse(url).port)

        return ibis.mysql.connect(
            host=info.host.get_secret_value(),
            port=info.port.get_secret_value(),
            database=info.database.get_secret_value(),
            user=info.user.get_secret_value(),
            password=info.password.get_secret_value(),
        )

    @staticmethod
    def get_postgres_connection(
        info: ConnectionUrl | PostgresConnectionInfo,
    ) -> BaseBackend:
        if hasattr(info, "connection_url"):
            url = info.connection_url.get_secret_value()
            return ibis.connect(url, port=urlparse(url).port)

        return ibis.postgres.connect(
            host=info.host.get_secret_value(),
            port=info.port.get_secret_value(),
            database=info.database.get_secret_value(),
            user=info.user.get_secret_value(),
            password=info.password.get_secret_value(),
        )

    @staticmethod
    def get_snowflake_connection(info: SnowflakeConnectionInfo) -> BaseBackend:
        return ibis.snowflake.connect(
            user=info.user.get_secret_value(),
            password=info.password.get_secret_value(),
            account=info.account.get_secret_value(),
            database=info.database.get_secret_value(),
            schema=info.sf_schema.get_secret_value(),
        )

    @staticmethod
    def get_trino_connection(info: ConnectionUrl | TrinoConnectionInfo) -> BaseBackend:
        if hasattr(info, "connection_url"):
            url = info.connection_url.get_secret_value()
            return ibis.connect(url)

        return ibis.trino.connect(
            host=info.host.get_secret_value(),
            port=int(info.port.get_secret_value()),
            database=info.catalog.get_secret_value(),
            schema=info.trino_schema.get_secret_value(),
            user=(info.user and info.user.get_secret_value()),
            password=(info.password and info.password.get_secret_value()),
        )
