import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'

interface AnuncioVaga extends models.AnuncioModel {

}

export const useAnuncioVagaStore = defineStore('AnuncioVaga', {
  state: () => ({
    areasEmprego: [],
    anuncio: {
      id: 0,
      titulo: '',
      areaEmprego: {
        id: 0,
        nome: ''
      },
      descricao: '',
      dataExpiracao: '',
      link: '',
      salario: 10000.0
    }
  }),

  actions: {
    async fetchAnucio () {
      const response = await Api.request({
        method: 'get',
        route: '/anuncio'

      })
      if (response?.status === 200) {
        this.anuncio.id = response.data?.id
        this.anuncio.titulo = response.data?.titulo
        this.anuncio.areaEmprego = response.data?.areaEmprego
        this.anuncio.dataExpiracao = response.data?.dataExpiracao
        this.anuncio.salario = response.data?.salario
        this.anuncio.link = response.data?.link
        this.anuncio.descricao = response.data?.descricao
        return response.data
      }
    },

    async fetchAreasEmprego () {
      const response = await Api.request({
        method: 'get',
        route: '/areaemprego'
      })

      if (response?.status === 200) {
        this.areasEmprego = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async cadastraAnuncio (dadosAnuncio: AnuncioVaga) {
      const response = await Api.request({
        method: 'post',
        route: '/anuncio',
        body: dadosAnuncio
      })
      console.log('enviando:', dadosAnuncio)

      return (response?.status) !== undefined ? response.status : 500
    }
  }
})
