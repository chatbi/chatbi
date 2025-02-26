import Keyv from 'keyv';
import KeyvRedis from '@keyv/redis';
import {
  type LanguageModelV1,
  type LanguageModelV1Middleware,
  type LanguageModelV1StreamPart,
  simulateReadableStream,
} from 'ai';
import { envs } from '../config/envs.js';
import { Logger } from '@nestjs/common';

const logger = new Logger('LLMCache');

const redistUrl = `redis://${envs.REDIS_HOST}:${envs.REDIS_PORT}`;

logger.log(`Connecting to Redis at ${redistUrl}`);

const keyv = new Keyv(
  new KeyvRedis({
    url: `redis://${envs.REDIS_HOST}:${envs.REDIS_PORT}/${envs.REDIS_DB}`,
  }),
  {
    namespace: 'LLMCache',
  },
);

keyv.on('error', (err) => {
  logger.error('Connection Error', err);
});

type CacheData = Awaited<ReturnType<LanguageModelV1['doGenerate']>>;

export const LLMCacheMiddleware: LanguageModelV1Middleware = {
  wrapGenerate: async ({ doGenerate, params }) => {
    const cacheKey = JSON.stringify(params);

    const cached = await keyv.get<CacheData>(cacheKey);

    logger.debug(`Cache key: ${cacheKey}`);
    logger.debug(`Cached: ${JSON.stringify(cached)}`);

    if (cached !== undefined) {
      logger.log('Cache hit');
      return {
        ...cached,
        response: {
          ...cached.response,
          timestamp: cached?.response?.timestamp
            ? new Date(cached?.response?.timestamp)
            : undefined,
        },
      };
    }

    const result = await doGenerate();

    await keyv.set(cacheKey, result);

    return result;
  },
  wrapStream: async ({ doStream, params }) => {
    const cacheKey = JSON.stringify(params);

    // Check if the result is in the cache
    const cached = await keyv.get<LanguageModelV1StreamPart[]>(cacheKey);

    // If cached, return a simulated ReadableStream that yields the cached result
    if (cached !== undefined) {
      logger.log('Cache hit');
      // Format the timestamps in the cached response
      const formattedChunks = cached.map((p) => {
        if (p.type === 'response-metadata' && p.timestamp) {
          return { ...p, timestamp: new Date(p.timestamp) };
        } else return p;
      });
      return {
        stream: simulateReadableStream({
          initialDelayInMs: 0,
          chunkDelayInMs: 10,
          chunks: formattedChunks,
        }),
        rawCall: { rawPrompt: null, rawSettings: {} },
      };
    }

    // If not cached, proceed with streaming
    const { stream, ...rest } = await doStream();

    const fullResponse: LanguageModelV1StreamPart[] = [];

    const transformStream = new TransformStream<
      LanguageModelV1StreamPart,
      LanguageModelV1StreamPart
    >({
      transform(chunk, controller) {
        fullResponse.push(chunk);
        controller.enqueue(chunk);
      },
      flush() {
        // Store the full response in the cache after streaming is complete
        keyv.set(cacheKey, fullResponse);
      },
    });

    return {
      stream: stream.pipeThrough(transformStream),
      ...rest,
    };
  },
};

export function set(key: string, value: CacheData): Promise<boolean> {
  return keyv.set(key, value);
}

export function get(key: string): Promise<CacheData | undefined> {
  return keyv.get<CacheData>(key);
}

export function del(key: string): Promise<boolean> {
  return keyv.delete(key);
}

export function clear(): Promise<void> {
  return keyv.clear();
}
