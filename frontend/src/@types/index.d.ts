export namespace API {
  export interface RequestParams {
    method: string
    route: string
    body?: Record<string, any>
  }

  export interface Response {
    status: number
    data?: Record<string, any> | null
  }
  export type Request = (params: RequestParams) => Promise<API.Response | null>

}

export namespace models {
  export interface LoginModel {
    username: string
    password: string
  }

  export interface ProfileRegisterModel {
    name: string
    username: string
    registration: string
    email: string
    confirmationEmail?: string
    password: string
    confirmationPassword: string
    accessLevel: string
    idAccessLevel?: number
  }

  export interface UserModel {
    id?: number
    username: string
    password: string
    email: string
    nome: string
    egresso?: {
      id: number
      matricula: number
      etnia: {
        id: number
        nome: string
      }
      genero: {
        id: number
        nome: string
      }
      cotista: true
      pcd: true
      interesseEmPos: true
      lattes: string
      linkedin: string
      endereco: {
        id: number
        cidade: string
        estado: string
        pais: string
      }
    }
    grupos?: [
      {
        id: number
        nomeGrupo?: string
      }
    ]
  }
  export interface ValidateEgress {
    nome: string
    matricula: string
    email: string
  }

}
