import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
// interface UserModel extends models.UserModel {}
import LocalStorage from 'src/services/localStorage'
import { ref } from 'vue'
import axios from 'axios'
interface ComplexOpts extends models.ComplexOpts {}
interface EgressoModel extends models.EgressoModel {}
interface EgressoModelUpdate extends models.EgressoModelUpdate {}
const storage = new LocalStorage()

const baseURL = import.meta.env.VITE_API_URL_LOCAL

const Axios = axios.create({
  baseURL,
  withCredentials: true
})
interface State {
  generos: ComplexOpts[]
  faixasSalariais: ComplexOpts[]
  tiposBolsa: ComplexOpts[]
  tiposCota: ComplexOpts[]

}
Axios.interceptors.request.use((config) => {
  const Token = new LocalStorage().getToken()
  if (Token !== undefined) config.headers.Authorization = `Bearer ${Token}`
  return config
})

export const usePerfilEgressoStore = defineStore('usePerfilEgressoStore', {
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

    async getUser () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })

      return (response?.status) !== undefined ? response.status : 500
    },
    async getEgresso () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })
      if (response?.status === 200) {
        return JSON.stringify(response.data)
      }
    },
    returnEgresso (response: any) {
      return response
    },
    async fetchEgresso () {
      const response = await Api.request({
        method: 'get',
        route: '/egresso'
      })

      if (response?.status === 200) {
        storage.remove('loggedEgresso')
        storage.set('loggedEgresso', JSON.stringify(response.data))
        const returnValue = JSON.stringify(response.data)
        return this.returnEgresso(returnValue)
      }
    },

    async atualizarEgresso (dataEgresso: any) {
      //   const data: EgressoModelUpdate = {
      //     id: number,
      // nascimento: string,
      // genero: {
      //   id: number,
      //   nome: string,
      // },
      // matricula: string,
      // cotista: boolean,
      // bolsista: boolean,
      // interesseEmPos: boolean,
      // lattes: string,
      // linkedin: string,
      // posGraduacao: boolean,
      // cotas: [
      //   {
      //     id: number,
      //     nome: string,
      //   },
      //   {
      //     id: number,
      //     nome: string,
      //   }
      // ]
      // usuario: {
      //   id: 1,
      //   username: "string",
      //   email: "string",
      //   nome: "string",
      //   grupos: [
      //     {
      //       id: number,
      //       nomeGrupo: string
      //     }
      //   ]
      // }
      // palestras: {
      //   id: number,
      //   descricao: string,
      // }
      // contribuicao: {
      //   id: number,
      //   descricao: string,
      // }
      // titulacao: {
      //   id: {
      //     egressoId: number,
      //     titulacaoId: number,
      //   }
      //   curso: {
      //     id: number,
      //     nome: string,
      //   }
      //   titulacao: {
      //     id: number,
      //     nome: string,
      //   }
      // }
      // emprego: {
      //   id: {
      //     egressoId: number,
      //     empresaId: number,
      //   }
      //   empresa: {
      //     id: number,
      //     nome: string,
      //     setorAtuacoes: [
      //       {
      //         id: number,
      //         nome: string,
      //       }
      //     ]
      //     endereco: {
      //       id: number,
      //       cidade: string,
      //       estado: string,
      //       pais: string,
      //     }
      //   }
      //   faixaSalarial: {
      //     id: number,
      //     faixa: string,
      //   }
      //   areaAtuacao: {
      //     id: number,
      //     nome: string,
      //   }
      // }
      // depoimento: {
      //   id: number,
      //   descricao: string,
      // }
      // bolsa: {
      //   id: number,
      //   nome: string,
      // }

      //  }

      const response = await Api.request({
        method: 'put',
        route: '/egresso',
        body: dataEgresso
      })
      return (response?.status) !== undefined ? response.status : 500
    },

    async uploadImageEgresso (file: File) {
      console.log(file)
      const formData = new FormData()
      formData.append('arquivo', file)

      const response = await Api.request({
        method: 'post',
        route: '/egresso/foto',
        body: formData
      })
      // maxContentLength: 5 * 1024 * 1024 // 5 MB
      console.log(response.data)
      return (response?.status) !== undefined ? response.status : 500
    },

    async handleFileUpload (event: Event) {
      const file = ref<File | null>(null)
      const target = event.target as HTMLInputElement
      if (target.files != null) {
        file.value = target.files[0]
      }

      if (file.value == null) {
        const formData = new FormData()
        formData.append('arquivo', file.value)

        const response = await Api.request({
          method: 'post',
          route: '/egresso/foto',
          body: formData
        })

        console.log(response.data)
      }
    },
    async fetchImageEgresso (egressoId: string) {
      const route = '/egresso/foto/' + egressoId
      const url = ''
      let response: any
      await Axios.get(route, {
        responseType: 'blob'
      }).then(res => {
        // const blob = new Blob([res.data])

        // url = URL.createObjectURL(blob)
        response = res
        // if (res?.status === 200) {
        //   return res
        // }
        // return JSON.stringify(url)
      })
      return response
    }
  }
})
