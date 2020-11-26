import {DefaultCrudRepository} from '@loopback/repository';
import {Inventario, InventarioRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class InventarioRepository extends DefaultCrudRepository<
  Inventario,
  typeof Inventario.prototype.idArticulo,
  InventarioRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(Inventario, dataSource);
  }
}
