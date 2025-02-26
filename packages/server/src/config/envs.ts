import dotenv from 'dotenv';

dotenv.config();

interface Envs {
  OPENAI_API_KEY: string;
  OPENAI_API_BASE_URL?: string;
  OPENAI_MODEL?: string;

  DB_TYPE: string;
  DB_CONNECTION_URL: string;

  REDIS_HOST: string;
  REDIS_PORT: string;
  REDIS_DB: string;

  [key: string]: string | undefined;
}

export const envs = {
  ...process.env,
} as Envs;
