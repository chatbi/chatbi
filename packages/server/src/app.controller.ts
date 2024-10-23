import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service.js';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {
    // noop
  }

  @Get()
  async getHello(): Promise<string> {
    return this.appService.getHello();
  }
}
