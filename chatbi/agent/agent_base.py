from chatbi.agent.agent_message import AgentMessage


class AgentBase:
    def __init__(self, name: str):
        self.name = name

    @classmethod
    def replay(self, **kwargs) -> AgentMessage:
        pass
