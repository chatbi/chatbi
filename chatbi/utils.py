import base64
import decimal
import os
import time

import orjson
import pandas as pd
from pandas.core.dtypes.common import is_datetime64_any_dtype


def to_json(df: pd.DataFrame) -> dict:
    for column in df.columns:
        if is_datetime64_any_dtype(df[column].dtype):
            df[column] = _to_datetime_and_format(df[column])
    return _to_json_obj(df)


def _to_datetime_and_format(series: pd.Series) -> pd.Series:
    return series.apply(
        lambda d: (
            d.strftime(
                "%Y-%m-%d %H:%M:%S.%f" + (" %Z" if series.dt.tz is not None else "")
            )
            if not pd.isnull(d)
            else d
        )
    )


def _to_json_obj(df: pd.DataFrame) -> dict:
    data = df.to_dict(orient="split", index=False)

    def default(obj):
        if pd.isna(obj):
            return None
        if isinstance(obj, decimal.Decimal):
            return str(obj)
        if isinstance(obj, (bytes, bytearray)):
            return obj.hex()
        raise TypeError

    json_obj = orjson.loads(
        orjson.dumps(
            data,
            option=orjson.OPT_SERIALIZE_NUMPY | orjson.OPT_SERIALIZE_UUID,
            default=default,
        )
    )
    json_obj["dtypes"] = df.dtypes.astype(str).to_dict()
    return json_obj


# Decorator to measure the execution time of a function
def execute_time_measure(key="default", decimals=4):
    def inner_decorator(func):
        def wrapper(*args, **kwargs1):
            start_time = time.time()
            result = func(*args, **kwargs1)
            end_time = time.time()

            # keep decimal places to 4
            delta = round(end_time - start_time, decimals)

            print(f"[{key}], Execution time: {delta} seconds")

            return result

        return wrapper

    return inner_decorator


def file_path(path: str) -> str:
    """Constructs an absolute file path by joining the directory of the current file with the provided relative path.

    Args:
        path (str): The relative path to be joined with the directory of the current file.

    Returns:
        str: The absolute file path.
    """
    return os.path.realpath(os.path.join(os.path.dirname(__file__), path))


def obj_to_base64(obj: dict) -> str:
    """Convert a dictionary object to a base64-encoded string.

    This function serializes a dictionary object to a JSON-formatted byte string
    using the orjson library, then encodes it to a base64 string.

    Args:
        obj (dict): The dictionary object to be converted.

    Returns:
        str: The base64-encoded string representation of the dictionary.
    """
    # Serialize the dictionary to a JSON-formatted byte string
    # Encode the byte string to a base64 string
    return base64.b64encode(orjson.dumps(obj)).decode("utf-8")
