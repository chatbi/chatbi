import { UploadOutlined } from '@ant-design/icons';
import { Button, Upload } from 'antd';
import type { UploadChangeParam, UploadFile } from 'antd/es/upload';
import * as Papa from 'papaparse';
import React from 'react';

interface CsvReaderProps {
  onFileLoaded: (data: any) => void;
}

const CsvReader: React.FC<CsvReaderProps> = ({ onFileLoaded }) => {
  const handleFileChange = (info: UploadChangeParam<UploadFile<File>>) => {
    const file = info.fileList[0].originFileObj;
    if (file) {
      Papa.parse(file, {
        header: true,
        dynamicTyping: true,
        skipEmptyLines: true,
        complete: (results) => {
          onFileLoaded(results.data);
        },
      });
    }
  };

  return (
    <div>
      <Upload
        onChange={handleFileChange}
        showUploadList={false}
        // disable trigger onChange twice
        beforeUpload={() => false}
      >
        <Button type="primary" icon={<UploadOutlined />}>
          Click to Upload
        </Button>
      </Upload>
    </div>
  );
};

export default CsvReader;
