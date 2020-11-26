import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'Articulos'}}})
export class Articulos extends Entity {
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
    type: 'string',
    required: true,
    length: 150,
    mssql: {columnName: 'Descripcion', dataType: 'varchar', dataLength: 150, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  descripcion: string;

  @property({
    type: 'number',
    required: true,
    precision: 18,
    scale: 2,
    mssql: {columnName: 'precioUnitario', dataType: 'decimal', dataLength: null, dataPrecision: 18, dataScale: 2, nullable: 'NO'},
  })
  precioUnitario: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Articulos>) {
    super(data);
  }
}

export interface ArticulosRelations {
  // describe navigational properties here
}

export type ArticulosWithRelations = Articulos & ArticulosRelations;
