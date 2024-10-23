import { useRequest } from 'ahooks';

import { ChatController } from '@/services/chat';
import useChatStore from '@/store/chat';
import { useState } from 'react';

const useChat = () => {
  const [loadingVega, setLoadingVega] = useState(false);
  const chatStore = useChatStore();
  const messages = useChatStore((state) => state.messages);
  const prompt = useChatStore((state) => state.prompt);
  const setPrompt = useChatStore((state) => state.setPrompt);

  async function autoVizByVega(table: Chat.ITableResponse) {
    const data = await ChatController.sendChatVega({
      text: 'Help to suggest any chart',
      metadatas: table?.metadatas,
    });

    // const { choices } = vizData;
    const botMsg: Chat.IMessage = {
      role: 'assistant',
      content: data.content,
      data: table?.data,
      autoVizType: 'vega',
    };

    return botMsg;
  }

  const { run, loading } = useRequest(ChatController.sendChat, {
    manual: true,
    onSuccess: async (data) => {
      const newMessages = [{ role: 'assistant', content: data.content }];
      // auto visualize
      if (chatStore.autoVisualize && data.table) {
        if (chatStore.autoVizType === 'ava') {
          const botMsg: Chat.IMessage = {
            role: 'system',
            content: 'Auto Visualize By AVA',
            data: data.table.data,
            autoVizType: 'ava',
          };
          newMessages.push(botMsg);

          chatStore.addMessage(newMessages);
        } else {
          chatStore.addMessage(newMessages);
          try {
            setLoadingVega(true);
            const vegaMsg = await autoVizByVega(data.table);
            chatStore.addMessage([vegaMsg]);
            setLoadingVega(false);
          } catch (e) {
            console.error(e);
          }
        }
      }
    },
  });

  const sendChat = async ({
    message: msg,
    chatType: type = 'chat',
  }: {
    message: string;
    chatType?: string;
  }) => {
    const newMessages = [...messages, { role: 'user', content: msg }];
    chatStore.setMessages(newMessages);

    setPrompt('');
    await run({
      type: type,
      text: msg,
      autoVisualize: chatStore.autoVisualize,
    });
  };

  return {
    loading: loading || loadingVega,
    messages,
    prompt,
    sendChat,
    setPrompt,
  };
};

export default useChat;
