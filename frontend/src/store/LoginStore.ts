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
    userData: cookieService.get('Token') !== undefined ? storage.parseToken(cookieService.get('Token')) : null
  }),

  actions: {
    async userLogin (username: string, password: string, isFirstAccess?: boolean) {
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
        this.loggedIn = true
        storage.setLoggedUser(response.data?.token)
        this.setUserData(storage.parseToken(response.data?.token))

        isFirstAccess ?? false ? cookieService.set('isFirstAccess', 'yes', 1) : cookieService.set('isFirstAccess', 'no', 1)
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
      if (storage.has('loggedEgresso')) {
        storage.remove('loggedEgresso')
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
