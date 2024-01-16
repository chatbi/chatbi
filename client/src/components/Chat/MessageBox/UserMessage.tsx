import MarkdownView from '@/components/MarkdownView/MarkdownView';
import { UserOutlined } from '@ant-design/icons';
import { Avatar, Col, Row } from 'antd';
import React from 'react';

interface UserMessageProps {
  message: Chat.IMessage;
}

const UserMessage: React.FC<UserMessageProps> = ({ message }) => {
  return (
    <Row className="h-auto">
      <Col span={4}>&nbsp;</Col>
      <Col span={18}>
        <div className="bg-blue-100 px-2 py-4 mx-2 flex items-center justify-start b-rounded">
          <MarkdownView content={message.content} />
        </div>
      </Col>
      <Col span={2}>
        <Avatar size="large" icon={<UserOutlined />} />
      </Col>
    </Row>
  );
};

export default UserMessage;
