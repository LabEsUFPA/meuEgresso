import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}

export const useGraficoStore = defineStore('GraficoStore', {
  actions: {
    async getSectorData () {
      const response = await Api.request({
        method: 'get',
        route: '/grafico/setor'
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
        route: '/grafico/generos'
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
      const ageDataX: number[] = []
      const ageDataY: string[] = []

      const response = await Api.request({
        method: 'get',
        route: '/grafico/idades'
      })

      if ((response?.data?.idadesEgressos) != null) {
        Object.keys(response?.data.idadesEgressos).forEach((item: string) => {
          ageDataX.push(response?.data?.idadesEgressos[item])
          ageDataY.push(item)
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
