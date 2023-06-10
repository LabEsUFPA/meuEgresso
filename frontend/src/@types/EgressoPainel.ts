export enum EgressoStatus {
  ativo = 'Ativo',
  pendente = 'Pendente',
  incompleto = 'Incompleto'
}

export interface EgressoPainel {
  id: number
  name: string
  cadastro: string
  status: EgressoStatus
}
