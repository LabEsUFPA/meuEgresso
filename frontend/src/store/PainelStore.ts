/* eslint-disable @typescript-eslint/restrict-template-expressions */
import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type EgressoPainel } from 'src/@types/EgressoPainel'

interface State {
  egressos: EgressoPainel[]
  totalPages: number
  graficos: {
    dia: any[]
    mes: any[]
    ano: any[]
  }
}

export const usePainelStore = defineStore('Painel', {
  state: (): State => ({
    egressos: [],
    totalPages: 0,
    graficos: {
      dia: [],
      mes: [],
      ano: []
    }
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

      console.log(response?.data)

      if (response?.status === 200 && (response.data != null)) {
        this.egressos = response?.data.content.map((egresso: any) => ({
          cadastro: egresso.createdDate,
          id: egresso.id,
          name: egresso.nome,
          status: egresso.status
        }))
        this.totalPages = response.data?.totalPages
      }

      return response?.status != null ? response.status : 500
    },

    async fetchGrafico (periodo: 'ano' | 'mes' | 'dia') {
      const periodoToName = {
        ano: 'egressosCadastradosPorAno',
        mes: 'egressosCadastradosPorMesAno',
        dia: 'egressosCadastradosPorDia'
      }

      const response = await Api.request({
        method: 'get',
        route: `/administrador/dashboard/cadastro/${periodo}`
      })

      if (response?.status === 200 && (response.data != null)) {
        this.graficos[periodo] = response.data[periodoToName[periodo]]
      }

      return response?.status != null ? response.status : 500
    }
  }
})
