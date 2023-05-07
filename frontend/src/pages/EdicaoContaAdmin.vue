<template>
  <Form
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex w-[960px] justify-center border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl py-8 mt-10 shadow-md">
        <h1 class="text-blue-900 text-4xl font-bold">
          Editar conta
        </h1>
      </div>
      
    </div>
    <div class="w-full flex items-center justify-center bg-neutral-100 mb-10 ">
      <div
        v-if="!submitSuccess"
        class="flex flex-col items-center bg-white w-[960px] py-10 mx-6 rounded-bl-2xl rounded-br-2xl shadow-md"
      >
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />

        <div class="mb-8 mx-4 sm:mx-0">
          <p class="text-sky-600 text-base text-start font-normal mb-5">
            Se necessário, altere os campos abaixo:
          </p>
          <div class="flex flex-col gap-y-4 sm:gap-y-6">
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="name"
                label="Nome Completo"
                :required="true"
                :icon-path="mdiAccount"
              />
              <CustomInput
                name="username"
                label="Usuário"
                :required="true"
                :icon-path="mdiAccount"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="email"
                label="E-mail"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
              />
              <CustomInput
                name="confirmationEmail"
                label="Confirmar e-mail"
                type="email"
                error-message="Os e-mails informados são diferentes"
                :required="true"
                :icon-path="mdiEmail"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="password"
                label="Nova senha"
                type="password"
                :required="true"
                :icon-path="mdiLock"
              />
              <CustomInput
                name="confirmationPassword"
                label="Confirmar senha"
                type="password"
                error-message="As senhas informadas são diferentes"
                :required="true"
                :icon-path="mdiLock"
              />
            </div>
          </div>

          <div v-if="true" class="flex flex-col gap-y-2 mt-8">
            <CustomSelect
              name="accessLevel"
              label="Nível de Acesso"
              placeholder="Selecionar"
              :options="['Egresso', 'Secretário', 'Administrador']"
              error-message="Selecione o nível de acesso"
              :required="true"
            />
          </div>
          <div class="flex w-full justify-center gap-16 border-t-[1px] pt-8 mt-8 border-gray-200">
            <CustomButton type="reset" color="gray">
              Cancelar
            </CustomButton>
            <CustomButton type="submit" color="emerald">
              Salvar
            </CustomButton>
          </div>

        </div>
        
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
            Perfil {{ 123 }} <br>
            criado com sucesso!
          </h1>
        </div>
      </div>
    </div>
  </Form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiAccount, mdiEmail, mdiLock } from '@mdi/js'
import { Form } from 'vee-validate'
import { object, string, ref as refYup, number } from 'yup'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import { models } from 'src/@types'
interface ProfileRegisterModel extends models.ProfileRegisterModel {}

const error = ref(false)
const errorMessages = ref({
  errorRequest: 'Requisição não aceita.'
})
const errorText = ref('')
const submitSuccess = ref(false)

const setIdAccessLevel = (accessLevel: string) => {
  if (accessLevel === 'Administrador') {
    return 1
  } else if (accessLevel === 'Secretário') {
    return 2
  } else {
    return 3
  }
}

const schema = object().shape({
  name: string().required(),
  username: string().required(),
  email: string().email().required(),
  confirmationEmail: string().email().required().oneOf([refYup('email')]),
  password: string().required(),
  confirmationPassword: string().required().oneOf([refYup('password')]),
  accessLevel: string().required(),
  idAccessLevel: number()
})

const handleSubmit = async (profileData: ProfileRegisterModel) => {
  profileData.idAccessLevel = setIdAccessLevel(profileData.accessLevel)
  console.log(profileData)
  const response = await useCadastroPerfilStore().userProfileRegister(
    profileData.username,
    profileData.password,
    profileData.email,
    profileData.name,
    [{
      id: profileData.idAccessLevel
    }]
  )

  if (response === 201) {
    error.value = false
    submitSuccess.value = true
  } else {
    errorText.value = errorMessages.value.errorRequest
    error.value = true
  }
}

const onInvalid = (e: any) => {
  console.log(e)
}
</script>
