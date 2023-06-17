/* eslint-disable @typescript-eslint/restrict-template-expressions */
import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type EgressoPainel } from 'src/@types/EgressoPainel'

interface State {
  egressos: EgressoPainel[]
}

export const usePainelStore = defineStore('Painel', {
  state: (): State => ({
    egressos: []
  }),

  actions: {
    async fetchEgressos () {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/dashboard',
        params: {
          direction: 'ASC',
          size: 10,
          page: 0
        }
      })

      if (response?.status === 200 && (response.data != null)) {
        this.egressos = response?.data.content.map((egresso: any) => ({
          cadastro: egresso.createdDate,
          id: egresso.id,
          name: egresso.nome,
          status: egresso.status
        }))
      }

      return response?.status != null ? response.status : 500
    }
  }
})
