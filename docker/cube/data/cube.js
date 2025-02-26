module.exports = {
  scheduledRefreshTimer: 60,
  driverFactory: ({ dataSource } = {}) => {
    return {
      type: 'postgres',
      database: 'chatbi',
      host: 'postgres',
      user: 'chatbi',
      password: '12345',
      port: '5432',
    };
  },
};
