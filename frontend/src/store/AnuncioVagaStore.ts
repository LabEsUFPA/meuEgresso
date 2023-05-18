import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'

interface AnuncioVaga extends models.AnuncioModel {

}

export const useAnuncioVagaStore = defineStore('AnuncioVaga', {
  state: () => ({
    anuncio:{
      id: 0,
      titulo: "",
      area: "",
      dataExpiracao: "",
      salario: "",
      contato: "",
      descricao:"",
    }  
  }),

  actions: {
    async fetchAnucio () {
      const response = await Api.request({
        method: 'get',
        route: '/anuncio',
   
      })
      if (response?.status === 200) {
        this.anuncio.id = response.data?.id
        this.anuncio.titulo = response.data?.titulo
        this.anuncio.area = response.data?.area
        this.anuncio.dataExpiracao = response.data?.dataExpiracao
        this.anuncio.salario = response.data?.salario
        this.anuncio.contato = response.data?.contato
        this.anuncio.descricao = response.data?.descricao
        return response.data
      }
    },

    async cadastraAnuncio (dadosAnuncio: AnuncioVaga) {
      const response = await Api.request({
        method: 'post',
        route: '/anuncio',
        body: dadosAnuncio
      })

      return (response?.status) !== undefined ? response.status : 500
    }
  }
})
