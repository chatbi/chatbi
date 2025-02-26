import type { components } from '../api-schema';
import { client } from '../client';

export async function generateSql(question: string) {
  const {
    data, // only present if 2XX response
    error, // only present if 4XX or 5XX response
  } = await client.POST('/api/v1/chat/generate_sql', {
    body: {
      question,
    },
  });

  if (error) {
    throw error;
  }

  return data as components['schemas']['CommonResponse'];
}

export async function runSql(id: string, sql: string) {
  const {
    data, // only present if 2XX response
    error, // only present if 4XX or 5XX response
  } = await client.POST('/api/v1/chat/run_sql', {
    body: {
      id,
      sql,
    },
  });

  if (error) {
    throw error;
  }

  return data as components['schemas']['RunSqlResponse'];
}

export async function generateVisualize(id: string) {
  const {
    data, // only present if 2XX response
    error, // only present if 4XX or 5XX response
  } = await client.POST('/api/v1/chat/generate_visualize', {
    body: {
      id,
    },
  });

  if (error) {
    throw error;
  }

  return data as components['schemas']['CommonResponse'];
}
