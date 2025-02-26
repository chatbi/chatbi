import { ChatService } from '@/services/chat';
import { logger } from '@/utils/logger';
import {
  Bubble,
  BubbleProps,
  Prompts,
  useXAgent,
  useXChat,
} from '@ant-design/x';
import { useEffect, useState } from 'react';
import useChatStore from '@/store/chat';
import { type GetProp, Space, Spin, Table } from 'antd';
import MarkdownBase from '@/components/MarkdownView/MarkdownBase';
import { UserOutlined } from '@ant-design/icons';
import AvaAdvisor from '@/components/AvaAdvisor/AvaAdvisor';

type BubbleRoles = GetProp<typeof Bubble.List, 'roles'>;
type MessageRender = BubbleProps<Chat.IChatMessage>['messageRender'];
type BubbleItem = BubbleProps<Chat.IChatMessage> & {
  key?: string | number;
  role?: string;
};

const log = logger.extend('copilot:useChat');

const renderMarkdown: MessageRender = (message: Chat.IChatMessage) => {
  return <MarkdownBase content={message.content} />;
};

const renderTable: MessageRender = (message: Chat.IChatMessage) => {
  log('renderTable', message);
  if (!message.data) return "Can't render table without data";

  const dataSource = message.data as Chat.IDataRow[];

  const columns = Object.keys(dataSource[0]).map((key) => ({
    title: key,
    dataIndex: key,
  }));
  return <Table dataSource={dataSource} columns={columns} />;
};

const renderAva = (message: Chat.IChatMessage) => {
  log('renderAva', message);
  if (!message.data) return "Can't render Ava without data";
  return <AvaAdvisor data={message.data ?? []} />;
};

const useChat = () => {
  const roles: BubbleRoles = {
    assistant: {
      placement: 'start',
      avatar: { icon: <UserOutlined />, style: { background: '#fde3cf' } },

      typing: { step: 5, interval: 20 },
      styles: {
        content: {
          borderRadius: 16,
        },
      },
      loadingRender: () => (
        <Space>
          <Spin size="small" />
          Thinking
        </Space>
      ),
    },
    user: {
      placement: 'end',
      variant: 'shadow',
      avatar: { icon: <UserOutlined />, style: { background: '#87d068' } },
    },
  };
  const chatStore = useChatStore();
  // const messages = useChatStore((state) => state.messages);
  const prompt = useChatStore((state) => state.prompt);
  const setPrompt = useChatStore((state) => state.setPrompt);
  const [loading, setLoading] = useState(false);
  const [sql, setSql] = useState('');

  const [id, setId] = useState('');
  const [isVisualizing, setIsVisualizing] = useState(false);
  const [isCanVisualize, setIsCanVisualize] = useState(false);
  const [tableData, setTableData] = useState<Chat.IDataRow>([]);
  const [bubbleItems, setBubbleItems] = useState<BubbleItem[]>([]);

  async function generateSql(
    message: Chat.IChatMessage,
    onSuccess: (msg: Chat.IChatMessage) => void,
  ) {
    log('generateSql', message);
    const res = await ChatService.generateSql(message.content);
    log('sendChat', res);

    let newMsg = '' as unknown;
    let flag = false;
    let sql = '';
    const msgId = res.data.id;
    if (res.data?.answer) {
      newMsg = res.data.answer;
      if (res.data.type === 'sql') {
        newMsg = '> ' + res.data.reason + '\n';
        newMsg += '```SQL\n' + res.data.answer + '\n```';
        sql = res.data.answer as string;

        flag = true;
      }
    } else {
      newMsg = 'Sorry, I have no idea';
    }
    const messageContent = {
      role: 'assistant',
      content: newMsg,
    } as Chat.IChatMessage;
    onSuccess(messageContent);
    addMessage({
      id: msgId,
      message: messageContent,
      status: 'success',
    });

    setId(msgId);

    if (flag) {
      setSql(sql);
      // addMess
      setIsCanVisualize(true);

      // get table data
      runSql(msgId, sql, onSuccess);
    }
  }

  async function generateVisualization(
    data: Chat.IDataRow,
    onSuccess: (msg: Chat.IChatMessage) => void,
  ) {
    // TODO: use api to generate visualization
    const messageContent = {
      role: 'assistant',
      content: 'Here is the visualization',
      type: 'ava',
      data: data,
    } as Chat.IChatMessage;

    // add viz message
    addMessage({
      id: id,
      message: messageContent,
      status: 'success',
    });

    onSuccess(messageContent);
  }

  async function runSql(
    id: string,
    sql: string,
    onSuccess: (msg: Chat.IChatMessage) => void,
  ) {
    const res = await ChatService.runSql(id, sql);
    log('runSql', res);

    if (res.data?.data) {
      try {
        const newTableData = JSON.parse(res.data.data);
        log('newTableData', newTableData);
        setTableData(newTableData);

        const messageContent = {
          role: 'assistant',
          content: 'Here is the table data',
          type: 'table',
          data: newTableData,
        } as Chat.IChatMessage;

        // add table message
        addMessage({
          id: id,
          message: messageContent,
          status: 'success',
        });
        onSuccess(messageContent);

        // add visualization message
        generateVisualization(newTableData, onSuccess);
      } catch (e) {
        log('runSql error', e, res.data);
      }
    }
  }

  const [agent] = useXAgent<Chat.IChatMessage>({
    request: async ({ message }, { onSuccess }) => {
      if (!message) return;

      await generateSql(message, onSuccess);
    },
  });

  useEffect(() => {
    setLoading(agent.isRequesting());
  }, [agent]);

  const { onRequest, messages, setMessages } = useXChat({
    agent,
  });

  function updateMessages() {
    setMessages(chatStore.messages);
  }

  useEffect(() => {
    log('Init Messages', chatStore.messages);
    updateMessages();
  }, []);

  useEffect(() => {
    const newItems = chatStore.messages.map(
      ({ id, message, status }, index) => {
        log('message', message);
        let render = renderMarkdown;
        if (message.type === 'table') {
          render = renderTable;
        }
        if (message.type === 'ava') {
          render = renderAva;
        }
        return {
          key: `${id}-${index}`,
          loading: status === 'loading',
          role: message.role,
          content: message,
          messageRender: render,
        };
      },
    );
    setBubbleItems(newItems);
  }, [chatStore.messages]);

  const addMessage = (newStoreMessage: Chat.IMessage) => {
    chatStore.addMessage([newStoreMessage]);
  };

  // ==================== Event ====================
  const onSubmit = (nextContent: string) => {
    if (!nextContent) return;
    onRequest({
      role: 'user',
      content: nextContent,
    });
    setPrompt('');

    // add message to store
    addMessage({
      id: id,
      message: {
        role: 'user',
        content: nextContent,
      },
      status: 'success',
    });
  };

  const clearMessages = () => {
    chatStore.clearMessages();

    setMessages([]);
  };

  const onPromptsItemClick: GetProp<typeof Prompts, 'onItemClick'> = (info) => {
    onSubmit(info.data.description as string);
  };

  return {
    loading,
    agent,
    roles,
    messages,
    prompt,
    setPrompt,
    bubbleItems,

    onSubmit,
    clearMessages,

    onPromptsItemClick,
  };
};

export default useChat;
