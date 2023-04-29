export namespace API {
  export interface RequestParams {
    method: string
    route: string
    body?: {
      [key: string]: any
    }
  }

  export interface Response {
    status: number
    data?: {
      [key: string]: any
    } | null
  }
  export type Request = (params: RequestParams) => Promise<API.Response | null>

}

export default API
