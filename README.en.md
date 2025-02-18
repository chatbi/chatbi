## ChatBI

[中文](README.md) | English

ChatBI is a BI system that uses AI to chat for analysis.

Principle analysis reference article: [ChatGPT Empowers Visualization Solution Exploration](https://zhuanlan.zhihu.com/p/631013261)


## Demo

![ava](./demos/ava.png)
![vega](./demos/vega.png)

## Preparation

### 1. Register an OpenAI Account

Register an account on [OpenAI](https://openai.com/) and obtain an API Key.

### 2. Install Node.js Environment

Refer to: https://nodejs.org/en/learn/getting-started/how-to-install-nodejs

> The project uses the native `fetch` method in Node.js, so `Node.js >= 18` is required. Refer to: https://nodejs.org/dist/latest-v18.x/docs/api/globals.html#fetch

After installing Node.js, install pnpm:

```bash
npm install -g pnpm
```

### 3. Server Configuration


Go to the `server` directory, copy `.env.example` to `.env`, and fill in the environment variables as follows:
  
```bash
# Database
OPENAI_API_BASE_URL=https://api.openai.com
OPENAI_API_KEY=xxx

# database type
DB_TYPE=mysql
# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
```

### 4. Install dependencies

In the project root directory, execute:
  
```bash
pnpm install
```

### 5. Start the database (optional)

For local development demonstration, you can start MySQL through docker:

```bash
cd ./docker && docker compose up -d
```

### 6. Run

1. Start the server:

```bash
$ pnpm run dev:server
```

2. Start the client:

```bash
$ pnpm run dev:client
```
