import {DefaultCrudRepository} from '@loopback/repository';
import {Factura, FacturaRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class FacturaRepository extends DefaultCrudRepository<
  Factura,
  typeof Factura.prototype.id,
  FacturaRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(Factura, dataSource);
  }
}
