import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {DetalleCompraProveedor} from '../models';
import {DetalleCompraProveedorRepository} from '../repositories';

export class DetalleCompraProveedorController {
  constructor(
    @repository(DetalleCompraProveedorRepository)
    public detalleCompraProveedorRepository : DetalleCompraProveedorRepository,
  ) {}

  @post('/detalle-compra-proveedors', {
    responses: {
      '200': {
        description: 'DetalleCompraProveedor model instance',
        content: {'application/json': {schema: getModelSchemaRef(DetalleCompraProveedor)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DetalleCompraProveedor, {
            title: 'NewDetalleCompraProveedor',
            
          }),
        },
      },
    })
    detalleCompraProveedor: DetalleCompraProveedor,
  ): Promise<DetalleCompraProveedor> {
    return this.detalleCompraProveedorRepository.create(detalleCompraProveedor);
  }

  @get('/detalle-compra-proveedors/count', {
    responses: {
      '200': {
        description: 'DetalleCompraProveedor model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(DetalleCompraProveedor) where?: Where<DetalleCompraProveedor>,
  ): Promise<Count> {
    return this.detalleCompraProveedorRepository.count(where);
  }

  @get('/detalle-compra-proveedors', {
    responses: {
      '200': {
        description: 'Array of DetalleCompraProveedor model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(DetalleCompraProveedor, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(DetalleCompraProveedor) filter?: Filter<DetalleCompraProveedor>,
  ): Promise<DetalleCompraProveedor[]> {
    return this.detalleCompraProveedorRepository.find(filter);
  }

  @patch('/detalle-compra-proveedors', {
    responses: {
      '200': {
        description: 'DetalleCompraProveedor PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DetalleCompraProveedor, {partial: true}),
        },
      },
    })
    detalleCompraProveedor: DetalleCompraProveedor,
    @param.where(DetalleCompraProveedor) where?: Where<DetalleCompraProveedor>,
  ): Promise<Count> {
    return this.detalleCompraProveedorRepository.updateAll(detalleCompraProveedor, where);
  }

  @get('/detalle-compra-proveedors/{id}', {
    responses: {
      '200': {
        description: 'DetalleCompraProveedor model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(DetalleCompraProveedor, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(DetalleCompraProveedor, {exclude: 'where'}) filter?: FilterExcludingWhere<DetalleCompraProveedor>
  ): Promise<DetalleCompraProveedor> {
    return this.detalleCompraProveedorRepository.findById(id, filter);
  }

  @patch('/detalle-compra-proveedors/{id}', {
    responses: {
      '204': {
        description: 'DetalleCompraProveedor PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DetalleCompraProveedor, {partial: true}),
        },
      },
    })
    detalleCompraProveedor: DetalleCompraProveedor,
  ): Promise<void> {
    await this.detalleCompraProveedorRepository.updateById(id, detalleCompraProveedor);
  }

  @put('/detalle-compra-proveedors/{id}', {
    responses: {
      '204': {
        description: 'DetalleCompraProveedor PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() detalleCompraProveedor: DetalleCompraProveedor,
  ): Promise<void> {
    await this.detalleCompraProveedorRepository.replaceById(id, detalleCompraProveedor);
  }

  @del('/detalle-compra-proveedors/{id}', {
    responses: {
      '204': {
        description: 'DetalleCompraProveedor DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.detalleCompraProveedorRepository.deleteById(id);
  }
}
