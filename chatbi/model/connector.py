import pandas as pd
from loguru import logger

from chatbi.model import ConnectionInfo, UnprocessableEntityError
from chatbi.model.data_source import DataSource


class Connector:
    def __init__(
        self,
        data_source: DataSource,
        connection_info: ConnectionInfo,
        manifest_str: str,
    ):
        self.data_source = data_source
        self.connection_info = connection_info
        self.manifest_str = manifest_str
        self.connection = self.data_source.get_connection(self.connection_info)

    def query(self, sql: str, limit: str) -> pd.DataFrame:
        # logger tables
        con = self.connection
        logger.info(f"Tables: {con.list_tables()}")
        return con.sql(sql).limit(limit).to_pandas()

    def dry_run(self, sql: str) -> None:
        try:
            # logger tables
            con = self.connection
            logger.info(f"Tables: {con.list_tables()}")
            con.sql(sql)
        except Exception as e:
            raise QueryDryRunError(f"Exception: {type(e)}, message: {e!s}")


class QueryDryRunError(UnprocessableEntityError):
    pass
