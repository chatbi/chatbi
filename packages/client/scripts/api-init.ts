import { exec } from 'node:child_process';
import { join } from 'node:path';
// import { readFileSync, writeFileSync } from 'node:fs';

const projectRoot = join(__dirname, '../');

// openapi schema url
const schemaUrl = 'http://0.0.0.0:8000/openapi.json';

export async function runEslint() {
  const lintPath = join(projectRoot, 'src');

  const cmd = `eslint ${lintPath} --fix`;
  console.log(`Running eslint`);

  exec(cmd, (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
  });
}

export async function apiInit() {
  const outputPath = join(projectRoot, 'src/services/api-schema.ts');
  const cmd = `openapi-typescript ${schemaUrl} --output ${outputPath}`;
  console.log(`Generating api schema from ${schemaUrl} to ${outputPath}`);

  exec(cmd, (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
  });
}
