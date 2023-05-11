import { faker } from '@faker-js/faker'
import { type models } from 'src/@types'
interface EgressoMapa extends models.EgressoMapa {}

export function getRandomEgresso (): EgressoMapa {
  return {
    nome: faker.name.fullName(),
    id: faker.datatype.number({ min: 0 }),
    localizacao: {
      cidade: faker.address.cityName(),
      estado: faker.address.stateAbbr(),
      pais: faker.address.countryCode(),
      latitude: parseInt(faker.address.latitude()),
      longitude: parseInt(faker.address.longitude())
    },
    empresa: faker.company.name()
  }
}

export function getRandomEgressoList (size: number): EgressoMapa[] {
  const egressos = []

  for (let i = 0; i < size; i++) {
    egressos.push(getRandomEgresso())
  }

  return egressos
}
