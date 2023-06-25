import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
import LocalStorage from 'src/services/localStorage'
import CookieService from 'src/services/cookieService'
interface LoginModel extends models.LoginModel {}
interface UserData extends models.UserData {}

const storage = new LocalStorage()
const cookieService = new CookieService()

export const useLoginStore = defineStore('LoginStore', {
  state: () => ({
    loggedIn: storage.getToken() !== undefined,
    userData: cookieService.get('Token') !== undefined ? storage.parseToken(cookieService.get('Token')) : null,
    isFirstAccess: storage.getToken() === undefined ? 'empty' : 'no'
  }),

  actions: {
    async userLogin (username: string, password: string, tokenAuth?: string) {
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
        if (tokenAuth !== undefined) {
          const validation = await this.validateEmail(tokenAuth)
          if (validation.status === 204) {
            this.isFirstAccess = 'yes'
          } else {
            return {
              status: validation.status,
              data: validation?.data
            }
          }
        } else {
          this.isFirstAccess = 'no'
        }
        this.loggedIn = true
        storage.setLoggedUser(response.data?.token)
        this.setUserData(storage.parseToken(response.data?.token))
      }

      return {
        status: (response?.status) !== undefined ? response.status : 500,
        data: (response?.data !== undefined) ? response?.data : null
      }
    },

    userLogout () {
      this.loggedIn = false
      storage.remove('loggedUser')
      cookieService.remove('Token')
      this.userData = null
      this.isFirstAccess = 'empty'
      if (storage.has('loggedEgresso')) {
        storage.remove('loggedEgresso')
      }
    },

    async validateEmail (tokenAuth: string) {
      const response = await Api.request({
        method: 'post',
        route: `/auth/validarEmail/${tokenAuth}`
      })

      return {
        status: (response?.status) !== undefined ? response.status : 500,
        data: (response?.data !== undefined) ? response?.data : null
      }
    },

    getUserData (): UserData | null {
      if (this.userData !== undefined && cookieService.get('Token') !== undefined) return this.userData
      return null
    },

    setUserData (userData: UserData | null): void {
      this.userData = userData
    }
  }
})
