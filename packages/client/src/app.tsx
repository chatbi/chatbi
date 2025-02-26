// 运行时配置

import { RequestConfig, RunTimeLayoutConfig } from '@umijs/max';
import './global.less';

// 全局初始化数据配置，用于 Layout 用户信息和权限初始化
// 更多信息见文档：https://umijs.org/docs/api/runtime-config#getinitialstate
export async function getInitialState(): Promise<{ name: string }> {
  return { name: 'ChatBI' };
}

// ProLayout 支持的api https://procomponents.ant.design/components/layout
export const layout: RunTimeLayoutConfig = ({
  initialState,
  setInitialState,
}) => {
  return {
    onPageChange: () => {
      // 如果是登录页面，不执行
    },

    menuHeaderRender: undefined,
    // 自定义 403 页面
    // unAccessible: <div>unAccessible</div>,
    // 增加一个 loading 的状态
    childrenRender: (children, props) => {
      // if (initialState?.loading) return <PageLoading />;
      return <>{children}</>;
    },
    contentStyle: {
      height: '100vh',
    },

    settings: {},
  };
};

console.log('UMI_APP_SERVER_URL', process.env.UMI_APP_SERVER_URL);

export const request: RequestConfig = {
  // timeout 10 mins
  timeout: 600000,
  baseURL: process.env.UMI_APP_SERVER_URL
    ? process.env.UMI_APP_SERVER_URL
    : '/',
  // other axios options you want
  errorConfig: {
    errorHandler() {
      // noop
    },
    errorThrower() {
      // noop
    },
  },
  requestInterceptors: [],
  responseInterceptors: [],
};
