## ChatBI

中文 | [English](README.en.md)

ChatBI 是一个通过跟 AI 聊天来进行 BI 分析的系统。

原理分析参考文章：[ChatGPT助力可视化方案探索](https://zhuanlan.zhihu.com/p/631013261)

## 功能特点

- 通过 AI 聊天分析数据：支持 OpenAI、通义（千问）、DeepSeek 等
- 🔥 使用 [Ant Design X](https://x.ant.design/) 构建聊天界面
- 🚀 使用 [AVA](https://github.com/antvis/AVA/) 进行数据可视化

## 演示

![ava](./demos/ava.png)

## 准备

### 1. 注册 OpenAI 账号

注册 [OpenAI](https://openai.com/) 账号，获取 API Key

### 2. 环境准备


#### 2.1 安装 Python 环境
要安装服务端，你的机器上需要安装 Python 3.10 或更高版本。你可以从 [官方网页](https://www.python.org/downloads/) 下载。

安装 Python 后，你需要安装必需的 pip 依赖管理工具 uv，详情请参阅 [官方网页](https://docs.astral.sh/uv/getting-started/installation/)。或者你可以运行以下命令进行安装：

```bash
# 安装 uv
pip install uv
```

#### 2. 安装 Node.js 环境

参考：https://nodejs.org/en/learn/getting-started/how-to-install-nodejs

> 项目使用了 Node.js 中原生 `fetch` 方法，所以需要 `Node.js >= 18`，参考：https://nodejs.org/dist/latest-v18.x/docs/api/globals.html#fetch

安装好 Node.js 之后，安装 pnpm：

```bash
npm install -g pnpm
```

### 3. 服务端配置


在项目根目录，复制 `.env.example` 到 `.env` 并填写环境变量，如下：
  
```bash
# GPT 配置
LLM_API_BASE_URL=https://api.openai.com
LLM_API_KEY=xxx
LLM_MODEL=xxx

# database postgres
DB_HOST=localhost
DB_PORT=15432
DB_NAME=chatbi
DB_USER=chatbi
DB_PASS=12345

# cube service
CUBE_SERVICE_API=http://localhost:4000

```

### 3.1 服务端配置 - 阿里云灵积

如果你使用阿里云灵积，可以参考以下配置：

```bash
# GPT 配置
OPENAI_API_BASE_URL=https://dashscope.aliyuncs.com/compatible-mode
OPENAI_API_KEY=sk-xxx
OPENAI_MODEL=qwen-max

# database type
# ...
```

更多关于阿里云灵积的信息，参考：[阿里云灵积](https://help.aliyun.com/zh/dashscope/developer-reference/compatibility-of-openai-with-dashscope?spm=a2c4g.11186623.0.0.53ca2a9dia9CNJ)


### 4. 安装依赖

在项目根目录执行：
  
```bash
pnpm install
```

### 5. 启动数据库 (可选)

为了本地开发演示，可以通过 docker 启动 MySQL：

```bash
make docker up
```

### 6. 运行

1. 启动服务端：

```bash
make dev-server
```

2. 启动客户端：

```bash
make dev-client
```

3. 访问：http://localhost:8001

## 接口规范

本项目的客户端接口请求定义 `packages/client/src/services/api-schema.ts`，是通过 [openapi-typescript](https://openapi-ts.dev/) 请求服务端生成的 [openapi 文件](http://0.0.0.0:8000/openapi.json) 自动生成的。

后端接口规范定义文件，在服务端启动后，可以通过访问 `http://0.0.0.0:8000/openapi.json` 查看。

如果你修改了后端接口，可以通过以下命令重新生成客户端接口请求定义：

```bash
make gen-api
```

## 赞助

如果你觉得这个项目对你有帮助，欢迎赞助我：

<img width="300" src="https://static.sls.plus/wechat.jpg" alt="微信扫码支持"/>

## License

[GPL-3.0 license](./LICENSE)
