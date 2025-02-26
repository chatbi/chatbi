from __future__ import annotations

from collections.abc import Iterable
from typing import Optional

from openai.types.chat import ChatCompletionMessageParam
from pydantic import BaseModel, Field


class ChatDTO(BaseModel):
    question: str = Field(str, title="Text", description="User input chat message")

    id: str | None = Field(
        None,
        title="Chat ID",
        description="Chat id, default is None, Used for tracking the conversation, if is None, it will be a new conversation",
    )

    visualize: bool | None = Field(
        None,
        title="Visualize",
        description="Visualize the SQL result, default is None, if is None, it will not visualize the SQL result",
    )

    table_schema: str | None = Field(
        None,
        title="Table Schema",
        description="Table schema, default is None, Used for tracking the conversation, if is None, it will be a new conversation",
    )


class GenerateSqlRequest(BaseModel):
    """Generate sql request params"""

    question: str = Field(str, title="Text", description="User input chat message")

    id: str | None = Field(
        None,
        title="Chat ID",
        description="Chat id, default is None, Used for tracking the conversation, if is None, it will be a new conversation",
    )

    # visualize: bool | None = Field(
    #     None,
    #     title="Visualize",
    #     description="Visualize the SQL result, default is None, if is None, it will not visualize the SQL result",
    # )


class RunSqlRequest(BaseModel):
    """Run sql request params"""

    id: str = Field(
        None,
        title="Chat ID",
        description="Chat id, default is None, Used for tracking the conversation, if is None, it will be a new conversation",
    )
    sql: str | None = Field(
        None,
        title="SQL",
        description="SQL query, default is None, if is None, it will get the SQL query from the previous step",
    )


class GenerateVisualizeRequest(BaseModel):
    """Run sql request params"""

    id: str = Field(
        None,
        title="Chat ID",
        description="Chat id, default is None, Used for tracking the conversation, if is None, it will be a new conversation",
    )
    data: list | None = Field(
        None,
        title="Data",
        description="Data for visualization",
    )


class AgentMessageDTO(BaseModel):
    name: str
    id: str
    answer: str | dict
    reason: str
    reasoning: str
    type: str


class RunSqlData(BaseModel):
    data: str
    should_visualize: bool


class RunSqlResponse(BaseModel):
    """Run SQL response model"""

    data: RunSqlData
    code: int


class CommonResponse(BaseModel):
    """Common response model"""

    data: AgentMessageDTO
    code: int


class CreateCompletionsDTO(BaseModel):
    messages: Iterable[ChatCompletionMessageParam]
    n: Optional[int] | None = 1
    temperature: Optional[float] | None = 0
