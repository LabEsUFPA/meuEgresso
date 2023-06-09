import { defineStore } from 'pinia'
import Api from 'src/services/api'

export const useEditaContaUsuarioStore = defineStore('EditaContaUsuario', {
  state: () => ({
    usuario: {
      nomeCompleto: '',
      email: '',
      username: ''
    }
  }),

  actions: {
    async fetchUsuario () {
      const response = await Api.request({
        method: 'get',
        route: '/usuario'

      })
      if (response?.status === 200) {
        this.usuario.nomeCompleto = response.data?.nome
        this.usuario.email = response.data?.email
        this.usuario.username = response.data?.username
        return response.data
      }
    },

    async updateContaUsuario (
      id: number,
      username: string,
      email: string,
      nome: string,
      password: string,
      idGrupo: number,
      nomeGrupo: string
    ) {
      const dataUsuario = {
        id,
        username,
        email,
        nome,
        password,
        grupos: [{
          id: idGrupo,
          nomeGrupo
        }]
      }

      const response = await Api.request({
        method: 'put',
        route: '/usuario',
        body: dataUsuario

      })

      return {
        status: (response?.status) !== undefined ? response.status : 500,
        data: (response?.data !== undefined) ? response?.data : null
      }
    }
  }
})
