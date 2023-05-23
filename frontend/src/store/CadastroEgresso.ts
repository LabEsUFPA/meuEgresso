import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
interface ComplexOpts extends models.ComplexOpts {}
interface EgressoModel extends models.EgressoModel {}

interface State {
  generos: ComplexOpts[]
  faixasSalariais: ComplexOpts[]
  tiposBolsa: ComplexOpts[]
  tiposCota: ComplexOpts[]
}

export const useCadastroEgressoStore = defineStore('CadastroEgresso', {
  state: (): State => ({
    generos: [],
    faixasSalariais: [],
    tiposBolsa: [],
    tiposCota: []
  }),

  actions: {
    async fetchGeneros () {
      const response = await Api.request({
        method: 'get',
        route: '/genero'
      })

      if (response?.status === 200) {
        this.generos = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async fetchFaixa () {
      const response = await Api.request({
        method: 'get',
        route: '/faixaSalarial'
      })

      if (response?.status === 200) {
        this.faixasSalariais = response.data?.map((elem: any) => ({
          label: elem.faixa,
          value: elem.id
        }))
      }
    },

    async fetchBolsas () {
      const response = await Api.request({
        method: 'get',
        route: '/tipoBolsa'
      })

      if (response?.status === 200) {
        this.tiposBolsa = response.data?.map((elem: any) => {
          console.log(elem)

          return ({
            label: elem.nome,
            value: elem.id
          })
        })
      }
    },

    async fetchCotas () {
      const response = await Api.request({
        method: 'get',
        route: '/cota'
      })

      if (response?.status === 200) {
        this.tiposCota = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async fetchAll () {
      await this.fetchGeneros()
      await this.fetchFaixa()
      await this.fetchBolsas()
      await this.fetchCotas()
    },

    async cadastrarEgresso (foto: { temFoto: boolean, foto: FormData }, dadosEgresso: EgressoModel) {
      const response = await Api.request({
        method: 'post',
        route: '/egresso',
        body: dadosEgresso
      })

      if (response?.status === 201 && foto.temFoto) {
        const responseFoto = await Api.request({
          method: 'post',
          route: 'egresso/foto',
          body: foto
        })

        return (responseFoto?.status) !== undefined ? responseFoto.status : 500
      }

      return (response?.status) !== undefined ? response.status : 500
    }
  }
})
