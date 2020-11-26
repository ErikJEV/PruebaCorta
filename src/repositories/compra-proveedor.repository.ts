import {DefaultCrudRepository} from '@loopback/repository';
import {CompraProveedor, CompraProveedorRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class CompraProveedorRepository extends DefaultCrudRepository<
  CompraProveedor,
  typeof CompraProveedor.prototype.id,
  CompraProveedorRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(CompraProveedor, dataSource);
  }
}
