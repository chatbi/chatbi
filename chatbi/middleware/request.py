import time
import uuid

import orjson
from fastapi import Request
from loguru import logger
from starlette.middleware.base import BaseHTTPMiddleware


class RequestLoggerMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        with logger.contextualize(request_id=str(uuid.uuid4())):
            start_time = time.time()
            logger.info("{method} {path}", method=request.method, path=request.url.path)
            logger.info("Request params: {params}", params=dict(request.query_params))

            body = await request.body()
            if body:
                json_obj = orjson.loads(body)

                body = orjson.dumps(json_obj)

            logger.info("Request body: {body}", body=body.decode("utf-8"))

            try:
                return await call_next(request)
            except Exception as e:
                logger.opt(exception=e).error("Request failed")
                raise e
            finally:
                end_time = time.time()
                # duration in milliseconds, keep 3 decimal places
                duration = round((end_time - start_time) * 1000, 3)
                logger.info(
                    f"Request finished in {duration} ms",
                )
                logger.info("Request finished")
