export default interface egressoModel{
      id?: number,
      matricula: number,
      etnia?: {
        id: number,
        nome: string
      },
      email: string,
      genero: {
        id?: number,
        nome: string
      },
      cotista: boolean,
      pcd: boolean,
      interesseEmPos: boolean,
      lattes: string,
      linkedin: string,
      endereco: {
        id?: number,
        cidade: string,
        estado: string,
        pais: string
      }
}