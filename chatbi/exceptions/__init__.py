class ImproperlyConfigured(Exception):
    """Raise for incorrect configuration."""


class DependencyError(Exception):
    """Raise for missing dependencies."""


class ConnectionError(Exception):
    """Raise for connection"""


class OTPCodeError(Exception):
    """Raise for invalid otp or not able to send it"""


class SQLRemoveError(Exception):
    """Raise when not able to remove SQL"""


class ExecutionError(Exception):
    """Raise when not able to execute Code"""


class ValidationError(Exception):
    """Raise for validations"""


class APIError(Exception):
    """Raise for API errors"""
