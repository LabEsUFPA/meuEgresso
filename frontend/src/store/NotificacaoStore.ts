/* eslint-disable @typescript-eslint/restrict-template-expressions */
import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type Notificacao } from 'src/@types/Notificacao'

interface NotificacaoItem extends Notificacao {}

interface State {
  notificacoes: NotificacaoItem []
  totalPages: number

}

export const useNotificacaoStore = defineStore('Notificacao', {
  state: (): State => ({
    notificacoes: [],
    totalPages: 0
  }),

  actions: {
    async fetchNotificacoes (status: string, page: number, size: number) {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/dashboard/tipoStatus',
        params: { status, page, size }
      })

      if (response?.status === 200) {
        this.totalPages = response.data?.totalPages
        this.notificacoes = response.data?.content.map((elem: any) => ({
          nome: elem.nome,
          usuarioId: elem.usuarioId,
          status: elem.status,
          dataModificacao: elem.dataModificacao
        }))
      }
    }
  }
})
