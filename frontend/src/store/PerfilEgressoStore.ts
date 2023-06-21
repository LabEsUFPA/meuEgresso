import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
import LocalStorage from 'src/services/localStorage'
import axios from 'axios'
interface ComplexOpts extends models.ComplexOpts {}
const storage = new LocalStorage()

const baseURL = import.meta.env.VITE_API_URL_LOCAL

const Axios = axios.create({
  baseURL,
  withCredentials: true

})
interface State {
  generos: ComplexOpts[]
  faixasSalariais: ComplexOpts[]
  tiposBolsa: ComplexOpts[]
  tiposCota: ComplexOpts[]
  areasAtuacao: ComplexOpts[]

}
Axios.interceptors.request.use((config) => {
  const Token = new LocalStorage().getToken()
  if (Token !== undefined) config.headers.Authorization = `Bearer ${Token}`
  return config
})

export const usePerfilEgressoStore = defineStore('usePerfilEgressoStore', {
  state: (): State => ({
    generos: [],
    faixasSalariais: [],
    tiposBolsa: [],
    tiposCota: [],
    areasAtuacao: []
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
          return ({
            label: elem.nome,
            value: elem.id
          })
        })
      }
    },
    async fetchAreaEmprego () {
      const response = await Api.request({
        method: 'get',
        route: 'publico/areaemprego'
      })

      if (response?.status === 200) {
        this.areasAtuacao = response.data?.map((elem: any) => {
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
    async getEgresso () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })
      if (response?.status === 200) {
        return JSON.stringify(response.data)
      }
    },
    returnEgresso (response: any) {
      return response
    },

    async fetchEgresso () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })

      if (response?.status === 200) {
        storage.remove('loggedEgresso')
        storage.set('loggedEgresso', JSON.stringify(response.data))
        const returnValue = JSON.stringify(response.data)
        return this.returnEgresso(returnValue)
      }
    },

    async fetchPublicEgresso (id: number) {
      const response = await Api.request({
        method: 'get',
        route: `/publico/egresso/${id}`
      })

      if (response?.status === 200) {
        const returnValue = JSON.stringify(response.data)
        return this.returnEgresso(returnValue)
      }
    },

    async atualizarEgresso (dataEgresso: any) {
      const response = await Api.request({
        method: 'put',
        route: '/egresso',
        body: dataEgresso
      })
      return (response?.status) !== undefined ? response.status : 500
    },

    async uploadImageEgresso (file: File) {
      if (file === undefined || file === null || file.size === 0 || file.length === 0) {
        return 201
      } else {
        const formData = new FormData()
        formData.append('arquivo', file)

        const response = await Api.request({
          method: 'post',
          route: '/egresso/foto',
          body: formData
        })
        // maxContentLength: 5 * 1024 * 1024 // 5 MB
        // console.log(response?.data)
        return (response?.status) !== undefined ? response.status : 500
      }
    },
    async fetchImageEgresso (egressoId: string) {
      const route = '/publico/egresso/foto/' + egressoId
      // const url = ''
      let response: any
      await Axios.get(route, {
        responseType: 'blob'
      }).then(res => {
        response = res
      })
      return response
    },

    async fetchImageEgressoUrl (egressoId: string) {
      const route = '/publico/egresso/foto/' + egressoId
      let url = ''
      let response = ''
      await Axios.get(route, {
        responseType: 'blob'
      }).then(res => {
        if (res?.status === 200) {
          const blob = new Blob([res.data], { type: 'image/png' })
          url = URL.createObjectURL(blob)
        }
        if (res?.status === 204) {
          url = ''
        }
      })
      response = url
      return response
    },
    // futuro remover por id: async removeImageEgresso (egressoId: string) {
    async removeImageEgresso () {
      const response = await Api.request({
        method: 'delete',
        route: '/egresso/foto'
      })
      return (response?.status) !== undefined ? response.status : 500
    }
  }

})
