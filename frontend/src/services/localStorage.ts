import CookieService from './cookieService'
import { type models } from 'src/@types'
interface UserData extends models.UserData {}

const cookieService = new CookieService()

export default class LocalStorage {
  has (key: string): boolean {
    const value = window.localStorage.getItem(key)

    return value !== null
  }

  get (key: string): any {
    if (!this.has(key)) {
      return undefined
    }

    return window.localStorage.getItem(key)
  }

  set (key: string, value: any): void {
    window.localStorage.setItem(key, value)
  }

  remove (key: string): any {
    if (this.has(key)) {
      window.localStorage.removeItem(key)
    }
  }

  getLoggedUser (): UserData | null {
    const loggedUser = this.get('loggedUser')

    if (loggedUser !== undefined && cookieService.get('Token') !== undefined) return JSON.parse(loggedUser)
    return null
  }

  setLoggedUser (token: string): void {
    this.set('loggedUser', JSON.stringify(this.parseToken(token)))
  }

  getToken (): string | undefined {
    const cookieString = document.cookie
    const cookies: Record<string, string> = {}

    cookieString.split(';').forEach(cookie => {
      const [name, value] = cookie.split('=').map(c => c.trim())
      cookies[name] = value
    })

    if (cookies.Token !== undefined) {
      return cookies.Token
    }
    return undefined
  }

  capitalize = (nome: string): string => {
    const result = nome.toLocaleLowerCase().split(' ').map((str) => {
      return str !== 'de' && str !== 'da' && str !== '' ? str[0].toUpperCase() + str.substring(1) : str
    }).join(' ')

    return result.trim()
  }

  parseToken (token: string | undefined): UserData | null {
    if (token === undefined) {
      return null
    }

    const base64Url = token.split('.')[1]
    const base64 = base64Url.replace('-', '+').replace('_', '/')

    const result: UserData = JSON.parse(window.atob(base64))
    result.nome = this.capitalize(result.nome)
    result.sobrenome = this.capitalize(result.sobrenome)
    result.nomeCompleto = `${result.nome} ${result.sobrenome}`

    return result
  }
}
