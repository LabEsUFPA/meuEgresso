/* eslint-disable @typescript-eslint/restrict-template-expressions */
import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type EgressoPainel } from 'src/@types/EgressoPainel'

interface State {
  egressos: EgressoPainel[]
  graficos: {
    dia: any[]
    mes: any[]
    ano: any[]
  }
}

export const usePainelStore = defineStore('Painel', {
  state: (): State => ({
    egressos: [],
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

      if (response?.status === 200 && (response.data != null)) {
        this.egressos = response?.data.content.map((egresso: any) => ({
          cadastro: egresso.createdDate,
          id: egresso.id,
          name: egresso.nome,
          status: egresso.status
        }))
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
    },

    async getPdf () {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/dashboard/export'
      })

      if (response?.status === 200 && response.data != null) {
        const blobFile = new Blob([response.data], {
          type: 'application/pdf;charset=UTF-8;base64'
        })

        const fileUrl = URL.createObjectURL(blobFile)
        console.log(response.data)

        const link = document.createElement('a')

        link.href = fileUrl
        link.setAttribute('download', 'listagem-egresso-2023-06-17.pdf') // set custom file name
        document.body.appendChild(link)

        link.click()
        link.remove()
      }
    }
  }
})
