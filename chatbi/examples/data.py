from pydantic import BaseModel

from chatbi.utils import file_path


class Tpch(BaseModel):
    orders: str = file_path("../tests/resource/tpch/data/orders.parquet")
    customer: str = file_path("../tests/resource/tpch/data/customer.parquet")


tpch = Tpch()
