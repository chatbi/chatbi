from __future__ import annotations

from chatbi.model import UnprocessableEntityError
from chatbi.model.connector import Connector
from chatbi.model.rewriter import Rewriter

rules = ["column_is_valid"]


class Validator:
    def __init__(self, connector: Connector, rewriter: Rewriter):
        self.connector = connector
        self.rewriter = rewriter

    def validate(self, rule: str, parameters: dict[str, str]):
        if rule not in rules:
            raise RuleNotFoundError(rule)

        try:
            getattr(self, f"_validate_{rule}")(parameters)
        except ValidationError as e:
            raise e
        except Exception as e:
            raise ValidationError(f"Unknown exception: {type(e)}, message: {e!s}")

    def _validate_column_is_valid(self, parameters: dict[str, str]):
        model_name = parameters.get("modelName")
        column_name = parameters.get("columnName")
        if model_name is None:
            raise MissingRequiredParameterError("modelName")
        if column_name is None:
            raise MissingRequiredParameterError("columnName")

        try:
            sql = f"SELECT {column_name} FROM {model_name} LIMIT 1"
            rewritten_sql = self.rewriter.rewrite(sql)
            self.connector.dry_run(rewritten_sql)
        except Exception as e:
            raise ValidationError(f"Exception: {type(e)}, message: {e!s}")


class ValidationError(UnprocessableEntityError):
    pass


class RuleNotFoundError(ValidationError):
    def __init__(self, rule: str):
        super().__init__(f"The rule `{rule}` is not in the rules, rules: {rules}")


class MissingRequiredParameterError(ValidationError):
    def __init__(self, parameter: str):
        super().__init__(f"Missing required parameter: `{parameter}`")
