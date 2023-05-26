import { Body, Controller, Get, Logger, Post } from '@nestjs/common';
import { ChatService } from './chat.service.js';

@Controller('chat')
export class ChatController {
  private readonly logger = new Logger(ChatController.name);

  constructor(private chatService: ChatService) {}

  @Get('/schemas')
  async dbs() {
    return this.chatService.getSchemas();
  }

  @Get('/test')
  async test() {
    return this.chatService.test();
  }

  @Post('/')
  async chat(@Body() payload: Chat.Message) {
    return this.chatService.chat(payload);
  }

  @Post('/vega')
  async vega(@Body() payload: Chat.VegaMessage) {
    return this.chatService.vega(payload);
  }
}
