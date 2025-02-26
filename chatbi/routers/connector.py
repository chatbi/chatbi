from typing import Annotated

from fastapi import APIRouter, Depends, Query, Response
from fastapi.responses import JSONResponse
from loguru import logger

from chatbi.dependencies import verify_query_dto
from chatbi.model import (
    DryPlanDTO,
    QueryDTO,
    ValidateDTO,
)
from chatbi.model.connector import Connector
from chatbi.model.data_source import DataSource
from chatbi.model.rewriter import Rewriter
from chatbi.model.validator import Validator
from chatbi.utils import to_json

router = APIRouter(prefix="/connector")


@router.post("/{data_source}/query", dependencies=[Depends(verify_query_dto)])
def query(
    data_source: DataSource,
    dto: QueryDTO,
    dry_run: Annotated[bool, Query(alias="dryRun")] = False,
    limit: int = Query(100, alias="limit"),
) -> Response:
    logger.info(f"Querying data for data source {data_source}: {dto}")
    rewritten_sql = Rewriter(dto.manifest_str, data_source=data_source).rewrite(dto.sql)
    connector = Connector(data_source, dto.connection_info, dto.manifest_str)

    if dry_run:
        connector.dry_run(rewritten_sql)
        return JSONResponse(content={"message": "Dry run successful"})

    data = to_json(connector.query(rewritten_sql, limit))
    return JSONResponse(content={"data": data})


@router.post("/dry-plan")
def dry_run(dto: DryPlanDTO) -> str:
    rewritten_sql = Rewriter(dto.manifest_str).rewrite(dto.sql)
    return JSONResponse(content={"sql": rewritten_sql})


@router.post("/{data_source}/dry-plan")
def dry_plan_for_data_source(data_source: DataSource, dto: DryPlanDTO) -> str:
    rewritten_sql = Rewriter(dto.manifest_str, data_source=data_source).rewrite(dto.sql)
    return JSONResponse(content={"sql": rewritten_sql})


@router.post("/{data_source}/validate/{rule_name}")
def validate(data_source: DataSource, rule_name: str, dto: ValidateDTO) -> Response:
    validator = Validator(
        connector=Connector(data_source, dto.connection_info, dto.manifest_str),
        rewriter=Rewriter(dto.manifest_str, data_source=data_source),
    )

    try:
        validator.validate(rule_name, dto.parameters)
    except Exception as e:
        return JSONResponse(
            status_code=422, content={"message": f"Validation failed, error: {e!s}"}
        )

    return JSONResponse(status_code=204, content={"message": "Validation passed"})
