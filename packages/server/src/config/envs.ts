import dotenv from 'dotenv';

dotenv.config();

interface Envs {
  OPENAI_API_KEY: string;
  OPENAI_API_BASE_URL?: string;
  OPENAI_MODEL?: string;

  [key: string]: string | undefined;
}

export const envs = {
  ...process.env,
} as Envs;
