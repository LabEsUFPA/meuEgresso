import { defineStore } from "pinia"
import Api from 'src/services/api'
import userModel from "src/model/usuarioModel"
import validateEgress from "src/model/validarEgressoModel"

export const useCadastroPerfilStore = defineStore('CadastroPerfilStore', {
  state: () => ({
  }),

  actions: {
    async egressValidation (
      nome: string,
      matricula: string,
      email: string,
    ) {
      const data: validateEgress = {
        nome,
        matricula,
        email
      }

      const response = await Api.request({
        method: 'post',
        route: '/egressoValido',
        body: data
      })

      return response?.status ? response.status : 500
    },

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

      return response?.status? response.status : 500
    }
  }
})
