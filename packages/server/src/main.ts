import { Logger as NestjsLogger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { Logger } from 'nestjs-pino';

import { AppModule } from './app.module.js';

async function bootstrap() {
  const logger = new NestjsLogger('bootstrap');

  const app = await NestFactory.create(AppModule, { bufferLogs: true });

  app.useLogger(app.get(Logger));

  app.enableCors({
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
  });
  await app.listen(3000, () => {
    logger.log('Listening at http://localhost:3000');
  });
}
bootstrap();
