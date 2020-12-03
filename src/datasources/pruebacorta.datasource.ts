import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';

const config = {
  name: 'pruebacorta',
  connector: 'mssql',
  url: '',
  host: 'Examen1Erik.mssql.somee.com',
  port: 1433,
  user: 'Erik_JEV_SQLLogin_1',
  password: 'zh1povstif',
  database: 'Examen1Erik'
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
