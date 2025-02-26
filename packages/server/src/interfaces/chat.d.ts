declare namespace Chat {
  type ChatRole = 'user' | 'system' | 'assistant';
  interface TextBlock {
    type: string;
    text: string;
  }
  interface Message {
    type: 'chat' | 'cache';
    conversationId: string;
    text: string;

    /**
     * command for cache
     */
    action: 'get' | 'set' | 'clear';

    autoVisualize?: boolean;
  }

  interface ChatgptMessage {
    role: ChatRole;
    content: string;
  }

  interface Metadata {
    name: string;
    type: string;
  }

  interface VegaMessage {
    conversationId: string;
    text: string;
    metadatas: Metadata[];
  }

  interface IChatgptResponse {
    id: string;
    object: string;
    model: string;
    usage: {
      prompt_tokens: number;
      completion_tokens: number;
      total_tokens: number;
    };
    choices: { message: { role: ChatRole; content: string } }[];
  }

  interface Answer {
    query: string;
    success: boolean;
    error?: string;
    rows?: Row[];
    assumptions?: string;
    metadatas?: Database.TableSchema;
    tableName?: string;
    database?: string;
  }

  interface VegaAnswer {
    content: string;
    success: boolean;
    error?: string;
    metadatas?: Chat.Metadata[];
  }

  interface FewShot {
    question: string;
    answer: string;
  }
}
