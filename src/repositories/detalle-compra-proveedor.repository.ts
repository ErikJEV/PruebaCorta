import {DefaultCrudRepository} from '@loopback/repository';
import {DetalleCompraProveedor, DetalleCompraProveedorRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DetalleCompraProveedorRepository extends DefaultCrudRepository<
  DetalleCompraProveedor,
  typeof DetalleCompraProveedor.prototype.idCompra,
  DetalleCompraProveedorRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(DetalleCompraProveedor, dataSource);
  }
}
