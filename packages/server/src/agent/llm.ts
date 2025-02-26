import { Logger } from '@nestjs/common';
import { createOpenAI, OpenAIProvider } from '@ai-sdk/openai';
import {
  generateObject,
  generateText,
  LanguageModelV1,
  wrapLanguageModel,
} from 'ai';
import { z } from 'zod';

import { envs } from '../config/envs.js';
import { LLMCacheMiddleware } from '../middlewares/LLMCache.js';
import { options } from 'node_modules/axios/index.cjs';

export class BaseLLM {
  private readonly logger = new Logger(BaseLLM.name);
  private provider: OpenAIProvider | undefined = undefined;
  public model: LanguageModelV1 | undefined = undefined;
  public cache = true;

  public async init() {
    // do nothing
  }

  enableCache() {
    this.cache = true;
  }

  disableCache() {
    this.cache = false;
  }

  getModel(useCache = true) {
    const openapi = createOpenAI({
      apiKey: envs.OPENAI_API_KEY,
      baseURL: envs.OPENAI_API_BASE_URL,
    });

    const model = openapi(envs.OPENAI_MODEL ?? 'gpt-3.5-turbo');
    const wrappedModel = wrapLanguageModel({
      model: model,
      middleware: useCache ? [LLMCacheMiddleware] : [],
    });

    return wrappedModel;
  }

  async generateText(prompt: string, useCache = true) {
    this.logger.log(`Chat with prompt: ${prompt}`);
    const response = await generateText({
      model: this.getModel(useCache),
      prompt,
    });

    this.logger.log(`Chat response: ${response}`);
    return response;
  }

  async generateObject(prompt: any, useCache = true) {
    this.logger.log(`Chat with prompt: ${prompt}`);
    const response = await generateObject<{
      answer?: string;
      reasoning?: string;
      reason?: string;
    }>({
      model: this.getModel(useCache),
      prompt,
      schema: z.object({
        answer: z.string(),
        reasoning: z.string(),
        reason: z.string(),
      }),
    });

    this.logger.log(`Chat response: ${JSON.stringify(response)}`);
    return response;
  }
}

const llm = new BaseLLM();
export { llm };
