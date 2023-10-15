
import Koa from 'koa';
import Body from 'koa-bodyparser';
import cors from '@koa/cors';

import { router } from './Routes/Routes'
import { port } from '../config';
import mqttConnection from './Utils/Mqtt';
import { db } from '../config';


export class App {
  constructor(private app?: Koa) {
    console.log(db);

    this.app = new Koa();
    this.app
      .use(Body({ jsonLimit: '10mb' }))
      .use(router.routes())
      .use(cors())
      .use(router.allowedMethods())
      .listen(port);
    console.log(`Running on ${port} port!`);
  }
} 