import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'PagosCliente'}}})
export class PagosCliente extends Entity {
  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    id: 1,
    mssql: {columnName: 'id', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  id: number;

  @property({
    type: 'number',
    required: true,
    precision: 19,
    scale: 4,
    mssql: {columnName: 'Cantidad', dataType: 'money', dataLength: null, dataPrecision: 19, dataScale: 4, nullable: 'NO'},
  })
  cantidad: number;

  @property({
    type: 'date',
    required: true,
    mssql: {columnName: 'Fecha', dataType: 'date', dataLength: null, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  fecha: string;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<PagosCliente>) {
    super(data);
  }
}

export interface PagosClienteRelations {
  // describe navigational properties here
}

export type PagosClienteWithRelations = PagosCliente & PagosClienteRelations;
