type id = number

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

  export interface ComplexOpts {
    label: string
    value: any
  }

  export interface EgressoModel {
    nascimento: string
    generoId: id
    matricula: string | null
    cotista: boolean
    bolsista: boolean
    interesseEmPos: boolean
    lattes?: string | null
    linkedin?: string | null
    posGraduacao: boolean
    cotas: Array<{
      id: id
    }> | null
    nome: string
    palestras?: {
      descricao?: string
    } | null
    contribuicao: {
      descricao: string
    }
    depoimento: {
      descricao: string
    }
    bolsaId?: id | null
    remuneracaoBolsa?: number
    empresa: {
      faixaSalarialId?: id | null
      setorAtuacao?: string
      nome?: string
      endereco?: {
        pais: string
        estado: string
        cidade: string
      }
    } | null
    titulacao?: {
      instituicao?: string
      curso?: string
    } | null
  }
}
