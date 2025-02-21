## ChatBI

中文 | [English](README.en.md)

ChatBI 是一个通过跟 AI 聊天来进行 BI 分析的系统。

原理分析参考文章：[ChatGPT助力可视化方案探索](https://zhuanlan.zhihu.com/p/631013261)

## 演示

![ava](./demos/ava.png)
![vega](./demos/vega.png)

## 准备

### 1. 注册 OpenAI 账号

注册 [OpenAI](https://openai.com/) 账号，获取 API Key

### 2. 安装 Node.js 环境

参考：https://nodejs.org/en/learn/getting-started/how-to-install-nodejs

> 项目使用了 Node.js 中原生 `fetch` 方法，所以需要 `Node.js >= 18`，参考：https://nodejs.org/dist/latest-v18.x/docs/api/globals.html#fetch

安装好 Node.js 之后，安装 pnpm：

```bash
npm install -g pnpm
```

### 3. 服务端配置


进入 `server` 目录，复制 `.env.example` 到 `.env` 并填写环境变量，如下：
  
```bash
# GPT 配置
OPENAI_API_BASE_URL=https://api.openai.com
OPENAI_API_KEY=xxx
OPENAI_MODEL=xxx

# database type
DB_TYPE=mysql
# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
```

### 3.1 服务端配置 - 阿里云灵积

如果你使用阿里云灵积，可以参考以下配置：

```bash
# GPT 配置
OPENAI_API_BASE_URL=https://dashscope.aliyuncs.com/compatible-mode
OPENAI_API_KEY=sk-xxx
OPENAI_MODEL=qwen-max

# database type
DB_TYPE=mysql
# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
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
cd ./docker && docker compose up -d
```

### 6. 运行

1. 启动服务端：

```bash
$ pnpm run dev:server
```

2. 启动客户端：

```bash
$ pnpm run dev:client
```

## 赞助

如果你觉得这个项目对你有帮助，欢迎赞助我：

<img width="300" src="https://static.sls.plus/wechat.jpg" alt="微信扫码支持"/>

## License

[GPL-3.0 license](./LICENSE)
