import {DefaultCrudRepository} from '@loopback/repository';
import {PagosCliente, PagosClienteRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PagosClienteRepository extends DefaultCrudRepository<
  PagosCliente,
  typeof PagosCliente.prototype.id,
  PagosClienteRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(PagosCliente, dataSource);
  }
}
