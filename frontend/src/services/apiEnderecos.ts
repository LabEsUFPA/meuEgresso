import axios from 'axios'
import { type models } from 'src/@types'
interface ComplexOpts extends models.ComplexOpts {}

interface ReturnValue {
  data: ComplexOpts[]
  maxPage: number
  status: number
}

const baseURL = import.meta.env.VITE_URL_ENDERECOS

const Axios = axios.create({
  baseURL
})

async function getPaises (query: string, page: number): Promise<ReturnValue> {
  return await new Promise((resolve, reject) => {
    Axios.get(`/pais?page=${page}&direction=ASC&intercionalizacao=pt-BR${query !== '' ? '&nome=' + query : ''}`)
      .then(res => {
        resolve({
          data: res.data.content.map((elem: any) => ({
            value: elem.id,
            label: elem.nome
          })),
          maxPage: 13,
          status: res.status
        })
      })
      .catch(err => {
        reject(err)
      })
  })
}

async function getEstados (query: string, idPais: number, page: number): Promise<ReturnValue> {
  return await new Promise((resolve, reject) => {
    Axios.get(`/estado?page=${page}&direction=ASC&paisId=${idPais}${query !== '' ? '&nomeEstado=' + query : ''}`)
      .then(res => {
        resolve({
          data: res.data.content.map((elem: any) => ({
            value: elem.id,
            label: elem.nome
          })),
          maxPage: 13,
          status: res.status
        })
      })
      .catch(err => {
        reject(err)
      })
  })
}

async function getCidades (query: string, idEstado: number, page: number): Promise<ReturnValue> {
  return await new Promise((resolve, reject) => {
    Axios.get(`/cidade?page=${page}&direction=ASC&estadoId=${idEstado}${query !== '' ? '&nomeCidade=' + query : ''}`)
      .then(res => {
        resolve({
          data: res.data.content.map((elem: any) => ({
            value: elem.id,
            label: elem.nome
          })),
          maxPage: 13,
          status: res.status
        })
      })
      .catch(err => {
        reject(err)
      })
  })
}

export default {
  getPaises,
  getEstados,
  getCidades
}
