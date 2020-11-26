import {DefaultCrudRepository} from '@loopback/repository';
import {RegistroPagos, RegistroPagosRelations} from '../models';
import {PruebacortaDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class RegistroPagosRepository extends DefaultCrudRepository<
  RegistroPagos,
  typeof RegistroPagos.prototype.idPago,
  RegistroPagosRelations
> {
  constructor(
    @inject('datasources.pruebacorta') dataSource: PruebacortaDataSource,
  ) {
    super(RegistroPagos, dataSource);
  }
}
