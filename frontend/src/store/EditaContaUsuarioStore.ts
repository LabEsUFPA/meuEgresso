import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'

interface ContaUsuario extends models.ContaUsuarioModel {

}

export const useEditaContaUsuarioStore = defineStore('EditaContaUsuario', {
  state: () => ({
    usuario:{
      nomeCompleto: "",
      email: "",
      username: "",
    }
  }),

  actions: {
    async fetchUsuario () {

      const response = await Api.request({
        method: 'get',
        route: '/usuario',
   
      })
      if (response?.status === 200) {
        console.log("API FECTH USUARIO:", response.data)
        console.log("API FECTH USUARIO NOME:", response.data?.nome)
        console.log("API FECTH USUARIO EMAIL:", response.data?.email)
        console.log("API FECTH USUARIO USERNAME:", response.data?.username)
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
      nomeGrupo: string,
      ) {
      const dataUsuario = {
        id,
        username,
        email,
        nome,
        password,
        grupos:[{
          id:idGrupo,
          nomeGrupo:nomeGrupo
        }]
      }
      console.log("API UPDATE USUARIO DADOS:",dataUsuario);

      const response = await Api.request({
        method: 'put',
        route: '/usuario',
        body: dataUsuario

      })

      console.log("API UPDATE USUARIO RESPOSTA:", response?.data)
     

      return {
        status: (response?.status) !== undefined ? response.status : 500,
        data: (response?.data !== undefined) ? response?.data : null
      }
    }
  }
})
