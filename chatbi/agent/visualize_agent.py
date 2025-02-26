import os

import dspy
import pydantic_core
from loguru import logger

from chatbi.agent.agent_message import AgentMessage
from chatbi.agent.llm import LLM
from chatbi.agent.presets.chat_schema import ChartConfig
from chatbi.agent.prompts.chart_prompt import get_chart_prompt, get_repair_prompt
from chatbi.agent.validator.result import Failure, Success
from chatbi.agent.validator.type_validator import TypeValidator

dspy.enable_logging()


class VisualizeSignature(dspy.Signature):
    """Signature for the generate visualize method."""

    messages: list[dict] = dspy.InputField()
    answer: str = dspy.OutputField()
    reason = dspy.OutputField()


class VisualizeAgent:
    chart_schema_path = os.path.join(
        os.path.dirname(__file__), "presets/chart_schema.ts"
    )
    chart_schema: str | None = None

    # The maximum number of repair attempts to make before giving up.
    _max_repair_attempts = 1

    def __init__(self, name="ChartAgent"):
        self.name = name

        # initialize the LLM model
        LLM["openai"].get_model()

    def get_chart_scheme(self):
        if self.chart_schema is not None:
            return self.chart_schema

        with open(self.chart_schema_path) as f:
            chart_schema = f.read()

        self.chart_schema = chart_schema

        return chart_schema

    def reply(
        self,
        id: str,
        question: str,
        sql: str | None = None,
        table_schema: str | None = None,
    ) -> AgentMessage:
        logger.debug(f"[{self.name}]: infer sql")

        num_repairs_attempted = 0

        chart_scheme = self.get_chart_scheme()

        logger.debug(f"[{self.name}]: chart_scheme: {chart_scheme}")

        infer = dspy.ChainOfThought(VisualizeSignature)

        messages = get_chart_prompt(
            question=question,
            chart_schema=chart_scheme,
            sql=sql,
            table_schema=table_schema,
        )

        logger.debug(f"[{self.name}]: messages: {messages}")

        # validate the json type
        dsl_validator = TypeValidator(ChartConfig)
        response = None

        while True:
            error_message: str
            try:
                # response = self.model.llm(messages=messages)
                response = infer(messages=messages)

                source_json = response["answer"]
                logger.debug(f"Source json data type: {type(source_json)}")
                parsed_json = pydantic_core.from_json(
                    source_json, allow_inf_nan=False, cache_strings=False
                )
            except ValueError as e:
                error_message = f"Error: {e}\n\nAttempted to parse:\n\n{source_json}"

            else:
                result = dsl_validator.validate_object(parsed_json)

                if isinstance(result, Success):
                    response["answer"] = parsed_json
                    break

                error_message = result.message

            if num_repairs_attempted >= self._max_repair_attempts:
                response["error"] = Failure(error_message)
                break

            num_repairs_attempted += 1

            messages.append(
                {
                    "role": "assistant",
                    "content": source_json,
                }
            )
            messages.append(
                {
                    "role": "user",
                    "content": get_repair_prompt(error_message),
                }
            )

        logger.debug(f"[{self.name}]: response: {response}")

        return AgentMessage(
            name=self.name,
            id=id,
            answer=response["answer"],
            reason=response["reason"],
            reasoning=response["reasoning"],
            type="visualize",
        )
