/* eslint-disable @typescript-eslint/restrict-template-expressions */
import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
interface AnuncioVaga extends models.AnuncioModel { }
interface AnuncioVagaPost extends models.AnuncioModelPost { }
interface AreaEmpregoFiltro extends models.areasEmpregoFiltro { }

interface ComplexOpts extends models.ComplexOpts { }

interface State {
  anuncio: AnuncioVaga
  anuncios: AnuncioVaga[]
  areasEmpregoFiltros: AreaEmpregoFiltro[]
  areasEmprego: ComplexOpts[]
  totalPages: number

}

export const useAnuncioVagaStore = defineStore('AnuncioVaga', {
  state: (): State => ({
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
      salario: '',
      createdBy: {
        email: '',
        nome: ''
      }
    },
    anuncios: [],
    areasEmprego: [],
    areasEmpregoFiltros: [],
    totalPages: 0
  }),

  actions: {
    async fetchAnuncios () {
      const response = await Api.request({
        method: 'get',
        route: '/anuncio'
      })

      if (response?.status === 200) {
        this.totalPages = response.data?.totalPages
        this.anuncios = response.data?.content.map((elem: any) => ({
          id: elem.id,
          titulo: elem.titulo,
          areaEmprego: {
            id: elem.areaEmprego.id,
            nome: elem.areaEmprego.nome
          },
          descricao: elem.descricao,
          dataExpiracao: elem.dataExpiracao,
          link: elem.link,
          salario: elem.salario,
          createdBy: {
            email: elem.createdBy.email,
            nome: elem.createdBy.nome
          }
        }))
      }
    },

    async deleteAnuncioAdmin (id: number) {
      const response = await Api.request({
        method: 'delete',
        route: '/administrador/anuncio/' + id.toString()
      })

      if (response?.status === 200) {
        return true
      } else {
        return false
      }
    },

    async deleteAnuncioEgresso (id: number) {
      const response = await Api.request({
        method: 'delete',
        route: '/anuncio/' + id.toString()
      })

      if (response?.status === 200) {
        return true
      } else {
        return false
      }
    },

    async fetchBusca (page: number, size: number) {
      const response = await Api.request({
        method: 'get',
        route: '/anuncio/busca',
        params: { page, size }
      })

      if (response?.status === 200) {
        this.totalPages = response.data?.totalPages
        this.anuncios = response.data?.content.map((elem: any) => ({
          id: elem.id,
          titulo: elem.titulo,
          areaEmprego: {
            id: elem.areaEmprego.id,
            nome: elem.areaEmprego.nome
          },
          descricao: elem.descricao,
          dataExpiracao: elem.dataExpiracao,
          link: elem.link,
          salario: elem.salario,
          createdBy: {
            email: elem.createdBy.email,
            nome: elem.createdBy.nome
          }
        }))
      }
    },

    async fetchBuscaAnuncio (titulo: string, areasEmpregos: number[], page: number, size: number) {
      const areaEmprego = areasEmpregos.join()
      const response = await Api.request({
        method: 'get',
        route: '/anuncio/busca',
        params: { titulo, areaEmprego, page, size }
      })
      if (response?.status === 200) {
        this.totalPages = response.data?.totalPages
        this.anuncios = response.data?.content.map((elem: any) => ({
          id: elem.id,
          titulo: elem.titulo,
          areaEmprego: {
            id: elem.areaEmprego.id,
            nome: elem.areaEmprego.nome
          },
          descricao: elem.descricao,
          dataExpiracao: elem.dataExpiracao,
          link: elem.link,
          salario: elem.salario,
          createdBy: {
            email: elem.createdBy.email,
            nome: elem.createdBy.nome
          }
        }))
      }
    },

    async fetchBuscaAnuncioTitulo (titulo: string, page: number, size: number) {
      const response = await Api.request({
        method: 'get',
        route: '/anuncio/busca',
        params: { titulo, page, size }
      })
      if (response?.status === 200) {
        this.totalPages = response.data?.totalPages
        this.anuncios = response.data?.content.map((elem: any) => ({
          id: elem.id,
          titulo: elem.titulo,
          areaEmprego: {
            id: elem.areaEmprego.id,
            nome: elem.areaEmprego.nome
          },
          descricao: elem.descricao,
          dataExpiracao: elem.dataExpiracao,
          link: elem.link,
          salario: elem.salario,
          createdBy: {
            email: elem.createdBy.email,
            nome: elem.createdBy.nome
          }
        }))
      }
    },

    async fetchBuscaAnuncioAreas (areasEmpregos: number[], page: number, size: number) {
      const areaEmprego = areasEmpregos.join()
      const response = await Api.request({
        method: 'get',
        route: '/anuncio/busca',
        params: { areaEmprego, page, size }
      })
      if (response?.status === 200) {
        this.totalPages = response.data?.totalPages
        this.anuncios = response.data?.content.map((elem: any) => ({
          id: elem.id,
          titulo: elem.titulo,
          areaEmprego: {
            id: elem.areaEmprego.id,
            nome: elem.areaEmprego.nome
          },
          descricao: elem.descricao,
          dataExpiracao: elem.dataExpiracao,
          link: elem.link,
          salario: elem.salario,
          createdBy: {
            email: elem.createdBy.email,
            nome: elem.createdBy.nome
          }
        }))
      }
    },
    async fetchAreasEmprego () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/areaemprego'
      })
      if (response?.status === 200) {
        this.areasEmpregoFiltros = response.data?.map((elem: any) => ({
          id: elem.id,
          name: elem.nome,
          selected: false,
          selectable: true
        }))
        this.areasEmprego = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async cadastraAnuncio (dadosAnuncio: AnuncioVagaPost) {
      const response = await Api.request({
        method: 'post',
        route: '/anuncio',
        body: dadosAnuncio
      })
      return (response?.status) !== undefined ? response.status : 500
    },

    getAnuncioId (id: number) {
      const anuncioEncontrado = this.anuncios.find(element => element.id === id)
      if (anuncioEncontrado !== undefined) {
        this.anuncio = anuncioEncontrado
      } else {
        // Lógica para lidar com a situação em que o anúncio não foi encontrado
        this.anuncio = {
          id: 0,
          titulo: 'Não encontrado',
          areaEmprego: {
            id: 0,
            nome: ''
          },
          descricao: '',
          dataExpiracao: '',
          link: '',
          salario: '',
          createdBy: {
            email: '',
            nome: ''
          }
        }
      }
    }
  }
})
