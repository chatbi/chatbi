export function getSqlPrompt(
  question: string,
  tableSchema: string,
  dialect = 'MySQL',
  fewShots: Chat.FewShot[] = [],
) {
  let initialPrompt = `You are a ${dialect} expert. Please help to generate a SQL query to answer the question. Your response should ONLY be based on the given context and follow the response guidelines and format instructions. `;

  // add table schema to prompt
  initialPrompt += `Table schema: ${tableSchema}. \n\n`;

  // add response guidelines to prompt
  initialPrompt += `
    ===Response Guidelines
    1. If the provided context is sufficient, please generate a valid SQL query without any explanations for the question.
    2. If the provided context is almost sufficient but requires knowledge of a specific string in a particular column, please generate an intermediate SQL query to find the distinct strings in that column. Prepend the query with a comment saying intermediate_sql
    3. If the provided context is insufficient, please explain why it can't be generated.
    4. Please use the most relevant table(s).
    5. If the question has been asked and answered before, please repeat the answer exactly as it was given before.
    6. Ensure that the output SQL is ${dialect}-compliant and executable, and free of syntax errors.
  `;

  const messages: Chat.ChatgptMessage[] = [
    {
      role: 'system',
      content: initialPrompt,
    },
  ];

  // add few shots to prompt
  for (const shot of fewShots) {
    if (shot !== null) {
      if ('question' in shot && 'answer' in shot) {
        messages.push({
          role: 'user',
          content: shot.question,
        });

        messages.push({
          role: 'assistant',
          content: shot.answer,
        });
      }
    }
  }

  messages.push({
    role: 'user',
    content: question,
  });

  return messages;
}
