import { Card, Space } from 'antd';
import React from 'react';

interface PresetPromptProps {
  prompts: string[];
  onChange?: (dataset: string | null) => void;
}

const PresetPrompt: React.FC<PresetPromptProps> = ({
  prompts = [],
  onChange,
}) => {
  return prompts?.length > 0 ? (
    <Card
      size="small"
      headStyle={{ fontSize: '14px' }}
      title="Prompt suggestions"
    >
      <Space className="list" direction={'horizontal'}>
        {prompts.map((item) => (
          <div
            key={item}
            className="border-1 border-color-gray-300 border-solid cursor-pointer p-1 bg-gray-100 hover:bg-gray-200 b-rounded"
            onClick={() => onChange?.(item)}
          >
            {item}
          </div>
        ))}
      </Space>
    </Card>
  ) : null;
};

export default PresetPrompt;
