import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'sysdiagrams'}}})
export class Sysdiagrams extends Entity {
  @property({
    type: 'string',
    required: true,
    length: 128,
    mssql: {columnName: 'name', dataType: 'nvarchar', dataLength: 128, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  name: string;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'principal_id', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  principalId: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    id: 1,
    mssql: {columnName: 'diagram_id', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  diagramId: number;

  @property({
    type: 'number',
    precision: 10,
    scale: 0,
    mssql: {columnName: 'version', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'YES'},
  })
  version?: number;

  @property({
    type: 'Binary',
    length: -1,
    mssql: {columnName: 'definition', dataType: 'varbinary', dataLength: -1, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  definition?: string;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Sysdiagrams>) {
    super(data);
  }
}

export interface SysdiagramsRelations {
  // describe navigational properties here
}

export type SysdiagramsWithRelations = Sysdiagrams & SysdiagramsRelations;
