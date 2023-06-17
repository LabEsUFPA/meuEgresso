export enum NotificacaoStatus {
  ativo = 'ativo',
  pendente = 'pendente',
  incompleto = 'incompleto'
}

export interface Notificacao {
  nome: string
  usuarioId: number
  status: NotificacaoStatus
  data: string
}
