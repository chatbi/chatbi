from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware


# from fastapi.concurrency import asynccontextmanager
from fastapi.responses import JSONResponse, RedirectResponse
from loguru import logger

from chatbi import routers
from chatbi.config import get_config
from chatbi.database.ducbdb import init_database as duckdb_init
from chatbi.database.postgres import init_database as postgres_init
from chatbi.middleware.request import RequestLoggerMiddleware
from chatbi.model import ConfigModel, UnprocessableEntityError

get_config().init_logger()


# init database data on startup
# @asynccontextmanager
# async def lifespan(app: FastAPI):
#     try:
#         print("Initializing database data")
#         duckdb_init(True)
#         postgres_init()
#         print("Database data initialized")
#         yield
#     finally:
#         pass

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:8001",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# TODO: use lifespan to init database data
@app.on_event("startup")
def on_startup():
    try:
        print("Initializing database data")
        duckdb_init(True)
        postgres_init()
        print("Database data initialized")
    finally:
        pass


app.include_router(routers.router)

app.add_middleware(RequestLoggerMiddleware)


# api document
@app.get("/")
async def root():
    return RedirectResponse(url="/docs")


# health check
@app.get("/health")
async def health():
    return JSONResponse(content={"status": "ok"})


# GET /config
@app.get("/config")
async def config():
    config = get_config()
    return JSONResponse(content=config.to_json())


# PATCH /config
@app.patch("/config")
async def update_config(cfg: ConfigModel):
    config = get_config()

    # only support update diagnose
    config.update(diagnose=cfg.diagnose)

    return JSONResponse(content=config.to_json())


# exception handler
@app.exception_handler(UnprocessableEntityError)
def unprocessable_entity_error_handler(request: Request, exc: UnprocessableEntityError):
    logger.error("Unprocessable entity error: {exc}", exc=exc)
    return JSONResponse(content={"message": str(exc)}, status_code=422)


@app.exception_handler(Exception)
def exception_handler(request: Request, exc: Exception):
    logger.opt(exception=exc).error("Internal server error")
    return JSONResponse(content={"message": "Internal server error"}, status_code=500)
