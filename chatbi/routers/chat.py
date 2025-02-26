from typing import Annotated

from fastapi import APIRouter, Query, Request
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from loguru import logger
from pydantic import BaseModel, Field
from sqlmodel import select

from chatbi.database.ducbdb import Conversation, DuckdbDep
from chatbi.database.postgres import PostgresDep
from chatbi.model.chat import (
    CommonResponse,
    CreateCompletionsDTO,
    GenerateSqlRequest,
    GenerateVisualizeRequest,
    RunSqlRequest,
    RunSqlResponse,
)
from chatbi.service.chat import chat_service
from chatbi.service.llm import llm_service

router = APIRouter(prefix="/chat")


@router.post("/generate_sql", response_model=CommonResponse)
def generate_sql(request: Request, dto: GenerateSqlRequest, db: PostgresDep):
    result = chat_service.generate_sql(
        request=request, id=dto.id, question=dto.question, db=db
    )

    return JSONResponse(content={"data": jsonable_encoder(result), "code": 200})


@router.post("/run_sql", response_model=RunSqlResponse)
def run_sql(request: Request, dto: RunSqlRequest, db: PostgresDep):
    result = chat_service.run_sql(request=request, id=dto.id, req_sql=dto.sql, db=db)

    return JSONResponse(content={"data": jsonable_encoder(result), "code": 200})


@router.post("/generate_visualize", response_model=CommonResponse)
def text2chart(request: Request, dto: GenerateVisualizeRequest):
    result = chat_service.generateVisualize(request=request, id=dto.id, data=dto.data)

    return JSONResponse(content={"data": jsonable_encoder(result), "code": 200})


@router.get("/table_schema")
def table_schema(request: Request, db: PostgresDep):
    result = chat_service.get_table_scheme()

    return JSONResponse(content={"data": jsonable_encoder(result), "code": 200})


# proxy openai completions api
@router.post("/completions")
async def completions(body: CreateCompletionsDTO):
    result = llm_service.completions(body)
    return result


class SearchDto(BaseModel):
    chat_id: str = Field(None, title="Chat ID", description="Chat ID")
    limit: int = Field(100, gt=0, le=100, title="Limit", description="Limit")
    offset: int = Field(0, ge=0, title="Offset", description="Offset")


# get conversation history
@router.get("/conversation")
def conversation(
    query: Annotated[SearchDto, Query()],
    db: DuckdbDep,
):
    statement = select(Conversation).limit(query.limit).offset(query.offset)

    if query.chat_id:
        statement = statement.where(Conversation.chat_id == query.chat_id)

    result = db.exec(statement).all()

    result = [cov.model_dump() for cov in result]

    logger.debug(f"Conversation history: {result}")

    return JSONResponse(content={"data": jsonable_encoder(result), "code": 200})


@router.post("/cache/set")
def cache_init(id: str, value: str | None = None):
    result = chat_service.set_cache(id, value)

    return JSONResponse(content={"data": result, "code": 200})


@router.get("/cache/get")
def cache(request: Request, id: str):
    result = chat_service.get_cache(request, id)

    return JSONResponse(content={"data": result, "code": 200})
