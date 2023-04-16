<template>
  <div class="w-full h-screen flex items-center justify-center bg-neutral-100">
    <div class="flex flex-col items-center justify-center bg-white w-[960px] pt-16 pb-8 mx-6 rounded-2xl">
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
        />
        <CustomInput
          label="Senha"
          type="password"
          :icon-path="mdiLock"
          v-model="userLoginData.password"
        />
      </div>
      <p class="mb-14">
        Esqueceu a senha?
        <a
          href="./"
          class="text-sky-600"
        >
          Recupere aqui
        </a>
      </p>
      <CustomButton
        label="Entrar"
        type="submit"
        @click="submit"
      />
      <p class="mt-9">
        Não possui login?
        <RouterLink
          to="/register"
          class="text-sky-600"
        >
          Cadastre-se
        </RouterLink>
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import { ref } from 'vue'
import { mdiAccount, mdiLock } from '@mdi/js'
import InvalidInsert from 'src/components/InvalidInsert.vue'

const error = ref(false)

interface loginData {
  userName: string
  password: string
}

const userLoginData = ref<loginData>({
  userName: '',
  password: ''
})

const submit = () => {
  if (userLoginData.value.userName || userLoginData.value.userName) {
    error.value = false
    console.log(userLoginData.value)
  } else {
    error.value = true
  }
}
</script>
