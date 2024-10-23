import React from 'react';
import BotMessage from './BotMessage';
import UserMessage from './UserMessage';

interface MessageBoxProps {
  messages: Chat.IMessage[];
  className?: string;
}

const MessageBox: React.FC<MessageBoxProps> = ({ messages, className }) => {
  function renderMessage(message: Chat.IMessage) {
    if (message.role === 'user') {
      return <UserMessage message={message} />;
    } else {
      return <BotMessage message={message} />;
    }
  }
  return (
    <div className={`${className} p-2`}>
      {messages.map((message, index) => {
        return (
          <div key={index} className="m-2">
            {renderMessage(message)}
          </div>
        );
      })}
    </div>
  );
};

export default MessageBox;
