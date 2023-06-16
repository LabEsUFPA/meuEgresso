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
}
