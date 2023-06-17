export enum EgressoStatus {
  ativo = 'completo',
  pendente = 'pendente',
  incompleto = 'incompleto'
}

export interface EgressoPainel {
  id: number
  name: string
  cadastro: string
  status: EgressoStatus
}
