from fastapi import APIRouter

from chatbi.routers import chat, connector, cube

prefix = "/api/v1"

router = APIRouter(prefix=prefix)

router.include_router(connector.router)
router.include_router(chat.router)

# cube query
router.include_router(cube.router)
