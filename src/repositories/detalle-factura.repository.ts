import {DefaultCrudRepository} from '@loopback/repository';
import {DetalleFactura, DetalleFacturaRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DetalleFacturaRepository extends DefaultCrudRepository<
  DetalleFactura,
  typeof DetalleFactura.prototype.idFactura,
  DetalleFacturaRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(DetalleFactura, dataSource);
  }
}
