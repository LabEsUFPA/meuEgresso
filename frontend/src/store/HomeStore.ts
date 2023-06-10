import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
interface EgressoMapa extends models.EgressoMapa {}
interface State {
  egressList: EgressoMapa[]
}

export const useHomeStore = defineStore('HomeStore', {
  state: (): State => ({
    egressList: []
  }),

  actions: {
    async fetchEgress () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/mapa'
      })

      if (response?.status === 200) {
        this.egressList = response.data?.map((elem: any) => ({
          id: elem.id,
          nomeEgresso: elem.nomeEgresso,
          empresa: elem.empresa
        }))
      }
    },

    async getEgress () {
      await this.fetchEgress()
    }
  }
})
