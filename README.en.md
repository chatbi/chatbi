# ChatBI

[中文](README.md) | English

ChatBI is a BI system that uses AI to chat for analysis.

Principle analysis reference article: [ChatGPT Empowers Visualization Solution Exploration](https://zhuanlan.zhihu.com/p/631013261)

## Features

- Chat with AI to analyze data: support OpenAI, Tongyi(Qianwen), DeepSeek etc.
- 🔥 Use [Ant DesIgn X](https://x.ant.design/) for Chat UI
- 🚀 Use [AVA](https://github.com/antvis/AVA/) for data visualization

## Demo

![ava](./demos/ava.png)

## Preparation

### 1. Register an OpenAI Account

Register an account on [OpenAI](https://openai.com/) and obtain an API Key.

### 2. Prepare Environment


#### 2.1 Install Python Environment

To install the server, you need to have Python 3.10 or higher installed on your machine. You can download it from the [official website](https://www.python.org/downloads/).

After installing Python, you need to install the required pip dependencies manage tool uv, please refer to the [official website](https://docs.astral.sh/uv/getting-started/installation/). Or you can install it by running the following command:

```bash
# install uv
pip install uv
```

#### 2. Install Node.js Environment

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
# Install client dependencies
pnpm install

# Install server dependencies
uv sync
```

### 5. Start the database (optional)

For local development demonstration, you can start MySQL through docker:

```bash
make docker up
```

### 6. Run

1. Start the server:

```bash
make dev-server
```

2. Start the client:

```bash
make dev-client
```

## API Specification

The project's client API request definitions are located at `packages/client/src/services/api-schema.ts`. They are automatically generated from the server's [OpenAPI file](http://0.0.0.0:8000/openapi.json) using [openapi-typescript](https://openapi-ts.dev/).

The backend API specification file can be viewed at `http://0.0.0.0:8000/openapi.json` once the server is running.

If you have modified the backend APIs, you can regenerate the client API request definitions using the following command:

```bash
make gen-api
```

## License

[GPL-3.0 license](./LICENSE)