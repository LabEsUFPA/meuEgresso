import { faker } from '@faker-js/faker'
import { type models } from 'src/@types'
interface EgressoMapa extends models.EgressoMapa {}

export function getRandomEgresso (): EgressoMapa {
  return {
    id: {
      egressoId: faker.datatype.number({ min: 0 }),
      empresaId: faker.datatype.number({ min: 0 })
    },
    nomeEgresso: faker.name.fullName(),
    empresa: {
      id: faker.datatype.number({ min: 0 }),
      nome: faker.company.name(),
      endereco: {
        id: faker.datatype.number({ min: 0 }),
        cidade: faker.address.cityName(),
        estado: faker.address.stateAbbr(),
        pais: faker.address.countryCode(),
        latitude: parseInt(faker.address.latitude()),
        longitude: parseInt(faker.address.longitude())
      }
    }
  }
}

export function getRandomEgressoList (size: number): EgressoMapa[] {
  const egressos = []

  for (let i = 0; i < size; i++) {
    egressos.push(getRandomEgresso())
  }

  return egressos
}