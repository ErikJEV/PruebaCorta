import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'Inventario'}}})
export class Inventario extends Entity {
  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    id: 1,
    mssql: {columnName: 'idArticulo', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idArticulo: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idProveedor', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idProveedor: number;

  @property({
    type: 'number',
    required: true,
    precision: 18,
    scale: 2,
    mssql: {columnName: 'Cantidad', dataType: 'decimal', dataLength: null, dataPrecision: 18, dataScale: 2, nullable: 'NO'},
  })
  cantidad: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Inventario>) {
    super(data);
  }
}

export interface InventarioRelations {
  // describe navigational properties here
}

export type InventarioWithRelations = Inventario & InventarioRelations;
