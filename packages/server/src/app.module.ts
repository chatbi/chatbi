import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import pino from 'pino';

import { LoggerModule, Logger } from 'nestjs-pino';

import { AppController } from './app.controller.js';
import { AppService } from './app.service.js';
import { ChatModule } from './modules/chat/chat.module.js';
import { DatabaseModule } from './modules/database/database.module.js';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: ['.env', '.env.local'],
    }),
    LoggerModule.forRoot({
      pinoHttp: [
        {
          name: 'ChatBI',
          level: process.env.NODE_ENV !== 'production' ? 'debug' : 'info',
          // install 'pino-pretty' package in order to use the following option
          transport:
            process.env.NODE_ENV !== 'production'
              ? {
                  target: 'pino-pretty',
                  options: {
                    colorize: true,
                    // singleLine: true,
                    messageFormat:
                      '{if req.id}({req.id}){end} | {if context}[{context}] {end}{msg}',
                  },
                }
              : undefined,

          // and all the other fields of:
          // - https://github.com/pinojs/pino-http#api
          // - https://github.com/pinojs/pino/blob/HEAD/docs/api.md#options-object
        },
        pino.destination({
          append: false,
          mkdir: true,
          dest: 'logs/run.log', // omit for stdout
          minLength: 4096, // Buffer before writing
        }),
      ],
    }),
    DatabaseModule,
    ChatModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  // noop
}
