import re

from loguru import logger


def extract_sql(md_str: str) -> str:
    r"""Extracts the SQL query from the LLM response.

    Example:
    ```python
    extract_sql("Here's the SQL query in a code block: ```sql\nSELECT * FROM customers\n```")
    ```

    Extracts the SQL query from the LLM response. This is useful in case the LLM response contains other information besides the SQL query.
    Override this function if your LLM responses need custom extraction logic.

    Args:
        md_str (str): The LLM response.

    Returns:
        str: The extracted SQL query.
    """

    # If the md_str contains a CTE (with clause), extract the last sql between WITH and ;
    sqls = re.findall(r"\bWITH\b .*?;", md_str, re.DOTALL)
    if sqls:
        sql = sqls[-1]
        logger.debug(title="Extracted SQL", message=f"{sql}")
        return sql

    # If the md_str is not markdown formatted, extract last sql by finding select and ; in the response
    sqls = re.findall(r"SELECT.*?;", md_str, re.DOTALL)
    if sqls:
        sql = sqls[-1]
        logger.debug(title="Extracted SQL", message=f"{sql}")
        return sql

    # If the md_str contains a markdown code block, with or without the sql tag, extract the last sql from it
    sqls = re.findall(r"```sql\n(.*)```", md_str, re.DOTALL)
    if sqls:
        sql = sqls[-1]
        logger.debug(title="Extracted SQL", message=f"{sql}")
        return sql

    sqls = re.findall(r"```(.*)```", md_str, re.DOTALL)
    if sqls:
        sql = sqls[-1]
        logger.debug(title="Extracted SQL", message=f"{sql}")
        return sql

    return md_str
