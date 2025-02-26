from pydantic import BaseModel


class CubeFilterDTO(BaseModel):
    member: str
    operator: str
    values: list[str | int | float]


class CubeEntityDTO(BaseModel):
    """Example of cube entity DTO

    Example:
    {
        "name": "Users",
        "title": "Users",
        "meta": {
            "someKey": "someValue",
            "nested": {
                "someKey": "someValue"
            }
        },
        "connectedComponent": 1,
        "measures": [
            {
                "name": "users.count",
                "title": "Users Count",
                "shortTitle": "Count",
                "aliasName": "users.count",
                "type": "number",
                "aggType": "count",
                "drillMembers": ["users.id", "users.city", "users.createdAt"]
            }
        ],
        "dimensions": [
            {
            "name": "users.city",
            "title": "Users City",
            "type": "string",
            "aliasName": "users.city",
            "shortTitle": "City",
            "suggestFilterValues": true
            }
        ],
        "segments": []
    }
    """

    name: str
    title: str
    meta: dict[str, str]
    connectedComponent: int
    measures: list[dict[str, str]]
    dimensions: list[dict[str, str]]
    segments: list[dict[str, str]]


class CubeTimeDimensionDTO(BaseModel):
    dimension: str
    dateRange: list[str]
    granularity: str


class CubeQueryDTO(BaseModel):
    measures: list[str]
    dimensions: list[str]
    filters: list[CubeFilterDTO] = None
    timeDimensions: list[CubeTimeDimensionDTO] = None
    limit: int = 100
    offset: int = 0
    order: dict[str, str] = None
    timezone: str = None


class CubeApiDTO(BaseModel):
    query: CubeQueryDTO

    model_config = {
        "json_schema_extra": {
            "examples": [
                {
                    "query": {
                        "limit": 10,
                        "dimensions": [
                            "orders.id",
                            "orders.status",
                            "orders.user_id",
                            "users.gender",
                            "users.state",
                            "users.city",
                        ],
                        "measures": ["orders.count", "orders.number"],
                    }
                }
            ]
        }
    }
