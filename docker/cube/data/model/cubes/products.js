cube(`products`, {
  sql_table: `public.products`,

  data_source: `default`,

  joins: {},

  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primary_key: true,
    },

    name: {
      sql: `name`,
      type: `string`,
    },

    description: {
      sql: `description`,
      type: `string`,
    },

    created_at: {
      sql: `created_at`,
      type: `time`,
    },
  },

  measures: {
    count: {
      type: `count`,
    },
  },

  pre_aggregations: {
    // Pre-aggregation definitions go here.
    // Learn more in the documentation: https://cube.dev/docs/caching/pre-aggregations/getting-started
  },
});
