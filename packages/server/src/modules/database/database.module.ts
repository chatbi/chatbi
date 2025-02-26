import { Global, Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabaseService } from './database.service.js';

@Global()
@Module({
  imports: [
    TypeOrmModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => {
        return {
          logging: true,
          type: configService.get('DB_TYPE'),
          url: configService.get('DB_CONNECTION_URL'),
        };
      },
    }),
  ],
  controllers: [],
  providers: [DatabaseService],
  exports: [DatabaseService],
})
export class DatabaseModule {
  // noop
}
