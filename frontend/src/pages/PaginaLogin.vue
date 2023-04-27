<template>
  <form @submit.prevent="handleSubmit($event)">
    <div class="w-full flex items-center justify-center bg-neutral-100 my-8">
      <div
        class="flex flex-col items-center justify-center bg-white w-[960px] py-10 mx-6 rounded-2xl shadow-md"
      >
        <InvalidInsert
          text="Nome de usuário ou senha incorretos."
          :show-alert="error"
        />
        <h1 class="text-blue-900 text-4xl font-bold mb-12">
          Acessar Sistema
        </h1>
        <p class="text-blue-400 text-base text-center font-bold mb-6">
          Primeiro, você deve realizar login no sistema.
        </p>
        <div class="flex flex-col gap-y-5 mb-4">
          <CustomInput
            label="Usuário"
            :icon-path="mdiAccount"
            v-model="userLoginData.userName"
            :required="true"
          />
          <CustomInput
            label="Senha"
            type="password"
            :icon-path="mdiLock"
            v-model="userLoginData.password"
            :required="true"
          />
        </div>
        <p class="mb-14">
          Esqueceu a senha?
          <a
            href="./"
            class="text-sky-600"
          > Recupere aqui </a>
        </p>
        <CustomButton
          label="Entrar"
          type="submit"
        >
          Entrar
        </CustomButton>
        <p class="mt-9">
          Não possui login?
          <RouterLink
            to="/cadastro-perfil"
            class="text-sky-600"
          >
            Cadastre-se
          </RouterLink>
        </p>
      </div>
    </div>
  </form>
</template>

<script setup lang="ts">
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import { ref } from 'vue'
import { mdiAccount, mdiLock } from '@mdi/js'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import loginModel from 'src/model/loginModel'
import axios from 'axios'
import { sendLoginModel } from 'src/store/ResponseStore.vue'

const Axios = axios.create({
  baseURL: import.meta.env.VITE_API_URL_LOCAL
})

const error = ref(false)

interface loginData {
  userName: string
  password: string
}

const userLoginData = ref<loginData>({
  userName: '',
  password: ''
})

const handleSubmit = async ($event: Event) => {
  if (userLoginData.value.userName || userLoginData.value.password) {
    const data: loginModel = {
      username: userLoginData.value.userName,
      password: userLoginData.value.password
    }
    sendLoginModel(data)
    // await Axios({
    //   method: 'post',
    //   url: 'http://localhost:15000/auth/login',
    //   data
    // })
    //   .then(response => {
    //     if (response.status === 200) {
    //       error.value = false
    //       console.log(response.data)
    //     }
    //   })
    //   .catch(response => {
    //     if (response.response.status === 401) {
    //       error.value = true
    //     }
    //   })
  } else {
    error.value = true
  }
}
</script>
