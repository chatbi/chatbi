def get_sql_prompt(
    question: str,
    table_schema: str,
    initial_prompt: str | None = None,
    few_shots: list = [],
    dialect: str = "PostgreSQL",
    **kwargs,
):
    """Example:

    ```python
    get_sql_prompt(
        question="What are the top 10 customers by sales?",
        few_shots=[{"question": "What are the top 10 customers by sales?", "sql": "SELECT * FROM customers ORDER BY sales DESC LIMIT 10"}],
        table_schema="[{'name':'orders','measures':[{'name':'orders.count','type':'number'},{'name':'orders.number','type':'number'}],'dimensions':[{'name':'orders.id','type':'number'}]]",
    ).

    ```

    This method is used to generate a prompt for the LLM to generate SQL.

    Args:
        initial_prompt (str): The initial prompt for the LLM.
        question (str): The question to generate SQL for.
        few_shots (list): A list of questions and their corresponding SQL statements.
        table_schema (list): A list of DDL statements.
        dialect (str): The SQL dialect to use.
        kwargs: Additional keyword arguments.

    Returns:
        any: The prompt for the LLM to generate SQL.
    """

    if initial_prompt is None:
        initial_prompt = f"You are a {dialect} expert. Please help to generate a SQL query to answer the question. Your response should ONLY be based on the given context and follow the response guidelines and format instructions. "

    # add table schema to prompt
    initial_prompt += f"Table schema: {table_schema}. \n\n"

    # add response guidelines to prompt
    initial_prompt += (
        "===Response Guidelines \n"
        "1. If the provided context is sufficient, please generate a valid SQL query without any explanations for the question. \n"
        "2. If the provided context is almost sufficient but requires knowledge of a specific string in a particular column, please generate an intermediate SQL query to find the distinct strings in that column. Prepend the query with a comment saying intermediate_sql \n"
        "3. If the provided context is insufficient, please explain why it can't be generated. \n"
        "4. Please use the most relevant table(s). \n"
        "5. If the question has been asked and answered before, please repeat the answer exactly as it was given before. \n"
        f"6. Ensure that the output SQL is {dialect}-compliant and executable, and free of syntax errors. \n"
    )

    messages = [
        {
            "role": "system",
            "content": initial_prompt,
        }
    ]

    # add few shots to prompt
    for shot in few_shots:
        if shot is not None:
            if "question" in shot and "sql" in shot:
                messages.append(
                    {
                        "role": "user",
                        "content": shot["question"],
                    }
                )

                messages.append(
                    {
                        "role": "assistant",
                        "content": shot["sql"],
                    }
                )

    messages.append(
        {
            "role": "user",
            "content": question,
        }
    )

    return messages
