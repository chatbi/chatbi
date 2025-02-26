from enum import Enum, StrEnum, auto

from chatbi.agent.llm.base_llm import BaseLLM
from chatbi.agent.llm.openai import OpenaiModel


class LLM(StrEnum):
    openai = auto()

    def get_model(self) -> BaseLLM:
        try:
            return getattr(LLMExtension, self.name).model
        except KeyError:
            raise NotImplementedError(f"Unsupported LLM: {self}")


class LLMExtension(Enum):
    openai = OpenaiModel

    @property
    def model(self) -> BaseLLM:
        return getattr(self, f"get_{self.name}_model")()

    @staticmethod
    def get_openai_model() -> OpenaiModel:
        return OpenaiModel()
