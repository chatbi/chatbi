import { Injectable, Logger } from '@nestjs/common';
import { MemoryVectorStore } from 'langchain/vectorstores/memory';
import { DatabaseService } from './database.service.js';
import { OpenAIEmbeddings } from 'langchain/embeddings';
import { Document } from 'langchain/document';

@Injectable()
export class VectorIndexService {
  private readonly logger = new Logger(VectorIndexService.name);
  private store: MemoryVectorStore;
  private initialized = false;

  constructor(private databaseService: DatabaseService) {
    // noop
    this.init();
  }

  /**
   * Initialize the vector index.
   */
  async init() {
    if (this.initialized) {
      return;
    }
    const dbSchemas = await this.databaseService.getSchemas();
    const allTableSchemas = dbSchemas.flatMap((schema) => schema.schemas);
    const text = allTableSchemas.map((schema) =>
      JSON.stringify(schema.fields.map((field) => field.name)),
    );
    const metadatas = allTableSchemas.map((schema) => {
      // metadata id format is `${database}.${table}`
      return {
        id: `${schema.database}.${schema.table}`,
      };
    });
    this.store = await MemoryVectorStore.fromTexts(
      text,
      metadatas,
      new OpenAIEmbeddings(),
    );

    this.initialized = true;

    this.logger.log('Vector Index initialized.');
  }

  /**
   * Search the vector index for the given query.
   * @param {string} query query string
   * @returns {string[]} table names
   */
  async search(query: string) {
    const results = await this.store.similaritySearchWithScore(query, 10);
    this.logger.debug(`Search result: ${JSON.stringify(results)}`);
    return results.map(([result]) => (result as Document).metadata.id);
  }
}
