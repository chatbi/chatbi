import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';

interface DatabaseRow {
  Database: string;
}

function filterMysqlSystemDatabases(databases: DatabaseRow[]) {
  return databases.filter(
    (d) =>
      d.Database !== 'information_schema' &&
      d.Database !== 'mysql' &&
      d.Database !== 'performance_schema' &&
      d.Database !== 'sys',
  );
}

@Injectable()
export class DatabaseService {
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
    const res = await this.dataSource.query<DatabaseRow[]>('SHOW DATABASES');
    const dbs = filterMysqlSystemDatabases(res).map((d) => d.Database);
    const dbSchemas: Database.DatabaseSchema[] = await Promise.all(
      dbs.map(async (db) => {
        const schemas = await this.getTables(db);
        return {
          database: db,
          schemas: schemas,
        };
      }),
    );
    return dbSchemas;
  }

  async getTables(database: string) {
    const res = await this.dataSource.query<Record<string, string>[]>(
      `SHOW TABLES FROM ${database}`,
    );
    const tables = res.map((d) => d[`Tables_in_${database}`]);
    const tableSchemas = await Promise.all(
      tables.map(async (table) => await this.getTableSchema(database, table)),
    );

    return tableSchemas;
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
