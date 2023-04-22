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
          Criar Perfil
        </h1>
        <div class="mb-8 mx-4 sm:mx-0">
          <p class="text-blue-400 text-center font-bold mb-5 sm:text-base">
            Preencha os campos abaixo:
          </p>
          <div class="flex flex-col gap-y-4 sm:gap-y-6">
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                label="Nome Completo"
                :required="true"
                :icon-path="mdiAccount"
                v-model="userRegisterData.name"
              />
              <CustomInput
                label="Usuário"
                :required="true"
                :icon-path="mdiAccount"
                v-model="userRegisterData.userName"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                label="Email"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
                v-model="userRegisterData.email"
              />
              <CustomInput
                label="Confirmar email"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
                v-model="userRegisterData.confirmationEmail"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                label="Senha"
                type="password"
                :required="true"
                :icon-path="mdiLock"
                v-model="userRegisterData.password"
              />
              <CustomInput
                label="Confirmar senha"
                type="password"
                :required="true"
                :icon-path="mdiLock"
                v-model="userRegisterData.confirmationPassword"
              />
            </div>
          </div>
          <p class="text-blue-400 text-base font-bold mb-5 mt-7">
            Selecione o nível de acesso:
          </p>
          <div class="flex flex-col gap-y-2">
            <CustomSelect
              v-model="userRegisterData.accessLevel"
              label="Nível de Acesso"
              placeholder="Selecionar"
              :options="['Egresso', 'Secretário', 'Administrador']"
              :required="true"
            />
          </div>
        </div>
        <CustomButton
          type="submit"
        >
          Criar
        </CustomButton>
      </div>

      <div
        v-if="submitSuccess"
        class="flex flex-col bg-white w-[818px] mx-6 rounded-2xl"
      >
        <RouterLink
          to="/"
          class="flex self-end justify-center w-36 py-3 bg-red-400 font-semibold text-xl text-white rounded-tl-lg rounded-tr-lg rounded-bl-lg"
        >
          Fechar
        </RouterLink>
        <div class="flex flex-col items-center text-center pt-16 pb-28 gap-y-12">
          <img
            class="max-w-max"
            src="../assets/check.svg"
            alt="Loading"
          >
          <h1 class="text-blue-900 text-4xl font-bold">
            Perfil {{ userRegisterData.userName }} <br>
            criado com sucesso!
          </h1>
        </div>
      </div>
    </div>
  </form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiAccount, mdiEmail, mdiLock } from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomSelect from 'src/components/CustomSelect.vue'

const error = ref(false)
const errorMessages = ref({
  senha: 'As senhas informadas são diferentes',
  email: 'Os e-mails informados são diferentes',
  standard: 'Por favor, preencha todos os campos abaixo',
  accessLevel: 'Por favor, selecione o nível de acesso'
})
const errorText = ref('')
const submitSuccess = ref(false)

  interface registerData {
    name: string
    userName: string
    email: string
    confirmationEmail: string
    password: string
    confirmationPassword: string
    accessLevel: string
  }

const userRegisterData = ref<registerData>({
  name: '',
  userName: '',
  email: '',
  confirmationEmail: '',
  password: '',
  confirmationPassword: '',
  accessLevel: ''
})

const setSelectedAccessLevel = () => {
  if (userRegisterData.value.accessLevel === 'Egresso') {
    userRegisterData.value.accessLevel = 'egresso'
  } else if (userRegisterData.value.accessLevel === 'Secretário') {
    userRegisterData.value.accessLevel = 'secretario'
  } else {
    userRegisterData.value.accessLevel = 'administrador'
  }
}

const handleSubmit = ($event: Event) => {
  if (userRegisterData.value.password !== userRegisterData.value.confirmationPassword) {
    errorText.value = String(errorMessages.value.senha)
    error.value = true
  } else if (userRegisterData.value.email !== userRegisterData.value.confirmationEmail) {
    errorText.value = String(errorMessages.value.email)
    error.value = true
  } else if (userRegisterData.value.accessLevel === '') {
    errorText.value = String(errorMessages.value.accessLevel)
    error.value = true
  } else {
    setSelectedAccessLevel()
    error.value = false
    console.log(userRegisterData.value)
    submitSuccess.value = true
  }
}
</script>
