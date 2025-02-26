import { createOpenAI } from '@ai-sdk/openai';
import { generateText } from 'ai';
import { config } from 'dotenv';
import {
  AxGen,
  AxAIOpenAI,
  AxAIOpenAIConfig,
  AxChainOfThought,
  AxSignature,
  AxAI,
} from '@ax-llm/ax';

config();

const apiKey = process.env.OPENAI_API_KEY;
if (!apiKey) {
  throw new Error('No API key provided');
}
const baseURL = process.env.OPENAI_API_BASE_URL;
const model = process.env.OPENAI_MODEL ?? 'gpt-3.5-turbo';
console.log('baseURL', baseURL);

async function runByVercelSdk() {
  const openai = createOpenAI({
    apiKey,
    baseURL,
  });

  const { text } = await generateText({
    model: openai(model),
    messages: [
      { role: 'user', content: 'Hi!' },
      { role: 'assistant', content: 'Hello, how can I help?' },
      {
        role: 'user',
        content: 'Where can I buy the best Currywurst in Berlin?',
      },
    ],
  });

  console.log(text);
}

async function run() {
  const ai = new AxAI({
    name: 'openai',
    apiKey,
    apiURL: baseURL,
  });
  const conf = AxAIOpenAIConfig();

  ai.setOptions({ debug: true });

  const sig = new AxSignature();

  sig.addInputField({
    name: 'messages',
    description: 'Messages to send to the AI agent',
    type: {
      name: 'json',
      isArray: true,
    },
  });
  sig.addOutputField({
    name: 'answer',
    description: 'The PostgreSQL SQL query, do not use markdown.',
    type: {
      name: 'string',
      isArray: false,
    },
  });
  sig.addOutputField({
    name: 'reason',
    description: 'The reason for the query, do not use markdown.',
    type: {
      name: 'string',
      isArray: false,
    },
  });

  const gen = new AxChainOfThought(sig);

  const textToSummarize = `
The technological singularity—or simply the singularity[1]—is a hypothetical future point in time at which technological growth becomes uncontrollable and irreversible, resulting in unforeseeable changes to human civilization.[2][3] ...`;

  const res = await gen.forward(ai, {
    // @ts-ignore
    messages: [
      {
        role: 'system',
        content:
          'You are a expert. Please help to generate a SQL query to answer the question. Your response should ONLY be based on the given context and follow the response guidelines and format instructions.',
      },
      {
        role: 'user',
        content: 'Hi!',
      },
    ],
  });

  console.log('>', res);
}

run();
