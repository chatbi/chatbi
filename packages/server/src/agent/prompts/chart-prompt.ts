export function getChartPrompt(
  question: string,
  chartSchema: string,
  sql: string,
  tableSchema?: string,
  few_shots: Chat.FewShot[] = [],
) {
  let initialPrompt = `You are a AntV G2Plot expert. Please help to generate a JSON to answer the question. Your response should ONLY be based on the given context and follow the response guidelines and format instructions. `;

  initialPrompt += `This is the TypeScript definitions for AntV G2Plot library chart configuration: 
  \`\`\`typescript
  ${chartSchema}
  \`\`\`
  `;

  // add sql query
  if (sql) {
    initialPrompt += `SQL Query: ${sql}. \n\n`;
  }

  // add table schema
  if (tableSchema) {
    initialPrompt += `Table Schema: ${tableSchema}. \n\n`;
  }

  // add response guidelines to prompt
  initialPrompt += `===Response Guidelines\n
  1. If the provided context is sufficient, please generate a valid JSON without any explanations for the question. 
  2. If the provided context is insufficient, please explain why it can't be generated.
  3. Please use the field names from the TypeScript definitions.
  4. If the question has been asked and answered before, please repeat the answer exactly as it was given before.
  5. Ensure that the output JSON is valid for interface ChartConfig type check.
  `;

  const messages = [
    {
      role: 'system',
      content: initialPrompt,
    },
  ];

  // add few shots to prompt
  for (const shot of few_shots) {
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
