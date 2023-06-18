import { defineStore } from 'pinia'
import Api from 'src/services/api'

export const useEmailStore = defineStore('emailStore', {

  actions: {
    async fetchEmail () {
      const response = await Api.request({
        method: 'get',
        route: 'administrador/mensagem'
      })

      return JSON.stringify(response?.data)
    },
    returnResponse (response: any) {
      return response
    },
    async createEmail (dataEmail: any) {
      const response = await Api.request({
        method: 'post',
        route: 'administrador/mensagem',
        body: dataEmail
      })

      return (response?.status) !== undefined ? response.status : 500
    },

    async updateEmail (dataEmail: any) {
      const response = await Api.request({
        method: 'put',
        route: 'administrador/mensagem',
        body: dataEmail
      })

      return (response?.status) !== undefined ? response.status : 500
    }

  }
})
