declare namespace Chat {
  type IFieldType = string;

  interface IDataRow {
    [key: string]: any;
  }

  interface IField {
    name: string;
    type: IFieldType;
  }

  interface IDataset {
    fields: IField[];
    dataSource: IDataRow[];
  }

  type MessageRole = 'user' | 'assistant' | 'system';
  type MessageType = 'text' | 'table' | 'markdown' | 'image' | 'custom' | 'ava';

  // messages: IMessage[], metas: IField[]
  interface IChatMessage {
    type?: MessageType;
    role: MessageRole;
    content: string | ReactNode;
    data?: Record<string, any>[];
    autoVizType?: 'ava';
  }

  interface IMessage {
    id: string;
    message: IChatMessage;
    status: 'success' | 'loading';
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
    choices: {
      message: { role: string; content: string; data?: Record<string, any>[] };
    }[];
  }

  interface IChatVegaRequest {
    text: string;
    metadatas: IField[];
  }

  interface IChatRequest {
    question: string;
    type?: string;
    autoVisualize?: boolean;
  }

  interface TableField {
    name: string;
    type: string;
    required: boolean;
  }

  interface TableSchema {
    table: string;
    database: string;
    fields: TableField[];
  }

  interface ITableResponse {
    database: string;
    name: string;
    metadatas: IField[];
    data: IDataRow[];
    visualize?: IChatgptResponse;
  }

  interface IChatResponse {
    success: boolean;
    data: any;
    table: ITableResponse | null;
    message: string;
  }
  interface IChatVegaResponse {
    success: boolean;
    content: string;
    metadatas: IField[];
    message: string;
  }

  type ISelectItem = {
    id: string;
    name: string;
    url?: string;
    type: string;
    dataset?: Chat.IDataset;
  };
}
