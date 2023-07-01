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
  pageInstituicao: number
  queryInstituicao: string
  totalPagesInstituicao: number
  isFetchingUniversidades: boolean
  empresas: ComplexOpts[]
  pageEmpresas: number
  queryEmpresas: string
  totalPagesEmpresas: number
  isFetchingEmpresas: boolean
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
    empresas: [],
    pageEmpresas: 0,
    queryEmpresas: '',
    totalPagesEmpresas: -1,
    isFetchingEmpresas: false,
    cursos: [],
    pageInstituicao: 0,
    queryInstituicao: '',
    totalPagesInstituicao: -1,
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
        this.pageInstituicao = 0
        this.totalPagesInstituicao = -1
        if (query === 'event') {
          query = ' '
        }
      }

      this.queryInstituicao = query
      if (this.pageInstituicao === this.totalPagesInstituicao) {
        return
      }

      this.isFetchingEmpresas = true
      const response = await Api.request({
        method: 'get',
        route: `/empresa/universidade?page=${this.pageInstituicao}&size=15&direction=ASC${query !== '' ? '&nome=' + query : ''}`
      })
      this.isFetchingEmpresas = false

      if (response?.status === 200 && response.data != null) {
        this.pageInstituicao += 1
        this.totalPagesInstituicao = response.data.totalPages

        this.instituicoes = [...this.instituicoes, ...response.data.content.map((elem: any) => {
          return {
            value: elem.id,
            label: elem.nome
          }
        })]
      }
    },

    async fetchMoreUniversidadesAsync () {
      await this.fetchUniversidadesAsync(this.queryInstituicao, false)
    },

    async fetchEmpresasAsync (query: string, clean: boolean) {
      if (clean) {
        this.empresas = []
        this.pageEmpresas = 0
        this.totalPagesEmpresas = -1
        if (query === 'event') {
          query = ' '
        }
      }

      this.queryEmpresas = query
      if (this.pageEmpresas === this.totalPagesEmpresas) {
        return
      }

      this.isFetchingEmpresas = true
      const response = await Api.request({
        method: 'get',
        route: `/empresa/empresa?page=${this.pageEmpresas}&size=15&direction=ASC${query !== '' ? '&nome=' + query : ''}`
      })
      this.isFetchingEmpresas = false

      if (response?.status === 200 && response.data != null) {
        this.pageInstituicao += 1
        this.totalPagesInstituicao = response.data.totalPages

        this.empresas = [...this.empresas, ...response.data.content.map((elem: any) => {
          return {
            value: elem.id,
            label: elem.nome
          }
        })]
      }
    },

    async fetchMoreEmpresasAsync () {
      await this.fetchEmpresasAsync(this.queryInstituicao, false)
    },

    async fetchEmpresa (id: number) {
      const response = await Api.request({
        method: 'GET',
        route: `/empresa/${id}`
      })

      if (response?.status !== 200) {
        return null
      } else {
        return response.data
      }
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
