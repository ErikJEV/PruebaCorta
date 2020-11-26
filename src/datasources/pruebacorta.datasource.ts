import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';

const config = {
  name: 'pruebacorta',
  connector: 'mssql',
  url: '',
  host: 'DESKTOP-35P7LP2',
  port: 1433,
  user: 'Erik_JEV',
  password: '12345',
  database: 'PruebaCorta1'
};

// Observe application's life cycle to disconnect the datasource when
// application is stopped. This allows the application to be shut down
// gracefully. The `stop()` method is inherited from `juggler.DataSource`.
// Learn more at https://loopback.io/doc/en/lb4/Life-cycle.html
@lifeCycleObserver('datasource')
export class PruebacortaDataSource extends juggler.DataSource
  implements LifeCycleObserver {
  static dataSourceName = 'pruebacorta';
  static readonly defaultConfig = config;

  constructor(
    @inject('datasources.config.pruebacorta', {optional: true})
    dsConfig: object = config,
  ) {
    super(dsConfig);
  }
}
