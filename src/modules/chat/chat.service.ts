import { Inject, Injectable, Logger } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { AiAgent } from './../../ai/agent/index.js';
import { DatabaseService } from '../database/database.service.js';
import { getFieldType } from '../../utils/index.js';

@Injectable()
export class ChatService {
  private readonly logger = new Logger(ChatService.name);

  @Inject()
  private agent: AiAgent;

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

  async chat(payload: Chat.Message) {
    try {
      // TODO: support conversation id
      const result = await this.agent.sql(
        payload.text,
        payload.conversationId || '123',
      );

      if (!result.success) {
        return {
          success: false,
          content: result.error
            ? result.error
            : 'Sorry, I can not answer your question, please try again.',
        };
      }

      // extract table name
      const tableName = result.tableName;
      let table = null;
      if (tableName) {
        this.logger.debug(`Table name: ${tableName}`);
        table = {
          name: tableName,
          metadatas: result.metadatas.fields.map((field) => {
            return {
              field: field.name,
              type: getFieldType(field.name, field.type),
            };
          }),
          data: result.rows,
          database: result.database,
        };
      }

      return {
        success: true,
        table,
        content: `
Question:

> ${payload.text}

Assumptions:
\`\`\`
${result.assumptions}
\`\`\`

Execute SQL:
\`\`\`sql
${result.query}
\`\`\`
        `,
      };
    } catch (e) {
      this.logger.error(e);

      return {
        success: false,
        content: 'Server error, please try again later.',
      };
    }
  }

  async vega(payload: Chat.VegaMessage) {
    try {
      const { text, conversationId = '123', metadatas } = payload;
      const result = await this.agent.vega(text, metadatas, conversationId);

      if (!result.success) {
        return {
          success: false,
          content: result.error
            ? result.error
            : 'Sorry, I can not answer your question, please try again.',
        };
      }

      return {
        ...result,
        success: true,
        metadatas,
      };
    } catch (e) {
      this.logger.error(e);

      return {
        success: false,
        content: 'Server error, please try again later.',
      };
    }
  }
}
