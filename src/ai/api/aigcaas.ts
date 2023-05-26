import { type ChatMessage, ChatGPTAPI } from '@aigcaas/chatgpt';
import axios from 'axios';
import { envs } from '../../config/envs.js';
import * as AigcaasUtils from '../../utils/aigcaas.js';
import { Logger } from '@nestjs/common';

const appConfig = {
  applicationName: 'chatgpt_chat',
  apiName: 'chat_com',
};

const baseUrl = `https://api.aigcaas.cn/product/${appConfig.applicationName}/api/${appConfig.apiName}`;

export class Aigcaas {
  private readonly logger = new Logger(Aigcaas.name);
  private api: ChatGPTAPI | undefined = undefined;

  public async init() {
    this.api = new ChatGPTAPI({
      isAigcaas: true,
      aigcaasSecretId: envs.AIGCAAS_SECRET_ID,
      aigcaasSecretKey: envs.AIGCAAS_SECRET_KEY,
      completionParams: {
        temperature: 0,
      },
    });
  }

  public async sendMessage(
    message: string,
    parentMessageId: string | undefined = undefined,
  ): Promise<ChatMessage> {
    const response = await this.api.sendMessage(message, {
      parentMessageId,
    });

    this.logger.debug(`Aigcaas response: ${JSON.stringify(response)}`);

    return response;
  }

  public async chatCompletion(
    messages: Chat.ChatgptMessage[],
    // parentMessageId: string | undefined = undefined,
  ): Promise<Chat.IChatgptResponse> {
    const signHeaders = AigcaasUtils.sign({
      secretId: envs.AIGCAAS_SECRET_ID,
      secretKey: envs.AIGCAAS_SECRET_KEY,
    });
    const response = await axios.post<Chat.IChatgptResponse>(
      baseUrl,
      {
        original_response: 'true',
        messages: messages,
      },
      {
        headers: signHeaders,
      },
    );

    return response.data;
  }
}
const aigcaas = new Aigcaas();
export { aigcaas };
