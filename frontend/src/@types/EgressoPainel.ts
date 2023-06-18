export enum EgressoStatus {
  ativo = 'completo',
  pendente = 'pendente',
  incompleto = 'incompleto'
}

export interface EgressoPainel {
  id: number
  idEgresso: number
  name: string
  cadastro: string
  status: EgressoStatus
  foto: string
  email: string
}
