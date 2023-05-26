import { type ChatMessage, ChatGPTAPI } from '@aigcaas/chatgpt';
import { envs } from '../../config/envs.js';
import axios from 'axios';
import { Logger } from '@nestjs/common';

export class OpenAI {
  private readonly logger = new Logger(OpenAI.name);
  private api: ChatGPTAPI | undefined = undefined;

  public async init() {
    this.api = new ChatGPTAPI({
      apiBaseUrl: `${envs.OPENAI_API_BASE_URL}/v1`,
      apiKey: envs.OPENAI_API_KEY,
      completionParams: {
        temperature: 0,
      },
    });
  }

  async sendMessage(
    message: string,
    parentMessageId: string | undefined = undefined,
  ): Promise<ChatMessage> {
    const response = await this.api.sendMessage(message, {
      parentMessageId,
    });
    return response;
  }

  async chatCompletion(messages: Chat.ChatgptMessage[]): Promise<any> {
    const url = `${envs.OPENAI_API_BASE_URL}/v1/chat/completions`;
    const response = await axios.post<Chat.IChatgptResponse>(
      url,
      {
        model: 'gpt-3.5-turbo',
        temperature: 0.05,
        messages: messages,
      },
      {
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + envs.OPENAI_API_KEY,
        },
      },
    );
    return response;
  }
}

const openAI = new OpenAI();
export { openAI };
