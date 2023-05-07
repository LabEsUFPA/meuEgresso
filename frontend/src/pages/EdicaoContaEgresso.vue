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
    <div class="w-full flex items-center justify-center bg-neutral-100 mb-10">
      <div
        v-if="!submitSuccess"
        class="flex flex-col items-center bg-white w-[960px] py-10 mx-6 rounded-bl-2xl rounded-br-2xl shadow-md"
      >
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />
        
        <div class="mb-8">
          <p class="text-sky-600 text-base text-center font-normal mb-5">
            Se necessário, altere os campos abaixo:
          </p>
          <div class="flex flex-col gap-y-5 mb-4">
            <CustomInput
              name="name"
              label="Nome Completo"
              :required="true"
              :icon-path="mdiAccount"
            />
            <CustomInput
              name="email"
              type="email"
              label="E-mail"
              :required="true"
              :icon-path="mdiEmail"
            />
            <CustomInput
              name="confirmationEmail"
              type="email"
              label="Confirmar e-mail"
              :required="true"
              :icon-path="mdiEmail"
            />
            <CustomInput
              name="password"
              type="password"
              label="Nova senha"
              :required="true"
              :icon-path="mdiLock"
            />
            <CustomInput
              name="confirmationPassword"
              type="password"
              label="Confirmar senha"
              error-message="As senhas informadas são diferentes"
              :required="true"
              :icon-path="mdiLock"
            />
          </div>
        </div>
        <div class="flex w-64 justify-between border-t-[1px] py-8 border-gray-200">
          <CustomButton type="reset" color="gray">
            Cancelar
          </CustomButton>
          <CustomButton type="submit" color="emerald">
            Salvar
          </CustomButton>
        </div>
        
        
      </div>

      <div
        v-if="submitSuccess"
        class="bg-white w-[960px] py-20 mx-6 rounded-2xl"
      >
        <div class="flex flex-col items-center text-center gap-y-28 mx-4">
          <h1 class="text-blue-900 text-4xl font-bold">
            Suas inFormações estão sendo analisadas
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
  </Form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiAccount, mdiSchool, mdiEmail, mdiLock } from '@mdi/js'
import { Form } from 'vee-validate'
import { object, string, ref as refYup } from 'yup'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import router from 'src/router'
import { models } from 'src/@types'
interface ProfileRegisterModel extends models.ProfileRegisterModel {}

const error = ref(false)
const errorMessages = ref({
  errorRequest: 'Requisição não aceita',
  userNotFound: 'Usuario não cadastrado pela faculdade'
})
const errorText = ref('')
const submitSuccess = ref(false)

const schema = object().shape({
  name: string().required(),
  registration: string().required().length(12),
  email: string().email().required(),
  confirmationEmail: string().email().required().oneOf([refYup('email')]),
  password: string().required(),
  confirmationPassword: string().required().oneOf([refYup('password')])
})

const handleSubmit = async (profileData: ProfileRegisterModel) => {
  const responseValidation = await useCadastroPerfilStore().egressValidation(
    profileData.name,
    profileData.registration,
    profileData.email
  )

  if (responseValidation === 200) {
    error.value = false
    const responseRegister = await useCadastroPerfilStore().userProfileRegister(
      profileData.email,
      profileData.password,
      profileData.email,
      profileData.name,
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

const onInvalid = (e: any) => {
  console.log(e)
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
