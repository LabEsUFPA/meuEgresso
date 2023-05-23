import { defineStore } from 'pinia'
import { type models } from 'src/@types'
import Api from 'src/services/api'
// interface UserModel extends models.UserModel {}
import LocalStorage from 'src/services/localStorage'
interface ComplexOpts extends models.ComplexOpts {}
// interface EgressoModel extends models.EgressoModel {}
// interface EgressoModelUpdate extends models.EgressoModelUpdate {}
const storage = new LocalStorage()

interface State {
  generos: ComplexOpts[]
  faixasSalariais: ComplexOpts[]
  tiposBolsa: ComplexOpts[]
  tiposCota: ComplexOpts[]
}

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

    async fetchPublicEgresso (id: number) {
      const response = await Api.request({
        method: 'get',
        route: `/publico/egresso/${id}`
      })

      if (response?.status === 200) {
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
    }
  }
})
