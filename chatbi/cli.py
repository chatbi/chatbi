import ibis
import typer

# import subprocess
from chatbi.benchmark import benchmark_parquet, query_by_duckdb, query_by_pandas
from chatbi.examples.duckdb import main as duckdb_example
from chatbi.examples.postgres import main as postgres_example
from chatbi.generate import data_generate

ibis.options.interactive = True

TYPER_KWARGS = {
    "no_args_is_help": True,
    "add_completion": False,
    "context_settings": {"help_option_names": ["-h", "--help"]},
}
app = typer.Typer(help="is", **TYPER_KWARGS)


@app.command()
def generate(
    rows: int = typer.Option(1000, "--rows", help="Number of rows", show_default=True),
):
    """Generate data."""

    typer.echo("Generating data...")

    data_generate(rows=rows, output=benchmark_parquet)

    typer.echo("Data generated.")


@app.command()
def benchmark():
    """Running benchmark..."""

    # generate 100000000 rows of data
    data_generate(rows=100000000)

    query_by_duckdb()
    typer.echo("-------------------\n")
    query_by_pandas()


@app.command()
def example(
    name: str = typer.Option(
        "duckdb", "--name", help="Run example name", show_default=True
    ),
):
    """Run examples."""
    typer.echo(f"Running example {name}...")

    match name:
        case "duckdb":
            duckdb_example()
        case "postgres":
            postgres_example()
        case _:
            typer.echo(f"Example {name} not found.")


if __name__ == "__main__":
    app()
