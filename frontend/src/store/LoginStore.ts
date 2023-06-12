import { defineStore } from 'pinia'
import Api from 'src/services/api'
import { type models } from 'src/@types'
import LocalStorage from 'src/services/localStorage'
interface LoginModel extends models.LoginModel {}

const storage = new LocalStorage()

interface UserData {
  exp: number
  iat: number
  idUsuario: number
  isEgresso: boolean
  iss: string
  nomeCompleto: string
  nome: string
  scope: string
  sobrenome: string
  sub: string
}

interface State {
  userLogged: boolean
  userData: UserData | null
}

const capitalize = (nome: string): string => {
  const result = nome.toLocaleLowerCase().split(' ').map((str) => {
    return str !== 'de' && str !== 'da' && str !== '' ? str[0].toUpperCase() + str.substring(1) : str
  }).join(' ')

  return result.trim()
}
export function parseToken (token: string | undefined): UserData | null {
  if (token === undefined) {
    return null
  }

  const base64Url = token.split('.')[1]
  const base64 = base64Url.replace('-', '+').replace('_', '/')

  const result: UserData = JSON.parse(window.atob(base64))
  result.nome = capitalize(result.nome)
  result.sobrenome = capitalize(result.sobrenome)
  result.nomeCompleto = `${result.nome} ${result.sobrenome}`

  return result
}

export const useLoginStore = defineStore('LoginStore', {
  state: (): State => ({
    userLogged: storage.getToken() !== undefined,
    userData: parseToken(storage.getToken())
  }),

  actions: {
    async userLogin (username: string, password: string) {
      const data: LoginModel = {
        username,
        password
      }

      const response = await Api.request({
        method: 'post',
        route: '/auth/login',
        body: data
      })

      if (response?.status === 200) {
        await this.saveUser()
        this.userLogged = true
        storage.set('loggedUser', JSON.stringify(parseToken(response.data?.token)))
      }

      return {
        status: (response?.status) !== undefined ? response.status : 500,
        data: (response?.data !== undefined) ? response?.data : null
      }
    },

    userLogout () {
      this.userLogged = false
      storage.remove('loggedUser')
      if (storage.has('loggedEgresso')) {
        storage.remove('loggedEgresso')
      }
      document.cookie = 'Token=; Max-Age=0'
    },

    async saveUser () {
      const response = await Api.request({
        method: 'get',
        route: '/usuario'
      })
      if (response?.status === 200) {
        console.log(response.data)
      }
    },

    getLoggedUser () {
      return JSON.parse(storage.get('loggedUser'))
    }
  }
})
