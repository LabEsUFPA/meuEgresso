import axios, { type AxiosError } from 'axios'
import type { API } from 'src/@types'

const baseURL = import.meta.env.VITE_API_URL_LOCAL

const Axios = axios.create({
  baseURL
})

Axios.interceptors.request.use((config) => {
  const cookies = getCookies()
  if (Object.keys(cookies).includes('token')) {
    config.headers.Authorization = `Bearer ${cookies.token}`
  }
  return config
})

const getCookies = (): Record<string, string> => {
  const cookieString = document.cookie
  const cookies: Record<string, string> = {}

  cookieString.split(';').forEach(cookie => {
    const [name, value] = cookie.split('=').map(c => c.trim())
    cookies[name] = value
  })

  return cookies
}

const request: API.Request = async ({
  method,
  route,
  body
}) => {
  let statusError: any = null
  const response = await Axios({
    method,
    url: route,
    data: body
  }).catch((error: AxiosError) => {
    statusError = (error.response != null) ? error.response.status : null
  })

  return {
    status: (response != null) ? response.status : statusError,
    data: (response != null) ? response.data : null
  }
}

export default {
  getCookies,
  request
}
