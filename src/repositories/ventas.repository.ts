import {DefaultCrudRepository} from '@loopback/repository';
import {Ventas, VentasRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class VentasRepository extends DefaultCrudRepository<
  Ventas,
  typeof Ventas.prototype.idCliente,
  VentasRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(Ventas, dataSource);
  }
}
