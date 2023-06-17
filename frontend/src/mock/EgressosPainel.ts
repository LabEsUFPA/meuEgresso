import { faker } from '@faker-js/faker'
import { EgressoStatus, type EgressoPainel } from 'src/@types/EgressoPainel'

export function getRandomEgresso (): EgressoPainel {
  return {
    id: faker.number.int(),
    name: faker.person.fullName(),
    cadastro: faker.date.past().toDateString(),
    status: faker.helpers.enumValue(EgressoStatus)
  }
}

export function getRandomEgressoList (size: number): EgressoPainel[] {
  const egressos = []

  for (let i = 0; i < size; i++) {
    egressos.push(getRandomEgresso())
  }

  return egressos
}
