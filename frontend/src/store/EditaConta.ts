import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
/*
Precisa ter nome, email, senha do egresso
*/
interface ContaUsuario extends models.ContaUsuario {}


export const useEditaContaEgresso = defineStore('EditaContaEgresso', {
  state: () => ({
  }),

  actions: {
    async ContaUsuario (
      id: Number,
      username: string,
      email: string,
      nome: string,
      grupos?: [{
        id: number
      }]
      ) {
      const data: ContaUsuario = {
        id,
        username,
        email,
        nome,
        grupos
      }

      const response = await Api.request({
        method: 'get',
        route: '/usuario',
        body: data
      })

      return (response?.status) !== undefined ? response.status : 500
    },

    async ContaUsuarioUpdate (
      id: Number,
      username: string,
      email: string,
      nome: string,
      grupos?: [{
        id: number
      }]
      ) {
      const data: ContaUsuario = {
        id,
        username,
        email,
        nome,
        grupos
      }

      const response = await Api.request({
        method: 'put',
        route: '/usuario',
        body: data
      })

      return {
        status: (response?.status) !== undefined ? response.status : 500,
        data: (response?.data !== undefined) ? response?.data : null
      }
    }
  }
})
