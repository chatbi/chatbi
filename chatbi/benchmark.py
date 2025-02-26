import os

import ibis
import ibis.backends
import typer

from chatbi.utils import execute_time_measure

benchmark_parquet = os.path.join(os.path.dirname(__file__), "../benchmark.parquet")


def query_by_ibis(con: ibis.BaseBackend):
    table = con.read_parquet(benchmark_parquet, table_name="benchmark")

    @execute_time_measure(key=con.name)
    def query():
        typer.echo(f"Table has {table.count().execute()} rows")
        res = table.group_by("category").aggregate(
            count=table.value.count(),
            mean=table.value.mean(),
            median=table.value.median(),
        )

        typer.echo("Grouped by category:")
        typer.echo(res.execute())

    query()


def query_by_duckdb():
    con = ibis.connect("duckdb://")
    query_by_ibis(con)


def query_by_pandas():
    con = ibis.pandas.connect()
    query_by_ibis(con)
