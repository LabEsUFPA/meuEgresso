import { defineStore } from 'pinia'
import Api from 'src/services/api'
import loginModel from 'src/model/loginModel'

export const useLoginStore = defineStore('LoginStore', {
  state: () => ({
    token: '',
    user: {},
    response: 0
  }),

  actions: {
    async userLogin (username: string, password: string) {
      const data: loginModel = {
        username,
        password
      }

      const response = await Api.request({
        method: 'post',
        route: '/auth/login',
        body: data
      })
      if (response?.status === 200) {
        document.cookie = `token=${response.data?.token}`
      }

      this.response = response?.status? response.status : 500
    },

    async saveUser () {
      const response = await Api.request({
        method: 'get',
        route: '/usuario'
      })
      if (response?.status === 200) {
        localStorage.setItem('user', JSON.stringify(response.data))
      }
    }
  }
})
