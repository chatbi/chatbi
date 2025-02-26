import sqlglot
from loguru import logger

from chatbi.model import UnprocessableEntityError
from chatbi.model.data_source import DataSource


class Rewriter:
    def __init__(
        self,
        manifest_str: str,
        data_source: DataSource = None,
    ):
        self.manifest_str = manifest_str
        self.data_source = data_source

    def rewrite(self, sql: str) -> str:
        logger.debug(f"Origin SQL: {sql}")
        dialect_sql = self._transpile(sql) if self.data_source else sql
        logger.debug(f"Dialect SQL: {dialect_sql}")
        return dialect_sql

    def _transpile(self, planned_sql: str) -> str:
        return sqlglot.transpile(
            planned_sql, read="postgres", write=self.data_source.name
        )[0]


class RewriterError(UnprocessableEntityError):
    def __init__(self, message: str):
        super().__init__(message)
