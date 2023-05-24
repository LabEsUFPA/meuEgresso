import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
interface AnuncioVaga extends models.AnuncioModel {}
interface AnuncioVagaPost extends models.AnuncioModelPost {}
interface AreaEmpregoFiltro extends models.areasEmpregoFiltro {}

interface ComplexOpts extends models.ComplexOpts {}
import axios from 'axios'

interface State {
  anuncio: AnuncioVaga
  anuncios: AnuncioVaga []
  areasEmpregoFiltros: AreaEmpregoFiltro []
  areasEmprego: ComplexOpts []

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
    areasEmpregoFiltros: []
  }),

  actions: {
    async fetchAnuncios () {
      const response = await Api.request({
        method: 'get',
        route: '/anuncio'
      })

      if (response?.status === 200) {
        console.log('resposta API:', response.data)
        this.anuncios = response.data?.map((elem: any) => ({
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
        route: '/areaemprego'
      })
      if (response?.status === 200) {
        this.areasEmpregoFiltros = response.data?.map((elem: any) => ({
          id: elem.id,
          name: elem.nome,
          applied: false
        }))
        this.areasEmprego = response.data?.map((elem: any) => ({
          label: elem.nome,
          value: elem.id
        }))
      }
    },

    async fetchBuscaAnuncio (titulo: string, areasEmpregos: number[]) {
      const BASE_URL = 'http://localhost:15000'
      const rota = '/anuncio/busca'
      const params = {
        titulo,
        areaEmprego: areasEmpregos.join()
      }
      console.log(`${BASE_URL}${rota}`, { params })
      axios.get(`${BASE_URL}${rota}`, { params })
        .then(response => {
          console.log('data:', response.data)
          this.anuncios = response.data?.map((elem: any) => ({
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
        })
        .catch(error => {
          console.log('Falha na requisição', error)
        })
    },

    async fetchBuscaAnuncioTitulo (titulo: string) {
      const BASE_URL = 'http://localhost:15000'
      const rota = '/anuncio/busca'
      const params = {
        titulo
      }
      console.log(`${BASE_URL}${rota}`, { params })
      axios.get(`${BASE_URL}${rota}`, { params })
        .then(response => {
          console.log('data:', response.data)
          this.anuncios = response.data?.map((elem: any) => ({
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
        })
        .catch(error => {
          console.log('Falha na requisição', error)
        })
    },

    async fetchBuscaAnuncioAreas (areasEmpregos: number[]) {
      const BASE_URL = 'http://localhost:15000'
      const rota = '/anuncio/busca'
      const params = {
        areaEmprego: areasEmpregos.join()
      }
      console.log(`${BASE_URL}${rota}`, { params })
      axios.get(`${BASE_URL}${rota}`, { params })
        .then(response => {
          console.log('data:', response.data)
          this.anuncios = response.data?.map((elem: any) => ({
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
        })
        .catch(error => {
          console.log('Falha na requisição', error)
        })
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
