import os
from typing import Annotated

import orjson
from fastapi import APIRouter, Query
from fastapi.responses import JSONResponse
from loguru import logger

from chatbi.model.cube import CubeApiDTO
from chatbi.service.cube import cube_service

router = APIRouter(prefix="/cube")

cube_service_api = os.getenv("CUBE_SERVICE_API", "http://localhost:4000")


# query data from cube service
@router.post("/query")
async def query(body: CubeApiDTO):
    # exclude None value from body
    clean_body = body.model_dump(exclude_none=True)
    payload = orjson.dumps(clean_body)

    result = cube_service.query(payload)

    return JSONResponse(content=result)


# get meta data from cube service
@router.get("/meta")
async def meta(table_name: Annotated[str | None, Query()] = None):
    logger.debug(f"Table name: {table_name}")
    result = cube_service.get_meta(table_name)
    logger.debug(f"Meta result: {result}")

    return JSONResponse(content=result)
