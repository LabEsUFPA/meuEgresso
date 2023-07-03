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
  sendToEmail: string | null
}

export const usePainelStore = defineStore('Painel', {
  state: (): State => ({
    egressos: [],
    totalPages: 0,
    graficos: {
      dia: [],
      mes: [],
      ano: []
    },
    sendToEmail: ''
  }),

  actions: {
    async fetchEgressos (nomeUsuario: string = '', status: string[] = ['incompleto', 'completo', 'pendente'], page: number = 0) {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/dashboard',
        params: {
          nome_usuario: nomeUsuario,
          status,
          ordenacao: 'DESC',
          size: 10,
          page
        }
      })

      if (response?.status === 200 && (response.data != null)) {
        this.egressos = response?.data.content.map((egresso: any) => ({
          cadastro: egresso.createdDate,
          id: egresso.idUsuario,
          idEgresso: egresso.idEgresso,
          name: egresso.nome,
          status: egresso.status,
          foto: egresso.foto,
          email: egresso.email
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
    },

    async getPdf () {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/dashboard/export',
        responseType: 'blob'
      })

      if (response?.status === 200 && response.data != null) {
        const blobData = response.data
        const fileUrl = URL.createObjectURL(blobData)

        const link = document.createElement('a')

        link.href = fileUrl
        link.setAttribute('download', `Export Egressos ${(new Date()).toLocaleDateString().replaceAll('_', '/')}`) // set custom file name
        document.body.appendChild(link)

        link.click()
        link.remove()
      }
    },

    async deleteUsuario (id: number) {
      const response = await Api.request({
        method: 'delete',
        route: `/administrador/usuario/${id}`
      })
      return response?.status != null ? response.status : 500
    },

    async toggleAtivacaoUsuario (id: number) {
      const response = await Api.request({
        method: 'put',
        route: `/administrador/usuario/${id}/ativo`
      })

      return response?.status != null ? response.status : 500
    },

    async toggleValidacaoUsuario (id: number) {
      const response = await Api.request({
        method: 'put',
        route: `/administrador/usuario/${id}/valido`
      })

      return response?.status != null ? response.status : 500
    },

    async deleteAll () {
      const response = await Api.request({
        method: 'delete',
        route: '/administrador/dashboard/deleteall'
      })

      return response?.status != null ? response.status : 500
    },

    setEgressoEmail (email: string | null) {
      this.sendToEmail = email
    },

    getEgressoEmail () {
      return this.sendToEmail
    }
  }
})
