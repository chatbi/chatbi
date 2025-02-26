import os

import dspy
from dotenv import load_dotenv

from chatbi.agent.llm.base_llm import BaseLLM

# from openai import OpenAI
# from openai.types.chat import ChatCompletion
# from litellm.types.utils import TextCompletionResponse


class OpenaiModel(BaseLLM):
    name: str = "openai"

    def __init__(self):
        load_dotenv()

        self.api_key = os.getenv("LLM_API_KEY")
        self.base_url = os.getenv("LLM_BASE_URL", "https://api.openai.com/v1")
        self.model = os.getenv("LLM_MODEL", "qwen-max")

        self.llm = dspy.LM(
            model=f"openai/{self.model}", api_key=self.api_key, api_base=self.base_url
        )
        dspy.configure(lm=self.llm, suppress_debug_info=True)
        dspy.enable_logging()

    # def chat(self, prompt: str) -> TextCompletionResponse:
    #     qa = dspy.Predict('question: str -> response: str')

    #     return qa(
    #         messages=[
    #             {"role": "system", "content": "You are a helpful assistant."},
    #             {"role": "user", "content": prompt},
    #         ],
    #         top_p=1,
    #         temperature=0,
    #         stream=False,
    #     )
