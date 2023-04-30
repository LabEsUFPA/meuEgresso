<template>
  <form @submit.prevent="handleSubmit($event)">
    <div class="w-full flex items-center justify-center bg-neutral-100 my-8">
      <div
        v-if="!submitSuccess"
        class="flex flex-col items-center bg-white w-[960px] py-10 mx-6 rounded-2xl shadow-md"
      >
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />
        <h1 class="text-blue-900 text-4xl font-bold mb-12">
          Cadastro
        </h1>
        <div class="mb-8">
          <p class="text-blue-400 text-base text-center font-bold mb-5">
            Preencha os campos abaixo
          </p>
          <div class="flex flex-col gap-y-5 mb-4">
            <CustomInput
              label="Nome Completo"
              :required="true"
              :icon-path="mdiAccount"
              v-model="userRegisterData.name"
            />
            <CustomInput
              type="number"
              label="Matrícula"
              :required="true"
              :icon-path="mdiSchool"
              :max-length="12"
              :min-length="12"
              v-model="userRegisterData.registration"
            />
            <CustomInput
              type="email"
              label="Email"
              error-text="O email deve ser o mesmo cadastrado no SIGAA"
              :required="true"
              :icon-path="mdiEmail"
              v-model="userRegisterData.email"
            />
            <CustomInput
              type="password"
              label="Senha"
              :required="true"
              :icon-path="mdiLock"
              v-model="userRegisterData.password"
            />
            <CustomInput
              type="password"
              label="Confirme Senha"
              :required="true"
              :icon-path="mdiLock"
              v-model="userRegisterData.confirmationPassword"
            />
          </div>
        </div>
        <CustomButton type="submit">
          Enviar
        </CustomButton>
        <p class="mt-9">
          Já possui conta?
          <RouterLink
            to="/entrar"
            class="text-sky-600"
          >
            Entre
          </RouterLink>
        </p>
      </div>

      <div
        v-if="submitSuccess"
        class="bg-white w-[960px] py-20 mx-6 rounded-2xl"
      >
        <div class="flex flex-col items-center text-center gap-y-28 mx-4">
          <h1 class="text-blue-900 text-4xl font-bold">
            Suas informações estão sendo analisadas
          </h1>
          <img
            class="animate-spin mr-3 max-w-[100px]"
            src="../assets/loading.svg"
            alt="Loading"
          >
          <div>
            <p class="max-w-xl text-center text-blue-400 text-2xl mb-5">
              Aguarde o redirecionamento para a página de cadastro de egresso.
            </p>
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiAccount, mdiSchool, mdiEmail, mdiLock } from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import router from 'src/router'

const error = ref(false)
const errorMessages = ref({
  senha: 'As senhas informadas são diferentes',
  email: 'Os e-mails informados são diferentes',
  standard: 'Por favor, preencha todos os campos abaixo',
  accessLevel: 'Por favor, informe o nível de acesso',
  errorRequest: 'Requisição não aceita',
  userNotFound: 'Usuario não cadastrado pela faculdade'
})
const errorText = ref('')
const submitSuccess = ref(false)

interface registerData {
  name: string
  registration: string
  email: string
  password: string
  confirmationPassword: string
}

const userRegisterData = ref<registerData>({
  name: '',
  registration: '',
  email: '',
  password: '',
  confirmationPassword: ''
})

const handleSubmit = async ($event: Event) => {
  if (
    userRegisterData.value.password !== userRegisterData.value.confirmationPassword
  ) {
    errorText.value = errorMessages.value.senha
    error.value = true
  } else {
    const responseValidation = await useCadastroPerfilStore().egressValidation(
      userRegisterData.value.name,
      userRegisterData.value.registration,
      userRegisterData.value.email
    )

    if (responseValidation === 200) {
      error.value = false
      const responseRegister = await useCadastroPerfilStore().userProfileRegister(
        userRegisterData.value.email,
        userRegisterData.value.password,
        userRegisterData.value.email,
        userRegisterData.value.name,
        [{
          id: 3
        }]
      )

      if (responseRegister === 201) {
        submitSuccess.value = true
        router.push({ path: '/cadastro' })
      } else {
        errorText.value = errorMessages.value.errorRequest
        error.value = true
      }
    } else {
      errorText.value = errorMessages.value.userNotFound
      error.value = true
    }
  }
}
</script>

<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  /* display: none; <- Crashes Chrome on hover */
  -webkit-appearance: none;
  margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}

input[type="number"] {
  -moz-appearance: textfield; /* Firefox */
}
</style>
