import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
import LocalStorage from 'src/services/localStorage'
interface LoginModel extends models.LoginModel {}

const storage = new LocalStorage()

export const useLoginStore = defineStore('LoginStore', {
  state: () => ({
    token: '',
    user: {}
  }),

  actions: {
    async userLogin (username: string, password: string) {
      const data: LoginModel = {
        username,
        password
      }

      const response = await Api.request({
        method: 'post',
        route: '/auth/login',
        body: data
      })
      if (response?.status === 200) {
        if (response.data?.token !== undefined) {
          const token: string = response.data.token
          document.cookie = `token=${token}`
        }
      }

      return (response?.status) !== undefined ? response.status : 500
    },

    async saveUser () {
      const response = await Api.request({
        method: 'get',
        route: '/usuario'
      })
      if (response?.status === 200) {
        storage.set('loggedUser', JSON.stringify(response.data))
      }
    }
  }
})
