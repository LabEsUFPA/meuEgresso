import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
import LocalStorage from 'src/services/localStorage'
interface LoginModel extends models.LoginModel {}

const storage = new LocalStorage()

export const useLoginStore = defineStore('LoginStore', {
  state: () => ({
    userLogged: storage.getToken() !== undefined
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

      await this.saveUser()
      this.userLogged = true
      return (response?.status) !== undefined ? response.status : 500
    },

    userLogout () {
      this.userLogged = false
      storage.remove('loggedUser')
      document.cookie = 'Token=; Max-Age=0'
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
