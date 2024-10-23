export type IFieldType = 'quantitative' | 'nominal' | 'ordinal' | 'temporal';

export function getFieldType(field: string, type: string) {
  if (field.includes('id')) {
    return 'nominal';
  }
  if (field.includes('time') || field.includes('date')) {
    return 'temporal';
  }
  if (field.includes('percentile')) {
    return 'quantitative';
  }
  if (field.includes('rank')) {
    return 'ordinal';
  }
  if (field.includes('type')) {
    return 'nominal';
  }
  if (field.includes('name')) {
    return 'nominal';
  }
  if (field.includes('status')) {
    return 'nominal';
  }
  if (field.includes('level')) {
    return 'ordinal';
  }
  if (
    field.includes('count') ||
    field.includes('sum') ||
    field.includes('avg') ||
    field.includes('min') ||
    field.includes('max')
  ) {
    return 'quantitative';
  }
  if (
    field.includes('rate') ||
    field.includes('percent') ||
    field.includes('ratio')
  ) {
    return 'quantitative';
  }
  if (type.includes('char')) {
    return 'nominal';
  }
  if (
    type.includes('int') ||
    type.includes('float') ||
    type.includes('num') ||
    type.includes('double') ||
    type.includes('decimal')
  ) {
    return 'quantitative';
  }
  return 'nominal';
}

export function getTableName(text: string): string | undefined {
  const match = /table named [`"](\w*)[`"]/s.exec(text);
  const match2 = /["`](\w*)["`] table/s.exec(text);
  const match3 = /["`](\w*)["`]/s.exec(text);
  const match4 = /["`][\w]+\.(\w*)["`]/s.exec(text);
  const match5 = /Table Name:\s+(\w*)\n/s.exec(text);

  if (match5) {
    return match5[1].trim();
  } else if (match != null) {
    return match[1].trim();
  } else if (match2 != null) {
    return match2[1].trim();
  } else if (match3 != null) {
    return match3[1].trim();
  } else if (match4 != null) {
    return match4[1].trim();
  } else {
    return undefined;
  }
}

export function getDatabaseName(text: string): string | undefined {
  const match5 = /Database:\s+(\w*)\n/s.exec(text);

  if (match5) {
    return match5[1].trim();
  } else {
    return undefined;
  }
}

export function getQuerySql(text: string): string | null {
  // Get query from code block
  const regex = /```(\w+)?\s([\s\S]+?)```/;
  const match = text.match(regex);
  if (match != null) {
    return match[2];
  }

  // If no code block, try to get query from text
  if (!text.includes('```') && text.includes('SELECT')) {
    const start = text.indexOf('SELECT');
    return text.substring(start);
  }
  return null;
}

export function getAssumptions(text: string): string | undefined {
  const match = /Assumptions:(.*)Query:/s.exec(text);
  if (match != null) {
    return match[1].trim();
  } else {
    return null;
  }
}

export function getVegaSpec(text: string): string | undefined {
  const regex = /```(\w+)?\s([\s\S]+?)```/;
  const match = text.match(regex);
  console.log('match', match);

  if (match != null) {
    return match[2];
  }
  return null;
}
