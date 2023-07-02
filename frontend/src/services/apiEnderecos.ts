import axios from 'axios'
import { type models } from 'src/@types'
interface ComplexOpts extends models.ComplexOpts {}

interface ReturnValue {
  data: ComplexOpts[]
  maxPage: number
  status: number
}

interface ResponseType {
  id: number
  nome: string
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

async function getPaisById (id: number): Promise<string> {
  const pais: ResponseType = (await Axios.get(`/pais/${id}`)).data
  return pais.nome
}

async function getEstadoById (id: number): Promise<string> {
  const pais: ResponseType = (await Axios.get(`/estado/${id}`)).data
  return pais.nome
}

async function getCidadeById (id: number): Promise<string> {
  const pais: ResponseType = (await Axios.get(`/cidade/${id}`)).data
  return pais.nome
}

interface CidadeFull {
  id: number
  nome: string
  latitude: number
  longitude: number
}

async function getCidadeByIdFull (id: number): Promise<CidadeFull> {
  const cidade: CidadeFull = (await Axios.get(`/cidade/${id}`)).data
  return cidade
}

export default {
  getPaises,
  getEstados,
  getCidades,
  getPaisById,
  getEstadoById,
  getCidadeById,
  getCidadeByIdFull
}
