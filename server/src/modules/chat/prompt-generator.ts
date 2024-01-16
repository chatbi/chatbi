export function generateSqlPrompt(
  dataSourceType: string,
  tableSchemas: Database.TableSchema[],
) {
  const sqlPrompt = `I will give you a list of ${dataSourceType} tables schemas in JSON format, and some instructions.
Then I will ask you some questions about tables provided like Question: {question}. You might need to join tables to answer the questions.

Below is the format:
  Table Schema: (JSON array)
  Instructions: (sentences)

Table Schema:
  ${JSON.stringify(tableSchemas)}

`;

  const instructions = `
Instructions:
  * The table in the where clause appear in the tables or temp tables you selected from.
  * Use FORMAT_DATE(), DO NOT use DATE_TRUNC().
  * Convert TIMESTAMP to DATE using DATE().
  * Use full column name including the table name.
  * You can ONLY read, cannot UPDATE or DELETE or MAKE ANY CHANGES to the data.
  * It is Okay to make assumptions to answer the question.
  * DO NOT use any field not included in schemas.
  * Keep the assumptions concise.
  * You should return assumptions and PLAIN TEXT ${dataSourceType} query for the question ONLY, NO explanation, NO markdown.
  * Use UNNEST() for ARRAY field.
  * Wrap table name with \`\`
  * NO content after the query.
  * Table name in the query should be without database name.

  Use the following format for response:
    Database: (string)
    Table Name: (string)
    Assumptions: (bullets)
    Query: (query)
`;

  return (
    sqlPrompt +
    instructions +
    '\n\nRespond I understand to start the conversation.'
  );
}

export function generateVegaPrompt(fields: Chat.Metadata[]) {
  const vegaPrompt = `You are the best assistant in the world for data visualization using vega-lite. I will give you metadatas which contain field name and data type for the dataset in JSON format, and some instructions.
And I will ask you some questions like Question: {question}. You should generate the vega-lite specification based on the question.

Below is the format:
  Instructions: (sentences)
  Metadatas: (JSON array)
`;
  const instructions = `Instructions:
  * You should return vega-lite specification for the question ONLY, NO explanation, NO markdown.
  * You can aggregate the field if it is quantitative and the chart type is one of bar, line, area.
  * You need to use more than one field in the metadatas for encoding field.
  * Do not ask for more information.
  * You can make assumptions to answer the question.
  * You can use any chart type and encoding.
  * You can image the data depends on the metadatas.

  Use the following format for response:
    Vega-lite specification: 
    \`\`\`
    (JSON string)
    \`\`\`
Metadatas:
  ${JSON.stringify(fields)}
    `;

  return (
    vegaPrompt +
    instructions +
    '\n\nRespond I understand to start the conversation.'
  );
}
