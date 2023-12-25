## ChatBI

中文 | [English](README.en.md)

ChatBI 是一个通过跟 AI 聊天来进行 BI 分析的系统。

原理分析参考文章：[ChatGPT助力可视化方案探索](https://zhuanlan.zhihu.com/p/631013261)

## 演示

![ava](./demos/ava.png)
![vega](./demos/vega.png)

## UI 界面

[chatbi-ui](https://github.com/chatbi/chatbi-ui)

## 准备

复制 `.env.example` 到 `.env` 并填写环境变量，如下：
  
```bash
# Database
OPENAI_API_BASE_URL=https://api.openai.com
OPENAI_API_KEY=xxx

# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
```

# MySQL
DB_CONNECTION=mysql://test:test@127.0.0.1:3306/test
```

## 安装环境要求

- Node.js >= 18

> 项目使用了 Node.js 中原生 `fetch` 方法，所以需要 Node.js >= 18，参考：https://nodejs.org/dist/latest-v18.x/docs/api/globals.html#fetch

## 安装

```bash
$ pnpm install
```

## 数据库

为了本地开发演示，可以通过 docker 启动 MySQL：

```bash
$ cd docker && docker-compose up -d
```

## 运行

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run dev

# production mode
$ pnpm run start:prod
```

## 灵感来源

- [dsensei](https://github.com/logunify/dsensei)
- [viz-gpt](https://github.com/ObservedObserver/viz-gpt)
