import { PageContainer } from '@ant-design/pro-components';
import { Checkbox, Radio, Select, Space } from 'antd';

import ChatInput from '@/components/Chat/ChatInput/ChatInput';
import MessageBox from '@/components/Chat/MessageBox/MessageBox';
import PresetPrompt from '@/components/PresetPrompt/PresetPrompt';
import useChat from '@/models/chat';
import useChatDbStore from '@/store/chat';

const DatabasePage: React.FC = () => {
  const { sendChat, loading } = useChat();
  const chatStore = useChatDbStore();
  const messages = useChatDbStore((state) => state.messages);
  const prompt = useChatDbStore((state) => state.prompt);
  const prompts = ['Top10 product', 'Product price top10'];

  const viewOptions = [
    { label: 'AVA', value: 'ava' },
    { label: 'VEGA', value: 'vega' },
  ];

  return (
    <PageContainer
      header={{
        title: 'Query',
      }}
      className="py-10"
    >
      <Space direction={'horizontal'} className="mb-2">
        {/* chat type select */}
        <Space className="mr-10">
          <span>Chat Type: </span>
          <Select
            className="min-w-30"
            value={chatStore.chatType}
            onChange={(value) => {
              chatStore.setChatType(value);
            }}
          >
            <Select.Option value="chat">Chat</Select.Option>
            {/* <Select.Option value="command">Command</Select.Option> */}
          </Select>
        </Space>

        {/* enable auto visualization */}
        <Checkbox
          checked={chatStore.autoVisualize}
          onChange={(e) => {
            chatStore.setAutoVisualize(e.target.checked);
          }}
        >
          Auto Visualize
        </Checkbox>

        <Radio.Group
          optionType="button"
          options={viewOptions}
          onChange={(e) => {
            chatStore.setAutoVizType(e.target.value);
          }}
          value={chatStore.autoVizType}
        />
      </Space>

      <PresetPrompt
        prompts={prompts}
        onChange={(prompt) => {
          if (prompt) {
            chatStore.setPrompt(prompt);
          }
        }}
      />

      <MessageBox messages={messages} className="m-2" />
      <ChatInput
        onClear={() => {
          chatStore.clearMessages();
        }}
        onSend={(msg) => {
          chatStore.setPrompt(msg);
          sendChat({
            message: msg,
            chatType: chatStore.chatType,
          });
        }}
        loading={loading || chatStore.visualizing}
        hasMessages={messages.length > 0}
        defaultMessage={prompt}
      />
    </PageContainer>
  );
};

export default DatabasePage;
