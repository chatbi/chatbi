import { logger } from '@/utils/logger';
import { create } from 'zustand';
import { createJSONStorage, persist } from 'zustand/middleware';

const log = logger.extend('ChatStore');

type ChatStore = {
  prompt: string;
  chatType: string;
  messages: Chat.IMessage[];
  visualizing: boolean;
  autoVisualize: boolean;
  autoVizType: string;

  setMessages: (messages: Chat.IMessage[]) => void;
  setPrompt: (prompt: string) => void;
  clearMessages: () => void;
  setChatType: (chatType: string) => void;
  setAutoVisualize: (autoVisualize: boolean) => void;
  setVisualizing: (visualizing: boolean) => void;
  setAutoVizType: (autoVizType: string) => void;
  addMessage: (messages: Chat.IMessage[]) => void;
};

const useChatDbStore = create(
  persist<ChatStore>(
    (set) => ({
      prompt: '',
      messages: [],
      chatType: 'chat',
      autoVisualize: true,
      visualizing: false,
      autoVizType: 'ava',

      setAutoVizType: (autoVizType: string) => {
        set(() => {
          return {
            autoVizType,
          };
        });
      },
      setVisualizing: (visualizing: boolean) => {
        set(() => {
          return {
            visualizing,
          };
        });
      },
      setAutoVisualize: (autoVisualize: boolean) => {
        set(() => {
          return {
            autoVisualize,
          };
        });
      },
      setChatType: (chatType: string) => {
        set(() => {
          return {
            chatType,
          };
        });
      },
      clearMessages: () => {
        set(() => {
          return {
            messages: [],
          };
        });
      },
      setMessages: (messages: Chat.IMessage[]) => {
        log('setMessages', messages);
        set((state) => {
          return {
            messages: [...state.messages, ...messages],
          };
        });
      },
      addMessage: (messages: Chat.IMessage[]) => {
        log('addMessage', messages);
        set((state) => {
          return {
            messages: [...state.messages, ...messages],
          };
        });
      },
      setPrompt: (prompt: string) => {
        set(() => {
          return {
            prompt,
          };
        });
      },
    }),
    {
      name: 'chat-db-storage',
      storage: createJSONStorage(() => localStorage),
    },
  ),
);

export default useChatDbStore;
