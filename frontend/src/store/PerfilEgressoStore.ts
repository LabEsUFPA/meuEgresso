import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
// interface UserModel extends models.UserModel {}
import LocalStorage from 'src/services/localStorage'
interface ComplexOpts extends models.ComplexOpts {}
interface EgressoModel extends models.EgressoModel {}

const storage = new LocalStorage()

interface State {
  generos: ComplexOpts[]
  faixasSalariais: ComplexOpts[]
  tiposBolsa: ComplexOpts[]
  tiposCota: ComplexOpts[]
}

export const usePerfilEgressoStore = defineStore('usePerfilEgressoStore', {
  state: (): State => ({
    generos: [],
    faixasSalariais: [],
    tiposBolsa: [],
    tiposCota: []
  }),

  actions: {
    async fetchGeneros () {
      const response = await Api.request({
        method: 'get',
        route: '/genero'
      })

      if (response?.status === 200) {
        this.generos = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async fetchFaixa () {
      const response = await Api.request({
        method: 'get',
        route: '/faixaSalarial'
      })

      if (response?.status === 200) {
        this.faixasSalariais = response.data?.map((elem: any) => ({
          label: elem.faixa,
          value: elem.id
        }))
      }
    },

    async fetchBolsas () {
      const response = await Api.request({
        method: 'get',
        route: '/tipoBolsa'
      })

      if (response?.status === 200) {
        this.tiposBolsa = response.data?.map((elem: any) => {
          console.log(elem)

          return ({
            label: elem.nome,
            value: elem.id
          })
        })
      }
    },

    async fetchCotas () {
      const response = await Api.request({
        method: 'get',
        route: '/cota'
      })

      if (response?.status === 200) {
        this.tiposCota = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async fetchAll () {
      await this.fetchGeneros()
      await this.fetchFaixa()
      await this.fetchBolsas()
      await this.fetchCotas()
    },

    async getUser () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })

      return (response?.status) !== undefined ? response.status : 500
    },
    async getEgresso (id: number) {
      const response = await Api.request({
        method: 'get',
        route: '/egresso',
        body: { id }
      })
      // if (response?.status === 500) {
      //   return response?.status
      // }
      return response
    },
    async fetchEgresso () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })

      if (response?.status === 200) {
        storage.set('loggedEgresso', JSON.stringify(response.data))
        return JSON.stringify(response.data)
      }
    },

    async atualizarEgresso (dadosEgresso: EgressoModel) {
      const response = await Api.request({
        method: 'put',
        route: '/egresso',
        body: dadosEgresso
      })
      return (response?.status) !== undefined ? response.status : 500
    }
  }
})
