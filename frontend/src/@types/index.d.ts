type id = number

export namespace API {
  export interface RequestParams {
    method: string
    route: string
    body?: Record<string, any>
    params?: Record<string, any>
    headers?: Record<string, any>
    responseType?: any
  }

  export interface Response {
    status: number
    data?: Record<string, any> | null | any
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
    confirmationPassword?: string
    accessLevel?: string
    idAccessLevel?: number
  }

  export interface UserModel {
    id?: number
    username: string
    password: string
    email: string
    nome: string
    registration?: string
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
      areaAtuacao: string
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

  export interface EgressoMapa {
    id: {
      egressoId: number
      empresaId: number
    }
    nomeEgresso: string
    empresa: {
      id: number
      nome: string
      endereco: {
        id: number
        cidade: string
        estado: string
        pais: string
        latitude: number
        longitude: number
      }
    }
  }

  export interface ContaUsuarioModel {
    id: number
    username: string
    email: string
    nome: string
    senha: string
    grupos?: [
      {
        id: number
        nomeGrupo?: string
      }
    ]
  }

  export interface EgressoModelUpdate {
    id: number
    nascimento: string
    genero: {
      id: number
      nome: string
    }
    matricula: string | null
    cotista: boolean
    bolsista: boolean
    interesseEmPos: boolean
    lattes?: string | null
    linkedin?: string | null
    posGraduacao: boolean
    cotas: Array<{
      id: number
      nome: string
    }> | null

    usuario: {
      id: number
      username: string
      email: string
      nome: string
      grupos: Array<{
        id: number
        nomeGrupo: string
      }> | null
    }
    palestras?: {
      id: number
      descricao: string
    }
    contribuicao: {
      id: number
      descricao: string
    }
    titulacao?: {
      id: {
        egressoId: number
        titulacaoId: number
      }
      curso?: {
        id: number
        nome: string
      }
      titulacao?: {
        id: number
        nome: string
      }
    }
    emprego?: {
      id: {
        egressoId: number
        empresaId: number
      }
      empresa?: {
        id: number
        nome?: string
        setorAtuacoes?: Array<{
          id: number
          nome: string
        }> | null

        endereco?: {
          id: number
          cidade: string
          estado: string
          pais: string
        }
      }
      faixaSalarial?: {
        id: number
        faixa: string
      }
      areaAtuacao?: {
        id: number
        nome: string
      }
    }
    depoimento: {
      id: number
      descricao: string
    }
    bolsa?: {
      id: number
      nome: string
    }
    remuneracaoBolsa?: number
  }

  export namespace Graphics {
    export interface PieChartSeries {
      value: number
      name: string
    }

    export interface PieChartModel {
      values: PieChartSeries[]
      legend: string[]
    }

    export interface BarChartModel {
      x: string[]
      y: number[]
    }

    export interface AllChartSeries {
      company: {
        series: PieChartModel
        error: boolean
      } | null
      postGraduateCourse: {
        series: PieChartModel
        error: boolean
      } | null
      postGraduateLocal: {
        series: PieChartModel
        error: boolean
      } | null
      scholarshipType: {
        series: PieChartModel
        error: boolean
      } | null
      remuneration: {
        series: BarChartModel
        error: boolean
      } | null
      interestInPost: {
        series: PieChartModel
        error: boolean
      } | null
      acting: {
        series: PieChartModel
        error: boolean
      } | null
      scholar: {
        series: PieChartModel
        error: boolean
      } | null
      quotas: {
        series: PieChartModel
        error: boolean
      } | null
      shareHolder: {
        series: PieChartModel
        error: boolean
      } | null
      postGraduate: {
        series: PieChartModel
        error: boolean
      } | null
      student: {
        series: PieChartModel
        error: boolean
      } | null
      wage: {
        series: PieChartModel
        error: boolean
      } | null
      sector: {
        series: PieChartModel
        error: boolean
      } | null
      gender: {
        series: PieChartModel
        error: boolean
      } | null
      age: {
        series: BarChartModel
        error: boolean
      } | null
    }
  }

  export interface AnuncioModel {
    id: number
    titulo: string
    areaEmprego: {
      id: number
      nome: string
    }
    descricao: string
    dataExpiracao: string
    link: string
    salario: string
    createdBy: {
      email: string
      nome: string
    }
  }
  export interface AnuncioModelPost {
    titulo: string
    areaEmprego: {
      id: number
      nome: string
    }
    descricao: string
    dataExpiracao: string
    link: string
    salario: string
  }

  export interface areasEmpregoFiltro {
    id: number
    name: string
    selected: boolean
    selectable: boolean
  }

}
