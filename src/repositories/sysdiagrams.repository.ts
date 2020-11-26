import {DefaultCrudRepository} from '@loopback/repository';
import {Sysdiagrams, SysdiagramsRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class SysdiagramsRepository extends DefaultCrudRepository<
  Sysdiagrams,
  typeof Sysdiagrams.prototype.diagramId,
  SysdiagramsRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(Sysdiagrams, dataSource);
  }
}
