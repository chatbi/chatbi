import { PageContainer, ProSkeleton } from '@ant-design/pro-components';

const DataSourcePage: React.FC = () => {
  return (
    <PageContainer
      header={{
        title: 'DataSource Page is coming soon',
      }}
      className="py-10"
    >
      <ProSkeleton type="result" />
    </PageContainer>
  );
};

export default DataSourcePage;
