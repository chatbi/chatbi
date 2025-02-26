import logging
import sys

from dotenv import load_dotenv
from loguru import logger

logging.getLogger("uvicorn.error").disabled = True

logger_format = (
    "<green>{time:YYYY-MM-DD HH:mm:ss.SSS}</green> | "
    "<yellow>[{extra[request_id]}]</yellow> | "
    "<level>{level: <8}</level> | "
    "<cyan>{module}.{function}:{line}</cyan> - <level>{message}</level>"
)

default_request_id = "INIT"


class Config:
    def __init__(self):
        load_dotenv()

        self.diagnose = False
        self.init_logger()

    @staticmethod
    def init_logger():
        logger.configure(extra={"request_id": default_request_id})  # Default values
        logger.remove()
        logger.add(
            sys.stderr,
            format=logger_format,
            backtrace=False,
            diagnose=False,
            enqueue=False,
        )
        logger.add(
            "runs/run.log",
            format=logger_format,
            backtrace=False,
            diagnose=False,
            enqueue=True,
            rotation="1 week",
            retention="1 month",
            level="DEBUG",
        )

    @staticmethod
    def logger_diagnose():
        logger.configure(extra={"request_id": default_request_id})  # Default values
        logger.remove()
        logger.add(
            sys.stderr,
            format=logger_format,
            backtrace=True,
            diagnose=True,
            enqueue=True,
        )

    def update(self, diagnose: bool = False):
        self.diagnose = diagnose
        if diagnose:
            self.logger_diagnose()
        else:
            self.init_logger()

    # custom json encoder
    def to_json(self):
        return {
            "diagnose": self.diagnose,
        }


config = Config()


def get_config() -> Config:
    return config
