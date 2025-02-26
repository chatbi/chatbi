import { HttpService } from '@nestjs/axios';
import { Inject, Injectable, Logger } from '@nestjs/common';
import { getFieldType } from '../../utils/index.js';
import { DatabaseService } from '../database/database.service.js';

import { envs } from '../../config/envs.js';
import { SqlAgent } from '../../agent/SqlAgent.js';

@Injectable()
export class ChatService {
  private readonly logger = new Logger(ChatService.name);

  @Inject()
  private sqlAgent: SqlAgent;

  constructor(
    private httpService: HttpService,
    private databaseService: DatabaseService,
  ) {
    // noop
  }

  async test() {
    return this.databaseService.query('select * from products limit 10;');
  }

  async getSchemas() {
    return this.databaseService.getSchemas();
  }

  async getConfig() {
    return {
      success: true,
      data: {
        // IMPORTANT: apiKey should not be exposed to the client side
        // apiKey: envs.OPENAI_API_KEY,
        baseUrl: envs.OPENAI_API_BASE_URL,
        model: envs.OPENAI_MODEL,
      },
    };
  }

  async chat(payload: Chat.Message) {
    try {
      if (payload.type === 'cache') {
        if (payload.action === 'clear') {
          // clear llm cache
        }
        return {
          success: true,
          data: 'Cache updated',
        };
      }

      // TODO: support conversation id
      this.logger.debug(`Chat with payload: ${JSON.stringify(payload)}`);
      const result = await this.sqlAgent.run(
        payload.text,
        payload.conversationId || '123',
      );

      // judge the result.anwser is valid sql
      const sql = result.answer;
      // dry run sql
      const dryRunResult = await this.databaseService.query(sql);

      return {
        success: true,
        data: result,
      };
    } catch (e) {
      this.logger.error(e);

      return {
        success: false,
        data: 'Server error, please try again later.',
      };
    }
  }
}
