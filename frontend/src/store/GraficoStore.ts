import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}
interface AllChartSeries extends models.Graphics.AllChartSeries {}

export const useGraficoStore = defineStore('GraficoStore', {
  actions: {
    async fetchAll () {
      const [
        company,
        postGraduateCourse,
        postGraduateLocal,
        scholarshipType,
        remuneration,
        interestInPost,
        acting,
        scholar,
        quotas,
        shareHolder,
        postGraduate,
        student,
        wage,
        sector,
        gender,
        age
      ] = await Promise.all([
        this.getCompanyData(),
        this.getPostGraduateCourseData(),
        this.getPostGraduateLocalData(),
        this.getScholarshipTypeData(),
        this.getRemunerationData(),
        this.getInterestInPostData(),
        this.getActingData(),
        this.getScholarData(),
        this.getQuotasData(),
        this.getShareHolderData(),
        this.getPostGraduateData(),
        this.getStudentData(),
        this.getWageData(),
        this.getSectorData(),
        this.getGenderData(),
        this.getAgeData()
      ])

      const response: AllChartSeries = {
        company,
        postGraduateCourse,
        postGraduateLocal,
        scholarshipType,
        remuneration,
        interestInPost,
        acting,
        scholar,
        quotas,
        shareHolder,
        postGraduate,
        student,
        wage,
        sector,
        gender,
        age
      }

      return response
    },

    async getCompanyData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/empresas'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        response.data?.forEach((item: { empresa: string, quantidade: number }) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item.empresa })
          legend.push(item.empresa)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getPostGraduateCourseData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/cursos'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        response.data?.forEach((item: { curso: string, quantidade: number }) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item.curso })
          legend.push(item.curso)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getPostGraduateLocalData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/localPos'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        response.data?.forEach((item: { instituicao: string, quantidade: number }) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item.instituicao })
          legend.push(item.instituicao)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getScholarshipTypeData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/tipoBolsa'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.tipoBolsas).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getRemunerationData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/remuneracao'
      })

      const x: string[] = []
      const y: number[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.remuneracaoContagem).forEach((item: string) => {
          x.push(`R$${item}`)
          y.push(response.data?.remuneracaoContagem[item])
        })
      }

      return x.length > 0 && y.length > 0 ? { x, y } : null
    },

    async getInterestInPostData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/interesseEmPos'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.interesseContagem).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getActingData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/atuacao'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.areaAtuacao).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getScholarData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/bolsistas'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.bolsistasContagem).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getQuotasData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/cotas'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.cotaAtuacao).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getShareHolderData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/cotista'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.cotistasEnumerados).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getPostGraduateData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/pos'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.posGraduacaoContagem).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getStudentData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/tipoAlunos'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.tipoAlunos).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getWageData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/salarios'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.salarios).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getSectorData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/setor'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.setorAtuacao).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getGenderData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/generos'
      })

      const values: PieChartSeries[] = []
      const legend: string[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.generos).forEach((item) => {
          values.push({ value: Math.floor(Math.random() * 100), name: item })
          legend.push(item)
        })
      }

      return values.length > 0 && legend.length > 0 ? { values, legend } : null
    },

    async getAgeData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/idades'
      })

      const x: string[] = []
      const y: number[] = []

      if ((response?.status) === 200) {
        Object.keys(response.data?.idadesEgressos).forEach((item: string) => {
          x.push(`${item} anos`)
          y.push(response.data?.idadesEgressos[item])
        })
      }

      return x.length > 0 && y.length > 0 ? { x, y } : null
    }
  }
})
