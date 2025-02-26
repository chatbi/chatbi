class AgentMessage:
    def __init__(
        self,
        name: str,
        id: str,
        answer: str,
        reason: str,
        reasoning: str,
        type: str = "text",
    ):
        self.name = name
        self.id = id
        self.answer = answer
        self.reason = reason
        self.reasoning = reasoning
        self.type = type

    def to_dict(self):
        return {
            "name": self.name,
            "id": self.id,
            "answer": self.answer,
            "reason": self.reason,
            "reasoning": self.reasoning,
            "type": self.type,
        }

    def __str__(self) -> str:
        return str(self.to_dict())
