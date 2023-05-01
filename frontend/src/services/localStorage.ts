export default class LocalStorage {
  has (key: string): boolean {
    const value = window.localStorage.getItem(key)

    return value !== undefined
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
}
