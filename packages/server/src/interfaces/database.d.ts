declare namespace Database {
  interface TableField {
    name: string;
    type: string;
    required: boolean;
  }

  interface TableSchema {
    table: string;
    database: string;
    fields: TableField[];
  }

  interface DatabaseSchema {
    database: string;
    schemas: TableSchema[];
  }
}
