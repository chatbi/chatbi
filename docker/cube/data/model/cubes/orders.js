cube(`orders`, {
  sql_table: `public.orders`,
  data_source: `default`,
  joins: {
    users: {
      sql: `${CUBE}.user_id = ${users}.id`,
      relationship: `many_to_one`,
    },
    products: {
      sql: `${CUBE}.product_id = ${products}.id`,
      relationship: `many_to_one`,
    },
  },
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primary_key: true,
    },
    user_id: {
      sql: `user_id`,
      type: `number`,
    },
    product_id: {
      sql: `product_id`,
      type: `number`,
    },
    status: {
      sql: `status`,
      type: `string`,
    },
    created_at: {
      sql: `created_at`,
      type: `time`,
    },
    completed_at: {
      sql: `completed_at`,
      type: `time`,
    },
  },
  measures: {
    count: {
      type: `count`,
    },
    number: {
      sql: `number`,
      type: `sum`,
    },
  },
  preAggregations: {
    // Pre-aggregation definitions go here.
    // Learn more in the documentation: https://cube.dev/docs/caching/pre-aggregations/getting-started
    orders_by_completed_at: {
      measures: [count],
      time_dimension: completed_at,
      granularity: `month`,
      refresh_key: {
        every: `10 minute`,
      },
    },
    main: {
      measures: [orders.count, orders.number],
      dimensions: [orders.completed_at, orders.id, orders.status, orders.user_id],
      refreshKey: {
        every: `10 minute`,
      },
    },
  },
});
