import dotenv from 'dotenv';

dotenv.config();

export const envs = {
  ...process.env,
};
