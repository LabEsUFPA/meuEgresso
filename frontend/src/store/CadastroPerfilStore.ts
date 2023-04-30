import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'

interface UserModel extends models.UserModel {}

interface ValidateEgress extends models.ValidateEgress {}

export const useCadastroPerfilStore = defineStore('CadastroPerfilStore', {
  state: () => ({
  }),

  actions: {
    async egressValidation (
      nome: string,
      matricula: string,
      email: string
    ) {
      const data: ValidateEgress = {
        nome,
        matricula,
        email
      }

      const response = await Api.request({
        method: 'post',
        route: '/egressoValido',
        body: data
      })

      return (response?.status) !== undefined ? response.status : 500
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
      const data: UserModel = {
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

      return (response?.status) !== undefined ? response.status : 500
    }
  }
})