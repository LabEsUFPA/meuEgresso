/* eslint-disable @typescript-eslint/restrict-template-expressions */
import { defineStore } from 'pinia'
import { type Notificacao } from 'src/@types/Notificacao'
import Api from 'src/services/api'

interface NotificacaoItem extends Notificacao { }

interface State {
  notificacoes: NotificacaoItem[]
  totalPages: number

}

export const useNotificacaoStore = defineStore('Notificacao', {
  state: (): State => ({
    notificacoes: [],
    totalPages: 0
  }),

  actions: {
    async fetchNotificacoes (status: string[] = ['incompleto', 'completo', 'pendente'], page: number, size: number) {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/dashboard/notificacaoStatus',
        params: { status, page, size, direction: 'DESC' }
      })
      console.log(response)
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
