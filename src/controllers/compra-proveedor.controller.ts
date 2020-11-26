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
import {CompraProveedor} from '../models';
import {CompraProveedorRepository} from '../repositories';

export class CompraProveedorController {
  constructor(
    @repository(CompraProveedorRepository)
    public compraProveedorRepository : CompraProveedorRepository,
  ) {}

  @post('/compra-proveedors', {
    responses: {
      '200': {
        description: 'CompraProveedor model instance',
        content: {'application/json': {schema: getModelSchemaRef(CompraProveedor)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CompraProveedor, {
            title: 'NewCompraProveedor',
            exclude: ['id'],
          }),
        },
      },
    })
    compraProveedor: Omit<CompraProveedor, 'id'>,
  ): Promise<CompraProveedor> {
    return this.compraProveedorRepository.create(compraProveedor);
  }

  @get('/compra-proveedors/count', {
    responses: {
      '200': {
        description: 'CompraProveedor model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(CompraProveedor) where?: Where<CompraProveedor>,
  ): Promise<Count> {
    return this.compraProveedorRepository.count(where);
  }

  @get('/compra-proveedors', {
    responses: {
      '200': {
        description: 'Array of CompraProveedor model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(CompraProveedor, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(CompraProveedor) filter?: Filter<CompraProveedor>,
  ): Promise<CompraProveedor[]> {
    return this.compraProveedorRepository.find(filter);
  }

  @patch('/compra-proveedors', {
    responses: {
      '200': {
        description: 'CompraProveedor PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CompraProveedor, {partial: true}),
        },
      },
    })
    compraProveedor: CompraProveedor,
    @param.where(CompraProveedor) where?: Where<CompraProveedor>,
  ): Promise<Count> {
    return this.compraProveedorRepository.updateAll(compraProveedor, where);
  }

  @get('/compra-proveedors/{id}', {
    responses: {
      '200': {
        description: 'CompraProveedor model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CompraProveedor, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CompraProveedor, {exclude: 'where'}) filter?: FilterExcludingWhere<CompraProveedor>
  ): Promise<CompraProveedor> {
    return this.compraProveedorRepository.findById(id, filter);
  }

  @patch('/compra-proveedors/{id}', {
    responses: {
      '204': {
        description: 'CompraProveedor PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CompraProveedor, {partial: true}),
        },
      },
    })
    compraProveedor: CompraProveedor,
  ): Promise<void> {
    await this.compraProveedorRepository.updateById(id, compraProveedor);
  }

  @put('/compra-proveedors/{id}', {
    responses: {
      '204': {
        description: 'CompraProveedor PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() compraProveedor: CompraProveedor,
  ): Promise<void> {
    await this.compraProveedorRepository.replaceById(id, compraProveedor);
  }

  @del('/compra-proveedors/{id}', {
    responses: {
      '204': {
        description: 'CompraProveedor DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.compraProveedorRepository.deleteById(id);
  }
}
