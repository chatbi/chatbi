import { Injectable, Logger } from '@nestjs/common';
import { DataSource } from 'typeorm';

interface DatabaseRow {
  Database: string;
}

@Injectable()
export class DatabaseService {
  logger = new Logger(DatabaseService.name);

  constructor(private dataSource: DataSource) {
    // noop
  }

  getDbType() {
    return this.dataSource.options.type;
  }

  async getAllTableSchemas() {
    const dbSchemas = await this.getSchemas();
    const tableSchemas = dbSchemas.flatMap((db) => db.schemas);

    return tableSchemas;
  }

  async getSchemas() {
    const tableNameSql = `
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public';
    `;
    const tableNameList = await this.dataSource.query<{ table_name: string }[]>(
      tableNameSql,
    );

    this.logger.log(`Table Name List: ${JSON.stringify(tableNameList)}`);

    const res = await this.dataSource.query<DatabaseRow[]>(`
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public';
            
    `);

    this.logger.log(`getSchemas: ${JSON.stringify(res)}`);
    const tableSchema = await Promise.all(
      tableNameList.map(async (d) => {
        const schemas = await this.getTableScheme(d.table_name);
        return {
          database: 'chatbi',
          schemas: schemas,
        };
      }),
    );
    return tableSchema;
  }

  async getTableScheme(tableName: string): Promise<Database.TableSchema> {
    const res = await this.dataSource.query<
      {
        tableSchema: string;
        tableMame: string;
        column: string;
        type: string;
        nullable: string;
      }[]
    >(
      `SELECT 
        c.table_schema as tableSchema,
        c.table_name as tableMame,
        c.column_name as column,
        c.udt_name as type,
        c.is_nullable as nullable
    FROM 
        information_schema.columns c
    WHERE 
        c.table_schema = 'public' AND c.table_name = '${tableName}'
    ORDER BY 
        c.table_schema, c.table_name, c.ordinal_position;`,
    );
    const fields = res.map((d) => {
      return {
        name: d.column,
        type: d.type,
        required: d.nullable === 'NO',
      };
    });
    return {
      database: 'chatbi',
      table: tableName,
      fields: fields,
    };
  }

  async getTableSchema(
    database: string,
    table: string,
  ): Promise<Database.TableSchema> {
    const res = await this.dataSource.query(
      `SHOW COLUMNS FROM ${database}.${table}`,
    );
    const tableFields = res.map((d) => {
      return {
        name: d.Field,
        type: d.Type,
        required: d.Null === 'NO',
      };
    });

    return {
      table,
      database,
      fields: tableFields,
    };
  }

  async query(query: string): Promise<{
    query: string;
    success: boolean;
    rows: any[];
  }> {
    const res = await this.dataSource.query<any[]>(query);
    return {
      query,
      success: true,
      rows: res,
    };
  }
}
