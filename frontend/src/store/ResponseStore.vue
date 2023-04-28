<script lang="ts">
import { useAuthStore } from 'src/store/AuthStore.vue'
import axios from 'axios'
import loginModel from 'src/model/loginModel'
import egressoModel from 'src/model/egressoModel'

const Axios = axios.create({
  baseURL: import.meta.env.VITE_API_URL_LOCAL
})

export async function sendLogin (username: string, password: string) {
  const data: loginModel = {
    username,
    password
  }
  const response = await Axios({
    method: 'post',
    url: '/auth/login',
    data
  })
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
    url: '/auth/login',
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
    url: '/egresso',
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
    url: '/egresso',
    data,
    headers: {
      Authorization: `Bearer ${token}`
    }
  })
  console.log(response)
  return response
}

</script>
