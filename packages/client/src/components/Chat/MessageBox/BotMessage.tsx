import AvaAdvisor from '@/components/AvaAdvisor/AvaAdvisor';
import MarkdownView from '@/components/MarkdownView/MarkdownView';
import ReactVega from '@/components/Vega';
import { RobotOutlined } from '@ant-design/icons';
import { Avatar, Col, Row } from 'antd';
import React from 'react';

interface BotMessageProps {
  message: Chat.IMessage;
}

const BotMessage: React.FC<BotMessageProps> = ({ message }) => {
  function renderMessage() {
    if (message.autoVizType === 'ava') {
      return <AvaAdvisor data={message.data ?? []} />;
    } else if (message.autoVizType === 'vega') {
      const spec = JSON.parse(message.content ?? '');
      if (spec) {
        return (
          <div className="px-2 py-4 mx-2 overflow-hidden overflow-x-scroll b-rounded">
            <ReactVega spec={spec} data={message.data} />
          </div>
        );
      } else {
        return (
          <div className="px-2 py-4 mx-2">
            <MarkdownView content={message.content} />
          </div>
        );
      }
    } else {
      return (
        <div className="px-2 py-4 mx-2">
          <MarkdownView content={message.content} />
        </div>
      );
    }
  }
  return (
    <Row className="h-auto">
      <Col span={2}>
        <Avatar size="large" icon={<RobotOutlined />} />
      </Col>
      <Col span={18}>
        <div className="bg-gray-300 mx-2">{renderMessage()}</div>
      </Col>
      <Col span={4}>&nbsp;</Col>
    </Row>
  );
};

export default BotMessage;
