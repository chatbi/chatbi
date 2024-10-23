/* eslint-disable */
// 该文件由 OneAPI 自动生成，请勿手动修改！
import { request } from '@umijs/max';

/** 此处后端没有提供注释 POST /chat */
export async function sendChat(
  body?: Chat.IChatRequest,
  options?: { [key: string]: any },
): Promise<Chat.IChatResponse> {
  const res = await request<Chat.IChatResponse>('/chat', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    data: body,
    ...(options || {}),
  });

  return res;
}

/** 此处后端没有提供注释 POST /chat/vega */
export async function sendChatVega(
  body?: Chat.IChatVegaRequest,
  options?: { [key: string]: any },
): Promise<Chat.IChatVegaResponse> {
  const res = await request<Chat.IChatVegaResponse>('/chat/vega', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    data: body,
    ...(options || {}),
  });

  return res;
}

export async function getDataset(
  datasetUrl: string,
  options?: { [key: string]: any },
) {
  return request<Chat.IDataset>(datasetUrl, {
    method: 'GET',
    ...(options || {
      baseURL: '',
    }),
  });
}
