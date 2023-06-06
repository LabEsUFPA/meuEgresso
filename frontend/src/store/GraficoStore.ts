import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}

interface dataGraph {
  values: PieChartSeries[]
  legend: string[]
}

export const useGraficoStore = defineStore('GraficoStore', {
  actions: {
    async fetchAll () {
      const [
        company,
        postGraduateCourse,
        postGraduateLocal,
        scholarshipType,
        interestInPost,
        acting,
        scholar,
        quotas,
        shareHolder,
        postGraduate,
        student,
        wage,
        sector,
        gender
      ] = await Promise.all([
        this.getCompanyData(),
        this.getPostGraduateCourseData(),
        this.getPostGraduateLocalData(),
        this.getScholarshipTypeData(),
        this.getInterestInPostData(),
        this.getActingData(),
        this.getScholarData(),
        this.getQuotasData(),
        this.getShareHolderData(),
        this.getPostGraduateData(),
        this.getStudentData(),
        this.getWageData(),
        this.getSectorData(),
        this.getGenderData()
      ])

      return {
        company,
        postGraduateCourse,
        postGraduateLocal,
        scholarshipType,
        interestInPost,
        acting,
        scholar,
        quotas,
        shareHolder,
        postGraduate,
        student,
        wage,
        sector,
        gender
      }
    },

    async getCompanyData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/empresas'
      })

      if ((response?.data) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        response.data.forEach((item: { empresa: string, quantidade: number }) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item.empresa })
          legend.push(item.empresa)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getPostGraduateCourseData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/cursos'
      })

      if ((response?.data) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        response.data.forEach((item: { curso: string, quantidade: number }) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item.curso })
          legend.push(item.curso)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getPostGraduateLocalData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/localPos'
      })

      if ((response?.data) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        response.data.forEach((item: { instituicao: string, quantidade: number }) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item.instituicao })
          legend.push(item.instituicao)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getScholarshipTypeData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/tipoBolsa'
      })

      if ((response?.data?.tipoBolsas) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.tipoBolsas).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getRemunerationData () {
      const remunerationDataX: string[] = []
      const remunerationDataY: number[] = []

      const response = await Api.request({
        method: 'get',
        route: '/grafico/remuneracao'
      })

      if ((response?.data?.remuneracaoContagem) != null) {
        Object.keys(response?.data.remuneracaoContagem).forEach((item: string) => {
          remunerationDataX.push(item)
          remunerationDataY.push(response?.data?.remuneracaoContagem[item])
        })
      }

      return {
        remunerationDataX,
        remunerationDataY,
        status: (response?.status) !== undefined ? response.status : 500
      }
    },

    async getInterestInPostData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/interesseEmPos'
      })

      if ((response?.data?.interesseContagem) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.interesseContagem).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getActingData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/atuacao'
      })

      if ((response?.data?.areaAtuacao) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.areaAtuacao).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getScholarData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/bolsistas'
      })

      if ((response?.data?.bolsistasContagem) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.bolsistasContagem).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getQuotasData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/cotas'
      })

      if ((response?.data?.cotaAtuacao) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.cotaAtuacao).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getShareHolderData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/cotista'
      })

      if ((response?.data?.cotistasEnumerados) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.cotistasEnumerados).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getPostGraduateData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/pos'
      })

      if ((response?.data?.posGraduacaoContagem) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.posGraduacaoContagem).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getStudentData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/tipoAlunos'
      })

      if ((response?.data?.tipoAlunos) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.tipoAlunos).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getWageData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/salarios'
      })

      if ((response?.data?.salarios) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.salarios).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getSectorData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/setor'
      })

      if ((response?.data?.setorAtuacao) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.setorAtuacao).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getGenderData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/generos'
      })

      if ((response?.data?.generos) != null) {
        const values: PieChartSeries[] = []
        const legend: string[] = []
        Object.keys(response?.data?.generos).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })

        const data: dataGraph = {
          values,
          legend
        }

        return {
          data
        }
      }
    },

    async getAgeData () {
      const ageDataX: string[] = []
      const ageDataY: number[] = []

      const response = await Api.request({
        method: 'get',
        route: '/grafico/idades'
      })

      if ((response?.data?.idadesEgressos) != null) {
        Object.keys(response?.data.idadesEgressos).forEach((item: string) => {
          ageDataX.push(item)
          ageDataY.push(response?.data?.idadesEgressos[item])
        })
      }

      return {
        ageDataX,
        ageDataY,
        status: (response?.status) !== undefined ? response.status : 500
      }
    }
  }
})
