import { DeleteFilled, SendOutlined } from '@ant-design/icons';
import { Button, Input, Popconfirm } from 'antd';
import React, { useEffect } from 'react';

interface ChatInputProps {
  loading?: boolean;
  disabled?: boolean;
  hasMessages?: boolean;
  defaultMessage?: string;
  onSend: (message: string) => void;
  onClear: () => void;
}

const ChatInput: React.FC<ChatInputProps> = ({
  onSend,
  onClear,
  loading = false,
  hasMessages = false,
  defaultMessage = '',
}) => {
  const [message, setMessage] = React.useState('');

  const handleSend = () => {
    onSend(message);
    setMessage('');
  };

  useEffect(() => {
    setMessage(defaultMessage);
  }, [defaultMessage]);

  return (
    <div className="overflow-hidden w-full flex flex-row gap-2">
      {/* clear button */}
      <Popconfirm
        title="Are you sure to clear all messages?"
        onConfirm={onClear}
        okText="Yes"
        cancelText="No"
        disabled={!hasMessages}
      >
        <Button disabled={!hasMessages} icon={<DeleteFilled />}></Button>
      </Popconfirm>
      <Input
        className="flex-1"
        placeholder="Type a message..."
        value={message}
        onChange={(e) => setMessage(e.target.value)}
        onPressEnter={handleSend}
        allowClear={true}
      />
      <Button
        type="primary"
        onClick={handleSend}
        loading={loading}
        disabled={!message}
        icon={<SendOutlined />}
      >
        Send
      </Button>
    </div>
  );
};

export default ChatInput;
