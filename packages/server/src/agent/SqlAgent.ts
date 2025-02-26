/* The provided code snippet is defining a TypeScript class called `SqlAgent` that serves as a service in a NestJS application. This class is responsible for interacting with an AI agent to generate SQL
queries based on user input. */
import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import { llm, type BaseLLM } from './llm.js';

import { getSqlPrompt, getChartPrompt } from './prompts/index.js';
import { DatabaseService } from '../modules/database/database.service.js';
import {
  CotAgent,
  FieldType,
  InputField,
  OutputField,
  Signature,
} from './CotAgent.js';

@Injectable()
export class SqlAgent {
  private readonly logger = new Logger(SqlAgent.name);

  private readonly lastMessageIds = new Map<string, string>();

  llm: BaseLLM;
  sig: Signature;
  cot: CotAgent;

  constructor(
    private config: ConfigService,
    private databaseService: DatabaseService,
  ) {
    if (this.config.get('OPENAI_API_KEY')) {
      this.llm = llm;
    } else {
      throw new Error('No API key provided');
    }
    this.llm.init();

    const sig = new Signature({
      messages: new InputField({
        type: FieldType.ListDict,
        description: 'List of messages in the conversation.',
      }),
      reasoning: new OutputField({
        type: FieldType.Str,
        description: '',
      }),
      answer: new OutputField({
        type: FieldType.Str,
        description: 'The SQL query, do not use markdown.',
      }),
      reason: new OutputField({ type: FieldType.Str, description: '' }),
    });

    this.cot = new CotAgent(sig, this.llm);
  }

  $onInit() {
    this.logger.debug('Init SqlAgent');
  }

  public async run(question: string, conversationId: string) {
    // 1. Get all table schemas for generate context prompt
    const tableSchemas = await this.databaseService.getAllTableSchemas();
    const dbType = await this.databaseService.getDbType();

    // 2. Generate SQL prompt
    const messages = getSqlPrompt(
      question,
      JSON.stringify(tableSchemas),
      dbType,
    );

    // 3. Send question prompt to AI agent
    const {
      object,
      response: { id },
    } = await this.cot.run(messages);

    // cache last message id
    // this.lastMessageIds.set(conversationId, contextResponse.id);

    // this.lastMessageIds.set(conversationId, msgId);

    return {
      id,
      type: 'sql',
      ...object,
    };
  }
}
