<template>
  <div class="w-full h-screen flex items-center justify-center bg-neutral-100">
    <div
      v-if="!submitSuccess"
      class="flex flex-col items-center bg-white w-[960px] pt-16 pb-8 mx-6 rounded-2xl"
    >
      <InvalidInsert
        text="Por favor, preencha todos os campos abaixo"
        :show-alert="error"
      />
      <h1 class="text-blue-900 text-4xl font-bold mb-12">
        Criar Perfil
      </h1>
      <div class="mb-8 mx-4 sm:mx-0">
        <p class="text-blue-400 text-base font-bold mb-5">
          Preencha os campos abaixo:
        </p>
        <div class="flex flex-col gap-y-6">
          <div class="flex gap-x-6 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32">
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

          <div class="flex gap-x-6 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32">
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

          <div class="flex gap-x-6 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32">
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
          Preencha os campos abaixo:
        </p>
        <div class="flex flex-col gap-y-2">
          <CustomCheckbox
            label="Ediçao"
            v-model="userRegisterData.edit"
          />
          <CustomCheckbox
            label="Visualização"
            v-model="userRegisterData.visualization"
          />
          <CustomCheckbox
            label="Alteração"
            v-model="userRegisterData.alteration"
          />
          <CustomCheckbox
            label="Exclusão"
            v-model="userRegisterData.exclusion"
          />
          <CustomCheckbox
            label="Administrador"
            v-model="userRegisterData.admin"
          />
        </div>
      </div>
      <CustomButton
        label="Criar"
        type="submit"
        @click="submit"
      />
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
</template>

<script setup lang="ts">
import { ref } from 'vue'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiAccount, mdiEmail, mdiLock } from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'

const error = ref(false)
const submitSuccess = ref(false)

  interface registerData {
    name: string
    userName: string
    email: string
    confirmationEmail: string
    password: string
    confirmationPassword: string
    edit: boolean
    visualization: boolean
    alteration: boolean
    exclusion: boolean
    admin: boolean
  }

const userRegisterData = ref<registerData>({
  name: '',
  userName: '',
  email: '',
  confirmationEmail: '',
  password: '',
  confirmationPassword: '',
  edit: false,
  visualization: false,
  alteration: false,
  exclusion: false,
  admin: false
})

const submit = () => {
  if (userRegisterData.value.password === userRegisterData.value.confirmationPassword) {
    if (
      userRegisterData.value.name ||
      userRegisterData.value.userName ||
      userRegisterData.value.email ||
      userRegisterData.value.confirmationEmail ||
      userRegisterData.value.password ||
      userRegisterData.value.confirmationPassword
    ) {
      error.value = false
      console.log(userRegisterData.value)
      submitSuccess.value = true
    } else {
      error.value = true
    }
  } else {
    error.value = true
  }
}
</script>
