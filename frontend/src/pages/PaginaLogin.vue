<template>
  <Form
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
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
            name="username"
            label="Usuário"
            :icon-path="mdiAccount"
            error-message="Informe o seu usuário"
            required
          />
          <CustomInput
            name="password"
            label="Senha"
            :type="showPassword? 'text' : 'password'"
            :icon-path="mdiLock"
            error-message="Informe a sua senha"
            required
          />
          <CustomCheckbox
            label="Visualizar senha"
            name="showPassword"
            @update:value="toggleShowPassword"
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
  </Form>
</template>

<script setup lang="ts">
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import { ref } from 'vue'
import { Form } from 'vee-validate'
import { object, string } from 'yup'
import { mdiAccount, mdiLock } from '@mdi/js'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import { useLoginStore } from 'src/store/LoginStore'
import router from 'src/router'
import { models } from 'src/@types'
interface LoginModel extends models.LoginModel {}

const error = ref(false)
const storeLogin = useLoginStore()

const schema = object().shape({
  username: string().required(),
  password: string().required()
})

const showPassword = ref(false)
const toggleShowPassword = () => {
  showPassword.value = !showPassword.value
}

const handleSubmit = async (submitData: any) => {
  const loginData: LoginModel = submitData

  if (loginData.username || loginData.password) {
    const response = await storeLogin.userLogin(loginData.username, loginData.password)

    if (response === 200) {
      error.value = false
      router.push('/')
    } else {
      error.value = true
    }
  } else {
    error.value = true
  }
}

const onInvalid = (e: any) => {
  console.log(e)
}
</script>

<style>
input::-ms-reveal,
input::-ms-clear {
  display: none;
}
</style>
