export enum NotificacaoStatus {
  completo = 'completo',
  pendente = 'pendente',
  incompleto = 'incompleto',
  excluido = 'excluido'
}

export interface Notificacao {
  nome: string
  usuarioId: number
  status: NotificacaoStatus
  dataModificacao: string
}
