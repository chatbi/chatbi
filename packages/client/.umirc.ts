import { defineConfig } from '@umijs/max';

export default defineConfig({
  mako: {},
  antd: {},
  access: {},
  model: {},
  initialState: {},
  request: {},
  layout: {
    title: 'ChatBI',
  },
  routes: [
    {
      path: '/',
      redirect: '/home',
    },
    {
      name: '首页',
      path: '/home',
      component: './Home',
    },
    {
      name: 'Playground',
      path: '/playground',
      component: './Playground',
    },

    {
      name: 'DataSource',
      path: '/data-source',
      component: './DataSource',
    },
  ],
  npmClient: 'pnpm',

  plugins: [require.resolve('@umijs/plugins/dist/unocss')],
  unocss: {
    // 检测 className 的文件范围，若项目不包含 src 目录，可使用 `pages/**/*.tsx`
    watch: ['src/**/*.tsx'],
  },

  define: {
    'process.env.UMI_APP_SERVER_URL': process.env.UMI_APP_SERVER_URL,
  },
});
