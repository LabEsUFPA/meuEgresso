export default class CookieService {
  get (key: string): string | undefined {
    const cookieString = document.cookie
    const cookies: Record<string, string> = {}

    cookieString.split(';').forEach(cookie => {
      const [name, value] = cookie.split('=').map(c => c.trim())
      cookies[name] = value
    })

    if (cookies[key] !== undefined) {
      return cookies[key]
    }

    return undefined
  }

  set (key: string, value: string, exp: number): void {
    const d = new Date()
    d.setTime(d.getTime() + (exp * 3600000)) // tempo em ms
    const expires = 'expires=' + d.toUTCString()
    document.cookie = `${key}=${value};${expires};path=/`
  }

  remove (key: string): void {
    document.cookie = `${key}=; Max-Age=0`
  }
}
