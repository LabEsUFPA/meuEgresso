import axios, { AxiosError } from "axios"
import API from 'src/model/apiModel'

const baseURL = import.meta.env.VITE_API_URL_LOCAL

const Axios = axios.create({
  baseURL
})

Axios.interceptors.request.use((config) => {
  const cookies = getCookies()
  if ( Object.keys(cookies).includes('token') ) {
    config.headers.Authorization = `Bearer ${cookies.token}`
  }
  return config
})


const getCookies = (): {[key: string]: string} => {
  const cookieString = document.cookie
  const cookies: {[key: string]: string} = {};

  cookieString.split(';').forEach(cookie => {
    const [name, value] = cookie.split('=').map(c => c.trim());
    cookies[name] = value;
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
      statusError = error.response? error.response.status : null
    })

    return {
      status: response ? response.status : statusError,
      data: response ? response.data : null
    }
}

export default {
  getCookies,
  request
}
