def get_chart_prompt(
    question: str,
    chart_schema: str,
    sql: str,
    table_schema: str,
    initial_prompt: str | None = None,
    chart_sdk: str = "antv g2plot",
    few_shots: list = [],
    **kwargs,
):
    """Example:

    TODO: Add example

    This method is used to generate a prompt for the LLM to generate chart spec

    Args:
        initial_prompt (str): The initial prompt for the LLM.
        question (str): The question to generate chart spec for.
        chart_schema (str): The chart schema.
        chart_sdk (str): The chart SDK to use.
        sql (str): The SQL query to generate chart spec for.
        table_schema (str): The table schema.
        few_shots (list): A list of questions and their corresponding chart specs.
        kwargs: Additional keyword arguments.

    Returns:
        any: The prompt for the LLM to generate chart spec.
    """

    if initial_prompt is None:
        initial_prompt = f"You are a {chart_sdk} expert. Please help to generate a JSON to answer the question. Your response should ONLY be based on the given context and follow the response guidelines and format instructions. "

    initial_prompt += f"""This is the TypeScript definitions for AntV G2Plot library chart configuration: \n```typescript\n
    {chart_schema}
    ```"""

    # add sql query
    if sql:
        initial_prompt += f"SQL Query: {sql}. \n\n"

    # add table schema
    if table_schema:
        initial_prompt += f"Table Schema: {table_schema}. \n\n"

    # add response guidelines to prompt
    initial_prompt += """===Response Guidelines\n
    1. If the provided context is sufficient, please generate a valid JSON without any explanations for the question. \n
    2. If the provided context is insufficient, please explain why it can't be generated. \n
    3. Please use the field names from the TypeScript definitions. \n
    4. If the question has been asked and answered before, please repeat the answer exactly as it was given before. \n
    5. Ensure that the output JSON is valid for interface ChartConfig type check\n
    """

    messages = [
        {
            "role": "system",
            "content": initial_prompt,
        }
    ]

    # add few shots to prompt
    for shot in few_shots:
        if shot is not None:
            if "question" in shot and "spec" in shot:
                messages.append(
                    {
                        "role": "user",
                        "content": shot["question"],
                    }
                )

                messages.append(
                    {
                        "role": "assistant",
                        "content": shot["spec"],
                    }
                )

    messages.append(
        {
            "role": "user",
            "content": question,
        }
    )

    return messages


def get_repair_prompt(
    validation_error: str,
    **kwargs,
):
    prompt = f"""
    The above JSON object is invalid for the following reason:
    '''
    {validation_error}
    '''
    The following is a revised JSON object:
    """
    return prompt
