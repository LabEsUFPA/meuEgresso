import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}

export const useGraficoStore = defineStore('GraficoStore', {
  actions: {
    async getCompanyData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/empresas'
      })

      if ((response?.data) != null) {
        const companyData: PieChartSeries[] = []
        const companyLegend: string[] = []
        response.data.forEach((item: { empresa: string, quantidade: number }) => {
          companyData.push({ value: Math.floor(Math.random() * 100), name: item.empresa })
          companyLegend.push(item.empresa)
        })

        return {
          companyData,
          companyLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getPostGraduateCourseData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/cursos'
      })

      if ((response?.data) != null) {
        const postGraduateCourseData: PieChartSeries[] = []
        const postGraduateCourseLegend: string[] = []
        response.data.forEach((item: { curso: string, quantidade: number }) => {
          postGraduateCourseData.push({ value: Math.floor(Math.random() * 100), name: item.curso })
          postGraduateCourseLegend.push(item.curso)
        })

        return {
          postGraduateCourseData,
          postGraduateCourseLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getPostGraduateLocalData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/localPos'
      })

      if ((response?.data) != null) {
        const postGraduateLocalData: PieChartSeries[] = []
        const postGraduateLocalLegend: string[] = []
        response.data.forEach((item: { instituicao: string, quantidade: number }) => {
          postGraduateLocalData.push({ value: Math.floor(Math.random() * 100), name: item.instituicao })
          postGraduateLocalLegend.push(item.instituicao)
        })

        return {
          postGraduateLocalData,
          postGraduateLocalLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getScholarshipTypeData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/tipoBolsa'
      })

      if ((response?.data?.tipoBolsas) != null) {
        const scholarshipTypeData: PieChartSeries[] = []
        const scholarshipTypeLegend: string[] = []
        Object.keys(response?.data?.tipoBolsas).forEach((item) => {
          scholarshipTypeData.push({ value: Math.floor(Math.random() * 100), name: item })
          scholarshipTypeLegend.push(item)
        })

        return {
          scholarshipTypeData,
          scholarshipTypeLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getRemunerationData () {
      const remunerationDataX: string[] = []
      const remunerationDataY: number[] = []

      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/remuneracao'
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
        route: '/publico/grafico/interesseEmPos'
      })

      if ((response?.data?.interesseContagem) != null) {
        const interestInPostData: PieChartSeries[] = []
        const interestInPostLegend: string[] = []
        Object.keys(response?.data?.interesseContagem).forEach((item) => {
          interestInPostData.push({ value: Math.floor(Math.random() * 100), name: item })
          interestInPostLegend.push(item)
        })

        return {
          interestInPostData,
          interestInPostLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getActingData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/atuacao'
      })

      if ((response?.data?.areaAtuacao) != null) {
        const actingData: PieChartSeries[] = []
        const actingLegend: string[] = []
        Object.keys(response?.data?.areaAtuacao).forEach((item) => {
          actingData.push({ value: Math.floor(Math.random() * 100), name: item })
          actingLegend.push(item)
        })

        return {
          actingData,
          actingLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getScholarData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/bolsistas'
      })

      if ((response?.data?.bolsistasContagem) != null) {
        const scholarData: PieChartSeries[] = []
        const scholarLegend: string[] = []
        Object.keys(response?.data?.bolsistasContagem).forEach((item) => {
          scholarData.push({ value: Math.floor(Math.random() * 100), name: item })
          scholarLegend.push(item)
        })

        return {
          scholarData,
          scholarLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getQuotasData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/cotas'
      })

      if ((response?.data?.cotaAtuacao) != null) {
        const quotasData: PieChartSeries[] = []
        const quotasLegend: string[] = []
        Object.keys(response?.data?.cotaAtuacao).forEach((item) => {
          quotasData.push({ value: Math.floor(Math.random() * 100), name: item })
          quotasLegend.push(item)
        })

        return {
          quotasData,
          quotasLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getShareHolderData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/cotista'
      })

      if ((response?.data?.cotistasEnumerados) != null) {
        const shareHolderData: PieChartSeries[] = []
        const shareHolderLegend: string[] = []
        Object.keys(response?.data?.cotistasEnumerados).forEach((item) => {
          shareHolderData.push({ value: Math.floor(Math.random() * 100), name: item })
          shareHolderLegend.push(item)
        })

        return {
          shareHolderData,
          shareHolderLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getPostGraduateData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/pos'
      })

      if ((response?.data?.posGraduacaoContagem) != null) {
        const postGraduateData: PieChartSeries[] = []
        const postGraduateLegend: string[] = []
        Object.keys(response?.data?.posGraduacaoContagem).forEach((item) => {
          postGraduateData.push({ value: Math.floor(Math.random() * 100), name: item })
          postGraduateLegend.push(item)
        })

        return {
          postGraduateData,
          postGraduateLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getStudentData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/tipoAlunos'
      })

      if ((response?.data?.tipoAlunos) != null) {
        const studentData: PieChartSeries[] = []
        const studentLegend: string[] = []
        Object.keys(response?.data?.tipoAlunos).forEach((item) => {
          studentData.push({ value: Math.floor(Math.random() * 100), name: item })
          studentLegend.push(item)
        })

        return {
          studentData,
          studentLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getWageData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/salarios'
      })

      if ((response?.data?.salarios) != null) {
        const wageData: PieChartSeries[] = []
        const wageLegend: string[] = []
        Object.keys(response?.data?.salarios).forEach((item) => {
          wageData.push({ value: Math.floor(Math.random() * 100), name: item })
          wageLegend.push(item)
        })

        return {
          wageData,
          wageLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getSectorData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/setor'
      })

      if ((response?.data?.setorAtuacao) != null) {
        const activitySectorData: PieChartSeries[] = []
        const activitySectorLegend: string[] = []
        Object.keys(response?.data?.setorAtuacao).forEach((item) => {
          activitySectorData.push({ value: Math.floor(Math.random() * 100), name: item })
          activitySectorLegend.push(item)
        })

        return {
          activitySectorData,
          activitySectorLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getGenderData () {
      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/generos'
      })

      if ((response?.data?.generos) != null) {
        const genderData: PieChartSeries[] = []
        const genderDataLegend: string[] = []
        Object.keys(response?.data?.generos).forEach((item) => {
          genderData.push({ value: Math.floor(Math.random() * 100), name: item })
          genderDataLegend.push(item)
        })

        return {
          genderData,
          genderDataLegend,
          status: (response?.status) !== undefined ? response.status : 500
        }
      }
    },

    async getAgeData () {
      const ageDataX: string[] = []
      const ageDataY: number[] = []

      const response = await Api.request({
        method: 'get',
        route: '/publico/grafico/idades'
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
