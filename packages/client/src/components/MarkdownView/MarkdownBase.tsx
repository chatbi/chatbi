import { Typography } from 'antd';
import markdownit from 'markdown-it';
import React from 'react';

const md = markdownit({ html: true, breaks: true });

interface MarkdownViewProps {
  content: string;
}

const MarkdownBase: React.FC<MarkdownViewProps> = ({ content }) => {
  return (
    <Typography>
      {/* biome-ignore lint/security/noDangerouslySetInnerHtml: used in demo */}
      <div dangerouslySetInnerHTML={{ __html: md.render(content) }} />
    </Typography>
  );
};

export default MarkdownBase;
