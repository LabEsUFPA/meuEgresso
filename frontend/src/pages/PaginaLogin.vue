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
import { useLoginStore } from 'src/store/LoginStore'

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
    await useLoginStore().userLogin(userLoginData.value.userName, userLoginData.value.password)
    await useLoginStore().saveUser()
    const response = useLoginStore().response

    if (response === 200) {
      error.value = false
    } else {
      error.value = true
    }
  } else {
    error.value = true
  }
}
</script>
