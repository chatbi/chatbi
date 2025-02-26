import os

from loguru import logger
from openai import OpenAI
from openai.types.chat import ChatCompletion

from chatbi.model.chat import CreateCompletionsDTO


class LLMService:
    def completions(self, body: CreateCompletionsDTO):
        # proxy request to tongyi completions api
        api_key = os.getenv("LLM_API_KEY")
        base_url = os.getenv(
            "LLM_BASE_URL", "https://dashscope.aliyuncs.com/compatible-mode/v1"
        )
        model = os.getenv("LLM_MODEL", "qwen-max")

        client = OpenAI(
            api_key=api_key,
            base_url=base_url,
        )

        completion: ChatCompletion = client.chat.completions.create(
            model=model,
            messages=body.messages,
            n=body.n,
            temperature=body.temperature,
        )
        result = completion.model_dump()
        logger.debug(f"Completion result: {result}")
        return result


llm_service = LLMService()
