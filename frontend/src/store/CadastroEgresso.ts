import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
interface ComplexOpts extends models.ComplexOpts {}
interface EgressoModel extends models.EgressoModel {}

type grupos = 'ADMIN' | 'SECRETARIO' | 'EGRESSO'
interface State {
  generos: ComplexOpts[]
  faixasSalariais: ComplexOpts[]
  tiposBolsa: ComplexOpts[]
  tiposCota: ComplexOpts[]
  instituicoes: ComplexOpts[]
  cursos: ComplexOpts[]
  page: number
  query: string
  totalPages: number
  isFetchingUniversidades: boolean
  areasAtuacao: ComplexOpts[]
}

interface userModel {
  id: number
  username: string
  email: string
  nome: string
  grupos: grupos[]
}

export const useCadastroEgressoStore = defineStore('CadastroEgresso', {
  state: (): State => ({
    generos: [],
    faixasSalariais: [],
    tiposBolsa: [],
    tiposCota: [],
    instituicoes: [],
    cursos: [],
    page: 0,
    query: '',
    totalPages: -1,
    isFetchingUniversidades: false,
    areasAtuacao: []
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
          return ({
            label: elem.nome,
            value: elem.id
          })
        })
      }
    },
    async fetchAreaEmprego () {
      // const response = await Api.request({
      //   method: 'get',
      //   route: 'publico/areaEmprego'
      // })

      // if (response?.status === 200) {
      //   this.areasAtuacao = response.data?.map((elem: any) => {
      //     return ({
      //       label: elem.nome,
      //       value: elem.id
      //     })
      //   })
      // }
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

    async fetchCursos () {
      const response = await Api.request({
        method: 'get',
        route: '/curso'
      })

      if (response?.status === 200) {
        this.cursos = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async fetchUniversidadesAsync (query: string, clean: boolean) {
      if (clean) {
        this.instituicoes = []
        this.page = 0
        this.totalPages = -1
        if (query === 'event') {
          query = ' '
        }
      }

      this.query = query
      if (this.page === this.totalPages) {
        return
      }

      this.isFetchingUniversidades = true
      const response = await Api.request({
        method: 'get',
        route: `/empresa?page=${this.page}&size=15&direction=ASC${query !== '' ? '&nome=' + query : ''}`
      })
      this.isFetchingUniversidades = false

      if (response?.status === 200 && response.data != null) {
        this.page += 1
        this.totalPages = response.data.totalPages

        this.instituicoes = [...this.instituicoes, ...response.data.content.map((elem: any) => {
          return {
            value: elem.id,
            label: elem.nome
          }
        })]
      }

      console.log(response)
    },

    async fetchMoreUniversidadesAsync () {
      await this.fetchUniversidadesAsync(this.query, false)
    },

    async fetchAll () {
      await this.fetchGeneros()
      await this.fetchFaixa()
      await this.fetchBolsas()
      await this.fetchCotas()
      await this.fetchCursos()
      await this.fetchAreaEmprego()
    },
    async cadastrarEgresso (foto: { temFoto: boolean, foto: FormData }, dadosEgresso: EgressoModel, adm: boolean = false, id: number | null = null) {
      let response = await Api.request({
        method: 'post',
        route: adm && id !== null ? `administrador/egresso/${id}` : '/egresso',
        body: dadosEgresso
      })

      if (response?.status === 201 && foto.temFoto) {
        response = await Api.request({
          method: 'post',
          route: adm && id !== null ? `administrador/egresso/foto/${id}` : 'egresso/foto',
          body: foto.foto

        })
      }

      await Api.request({
        method: 'post',
        route: 'auth/atualizarCookie'
      })

      return (response?.status) !== undefined ? response.status : 500
    },

    async cadastrarInstituicao (nome: string) {
      return await Api.request({
        method: 'post',
        route: '/empresa',
        body: {
          nome,

          isEmprego: false // tirar duvidas

        }
      })
    },
    async cadastrarEmpresa (nome: string, pais: number, estado: number, cidade: number) {
      return await Api.request({
        method: 'post',
        route: '/empresa',
        body: {
          nome,
          pais,
          estado,
          cidade,
          isEmprego: true
        }
      })
    },

    async cadastrarCurso (nome: string) {
      const response = await Api.request({
        method: 'post',
        route: '/curso',
        body: {
          nome
        }
      })

      await this.fetchCursos()
      return response
    },

    async fetchUserData (id: number): Promise<number | userModel> {
      const response = await Api.request({
        method: 'get',
        route: '/administrador/usuario'
      })

      if (response?.status === 200) {
        return response.data.filter((user: userModel) => {
          return user.id === id
        })[0]
      }

      return response?.status !== undefined ? response.status : 500
    }
  }
})
