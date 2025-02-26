# from abc import ABC, abstractmethod

# from openai import OpenAI
# from openai.types.chat import ChatCompletion

import dspy

# from litellm.types.utils import TextCompletionResponse


class BaseLLM:
    name: str
    api_key: str
    base_url: str
    model: str

    llm: dspy.LM | None = None
