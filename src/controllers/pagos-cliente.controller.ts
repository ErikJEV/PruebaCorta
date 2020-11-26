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
import {PagosCliente} from '../models';
import {PagosClienteRepository} from '../repositories';

export class PagosClienteController {
  constructor(
    @repository(PagosClienteRepository)
    public pagosClienteRepository : PagosClienteRepository,
  ) {}

  @post('/pagos-clientes', {
    responses: {
      '200': {
        description: 'PagosCliente model instance',
        content: {'application/json': {schema: getModelSchemaRef(PagosCliente)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PagosCliente, {
            title: 'NewPagosCliente',
            exclude: ['id'],
          }),
        },
      },
    })
    pagosCliente: Omit<PagosCliente, 'id'>,
  ): Promise<PagosCliente> {
    return this.pagosClienteRepository.create(pagosCliente);
  }

  @get('/pagos-clientes/count', {
    responses: {
      '200': {
        description: 'PagosCliente model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PagosCliente) where?: Where<PagosCliente>,
  ): Promise<Count> {
    return this.pagosClienteRepository.count(where);
  }

  @get('/pagos-clientes', {
    responses: {
      '200': {
        description: 'Array of PagosCliente model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PagosCliente, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PagosCliente) filter?: Filter<PagosCliente>,
  ): Promise<PagosCliente[]> {
    return this.pagosClienteRepository.find(filter);
  }

  @patch('/pagos-clientes', {
    responses: {
      '200': {
        description: 'PagosCliente PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PagosCliente, {partial: true}),
        },
      },
    })
    pagosCliente: PagosCliente,
    @param.where(PagosCliente) where?: Where<PagosCliente>,
  ): Promise<Count> {
    return this.pagosClienteRepository.updateAll(pagosCliente, where);
  }

  @get('/pagos-clientes/{id}', {
    responses: {
      '200': {
        description: 'PagosCliente model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PagosCliente, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PagosCliente, {exclude: 'where'}) filter?: FilterExcludingWhere<PagosCliente>
  ): Promise<PagosCliente> {
    return this.pagosClienteRepository.findById(id, filter);
  }

  @patch('/pagos-clientes/{id}', {
    responses: {
      '204': {
        description: 'PagosCliente PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PagosCliente, {partial: true}),
        },
      },
    })
    pagosCliente: PagosCliente,
  ): Promise<void> {
    await this.pagosClienteRepository.updateById(id, pagosCliente);
  }

  @put('/pagos-clientes/{id}', {
    responses: {
      '204': {
        description: 'PagosCliente PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() pagosCliente: PagosCliente,
  ): Promise<void> {
    await this.pagosClienteRepository.replaceById(id, pagosCliente);
  }

  @del('/pagos-clientes/{id}', {
    responses: {
      '204': {
        description: 'PagosCliente DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.pagosClienteRepository.deleteById(id);
  }
}
