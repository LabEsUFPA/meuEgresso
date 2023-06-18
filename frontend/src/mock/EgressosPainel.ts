import { faker } from '@faker-js/faker'
import { EgressoStatus, type EgressoPainel } from 'src/@types/EgressoPainel'

export function getRandomEgresso (): EgressoPainel {
  return {
    id: faker.number.int(),
    idEgresso: faker.number.int(),
    name: faker.person.fullName(),
    cadastro: faker.date.past().toDateString(),
    status: faker.helpers.enumValue(EgressoStatus),
    foto: faker.image.url(),
    email: faker.internet.email()
  }
}

export function getRandomEgressoList (size: number): EgressoPainel[] {
  const egressos: EgressoPainel[] = []

  for (let i = 0; i < size; i++) {
    egressos.push(getRandomEgresso())
  }

  return egressos
}
