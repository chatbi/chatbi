import React from 'react';
import ReactMarkdown from 'react-markdown';
import { Prism as SyntaxHighlighter } from 'react-syntax-highlighter';
import { github } from 'react-syntax-highlighter/dist/esm/styles/hljs';
import RemarkGfm from 'remark-gfm';
import styles from './MarkdownView.less';

interface MarkdownViewProps {
  content: string;
}

const MarkdownView: React.FC<MarkdownViewProps> = ({ content }) => {
  return (
    <div className={styles['markdown-body']}>
      <ReactMarkdown
        remarkPlugins={[RemarkGfm]}
        children={content}
        components={{
          code({ className, children, ...props }) {
            const match = /language-(\w+)/.exec(className || '');
            const language = match?.[1] || 'text';
            return (
              <SyntaxHighlighter
                {...props}
                children={String(children).replace(/\n$/, '')}
                style={github}
                language={language}
                PreTag="div"
              />
            );
          },
        }}
      />
    </div>
  );
};

export default MarkdownView;
