from chatbi.model import QueryDTO
from chatbi.model.data_source import DataSource


def verify_query_dto(data_source: DataSource, dto: QueryDTO):
    data_source.get_dto_type()(**dto.model_dump(by_alias=True))
