import dspy
import orjson
from loguru import logger

from chatbi.agent.agent_message import (
    AgentMessage,
)
from chatbi.agent.llm import LLM

dspy.enable_logging()

"""
SchemaAgent class

This class is responsible for handling the schema of the data.
"""


class SchemaSignature(dspy.Signature):
    """Signature for the get_schema method."""

    context: str = dspy.InputField(
        desc="The context of the question with all table schemas."
    )
    question: str = dspy.InputField()
    answer: list[str] = dspy.OutputField(
        desc="The relative table schemas for the question."
    )
    reason: str = dspy.OutputField()


class SchemaAgent:
    def __init__(self, name="SchemaAgent"):
        self.name = name
        # initialize the LLM model
        LLM["openai"].get_model()

    def reply(self, id: str, question: str, table_schema: str) -> AgentMessage:
        logger.debug("[SchemaAgent]: infer schema")
        infer = dspy.ChainOfThought(SchemaSignature)

        context = f"All table schemas: {table_schema}"

        response = infer(context=context, question=question)
        logger.debug(f"[SchemaAgent]: response: {response}")

        tables = response["answer"]
        reason = response["reason"]
        reasoning = response["reasoning"]

        table_schema_list = orjson.loads(table_schema)

        retrieval_table_schema = [
            dict(table) for table in table_schema_list if table["name"] in tables
        ]

        msg = AgentMessage(
            name=self.name,
            id=id,
            type="schema",
            answer=retrieval_table_schema,
            reason=reason,
            reasoning=reasoning,
        )

        logger.debug(f"[SchemaAgent]: {msg}")

        return msg
