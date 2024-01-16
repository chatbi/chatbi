import dotenv from 'dotenv';
import { readFileSync } from 'fs';

dotenv.config();

const pkg = JSON.parse(readFileSync('./package.json', { encoding: 'utf8' }));

export const config = {
  version: pkg.version,
  envs: process.env,
  // additional shared configuration
};
