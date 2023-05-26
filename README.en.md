## ChatBI

[中文](./README.md) | English

ChatBI is a BI system interacted by chat.

## Demo

![ava](./demos/ava.png)
![vega](./demos/vega.png)

## Prepare

Copy `.env.example` to `.env` and fill in the environment variables, like below:
  
```bash
# Database
OPENAI_API_BASE_URL=https://api.openai.com
OPENAI_API_KEY=xxx

# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
```

For Chinese users, you can use [AIGCaaS](https://aigcaas.cn) instead of OpenAI, like below:

```bash
# aigcaas.cn platform secret key
AIGCAAS_SECRET_ID=<AIGCaaS SecretId>
AIGCAAS_SECRET_KEY=<AIGCaaS SecretKey>

# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
```

## Pre-installation

- Node.js >= 18

> Project uses the native `fetch` method in Node.js, so Node.js >= 18 is required, see: https://nodejs.org/dist/latest-v18.x/docs/api/globals.html#fetch

## Installation

```bash
$ pnpm install
```

## Database

For local development, you can start MySQL by docker:

```bash
$ cd docker && docker-compose up -d
```

## Running the app

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run start:dev

# production mode
$ pnpm run start:prod
```

## Inspired by

- [dsensei](https://github.com/logunify/dsensei)
- [viz-gpt](https://github.com/ObservedObserver/viz-gpt)