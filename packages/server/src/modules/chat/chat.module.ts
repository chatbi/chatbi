import { HttpModule } from '@nestjs/axios';
import { Module } from '@nestjs/common';
import { ChatController } from './chat.controller.js';
import { ChatService } from './chat.service.js';
import { SqlAgent } from '../../agent/SqlAgent.js';

@Module({
  imports: [
    HttpModule.register({
      // timeout 10 minutes
      timeout: 600000,
      maxRedirects: 5,
    }),
  ],
  controllers: [ChatController],
  providers: [SqlAgent, ChatService],
})
export class ChatModule {
  // noop
}
