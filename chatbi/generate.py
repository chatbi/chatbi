from pathlib import Path

import numpy as np
import pandas as pd
import typer


def is_generated(p: str):
    return Path(p).exists()


# Generate test data and export it to parquet format
def data_generate(rows: int = 10000000, output: str = "benchmark.parquet"):
    output_path = Path(output)

    # Skip if the file already exists
    if is_generated(output_path):
        typer.echo(f"Data already generated: {output_path}")
        return

    pd.DataFrame(
        {
            "category": np.random.choice(list("abcdef"), rows),
            "value": np.random.uniform(0, 100, rows),
        }
    ).assign(value=lambda df: df["value"].round(3)).to_parquet(output_path)
