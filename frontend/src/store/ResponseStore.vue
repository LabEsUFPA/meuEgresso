<script lang="ts">
import { useAuthStore } from 'src/store/AuthStore.vue'
// import { defineAsyncComponent } from 'vue'
import Axios from 'axios'
import loginModel from 'src/model/loginModel'
import egressoModel from 'src/model/egressoModel'
const baseUrl = `${import.meta.env.VITE_API_URL}`
const loginUrl = `'${baseUrl}/auth/login'`
// login

export async function sendLogin (username: string, password: string) {
  const data: loginModel = {
    username,
    password
  }
  const response = await Axios({
    method: 'post',
    url: 'http://localhost:15000/auth/login',
    data
  })
  // .then(response => {
  //     console.log(response.data)
  //     if (response.status === 201) {
  //       submitSuccess.value = true
  //     }
  //   })
  //   .catch(response => {
  //     console.log(response.data)
  //     if (response.response.status === 401) {
  //       errorText.value = errorMessages.value.errorRequest
  //       error.value = true
  //     }
  //   })
  console.log(baseUrl)
  const token = response.data.token

  // store the token in the auth store
  useAuthStore().setUserToken(token)
  return response
}

export async function sendLoginModel (data: loginModel) {
  console.log('login1')
  console.log(baseUrl)
  const response = await Axios({
    method: 'post',
    url: 'http://localhost:15000/auth/login',
    data
  })

  const token = response.data.token
  useAuthStore().setUserToken(token)
  console.log(token)

  console.log('Token: ' + useAuthStore().getUserToken())
  return response
}
//

// Egresso
export async function updateEgressoDataModel (data: egressoModel) {
  const token = useAuthStore().getUserToken()
  console.log('Token: ' + token)
  console.log(data)
  const response = await Axios({
    method: 'put',
    url: 'http://localhost:15000/egresso',
    data,
    headers: {
      Authorization: `Bearer ${token}`
    }
  })
  console.log(response)
  return response
}
export async function postEgressoDataModel (data: egressoModel) {
  const token = useAuthStore().getUserToken()
  console.log('Token: ' + token)
  console.log(data)
  const response = await Axios({
    method: 'post',
    url: 'http://localhost:15000/egresso',
    data,
    headers: {
      Authorization: `Bearer ${token}`
    }
  })
  console.log(response)
  return response
}

export async function sendEgressoData () {
  // const token = useAuthStore().getUserToken()
  // const data: egressoModel = {
  //   // String to number >:)

  //   matricula: +dataEgresso.value.academico.matricula,
  //   genero: {
  //     nome: dataEgresso.value.geral.genero
  //   },
  //   cotista: dataEgresso.value.academico.cotista.value,
  //   pcd: dataEgresso.value.academico.bolsista.value,
  //   interesseEmPos: dataEgresso.value.academico.posGrad.value,
  //   lattes: dataEgresso.value.geral.lattes,
  //   linkedin: dataEgresso.value.geral.linkedin,
  //   endereco: {
  //     cidade: dataEgresso.value.localizacao.cidade,
  //     estado: dataEgresso.value.localizacao.estado,
  //     pais: dataEgresso.value.localizacao.pais
  //   }
  // }
  // const response = await Axios({
  //   method: 'post',
  //   url: '${baseUrl}/egresso',
  //   data,
  //   headers: {
  //     Authorization: `Bearer ${token}`
  //   }
  // })
  //  return response

}
//

</script>
