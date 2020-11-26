import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {idInjection: false, mssql: {schema: 'dbo', table: 'DetalleCompraProveedor'}}
})
export class DetalleCompraProveedor extends Entity {
  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idCompra', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idCompra: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idArticulo', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idArticulo: number;

  @property({
    type: 'number',
    required: true,
    precision: 18,
    scale: 2,
    mssql: {columnName: 'Cantidad', dataType: 'decimal', dataLength: null, dataPrecision: 18, dataScale: 2, nullable: 'NO'},
  })
  cantidad: number;

  @property({
    type: 'number',
    required: true,
    precision: 18,
    scale: 2,
    mssql: {columnName: 'Monto', dataType: 'decimal', dataLength: null, dataPrecision: 18, dataScale: 2, nullable: 'NO'},
  })
  monto: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<DetalleCompraProveedor>) {
    super(data);
  }
}

export interface DetalleCompraProveedorRelations {
  // describe navigational properties here
}

export type DetalleCompraProveedorWithRelations = DetalleCompraProveedor & DetalleCompraProveedorRelations;
