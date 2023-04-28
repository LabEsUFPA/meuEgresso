import { defineStore } from 'pinia'
import axios from 'axios'
import loginModel from 'src/model/loginModel'

const Axios = axios.create({
  baseURL: import.meta.env.VITE_API_URL_LOCAL
})
export const useLoginStore = defineStore('LoginStore', {
  state: () => ({
    token: '',
    response: 0
  }),

  actions: {
    async useLogin (username: string, password: string) {
      const data: loginModel = {
        username: username,
        password: password
      }
      
      await Axios({
        method: 'post',
        url: '/auth/login',
        data
      }).then(response => {
        this.token = response.data.token
        this.response = response.status
      }).catch(error => {
        this.response = error.response.status
      })
    }
  }
}
)
