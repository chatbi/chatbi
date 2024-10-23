import { Table as AntdTable, Card } from 'antd';
import type { ColumnType } from 'antd/es/table';

interface TableProps {
  columns: ColumnType<any>[];
  dataSource?: any[];
}

const Table = ({ columns, dataSource }: TableProps) => {
  return dataSource && dataSource.length > 0 ? (
    <Card className="w-full overflow-x-scroll">
      <AntdTable
        rowKey={`${columns[0].dataIndex}`}
        size="small"
        columns={columns}
        dataSource={dataSource}
        pagination={{ pageSize: 10 }}
        bordered={true}
      />
    </Card>
  ) : null;
};

export default Table;
