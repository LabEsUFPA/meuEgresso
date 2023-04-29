import { defineStore } from "pinia"
import Api from 'src/services/api'
import userModel from "src/model/usuarioModel"

export const useCadastroPerfilStore = defineStore('CadastroPerfilStore', {
  state: () => ({
    response: 0
  }),

  actions: {
    async userProfileRegister (
      username: string,
      password: string,
      email: string,
      nome: string,
      grupos?: [{
        id: number
      }]
    ) {
      const data: userModel = {
        username,
        password,
        email,
        nome,
        grupos
      }

      const response = await Api.request({
        method: 'post',
        route: '/auth/register',
        body: data
      })

      this.response = response?.status? response.status : 500
    }
  }
})
