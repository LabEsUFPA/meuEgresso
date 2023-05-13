<template>
  <Form
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="w-full flex items-center justify-center bg-neutral-100 my-8">
      <div
        v-if="!submitSuccess"
        class="flex flex-col items-center bg-white w-[960px] py-6 mx-6 rounded-2xl shadow-md"
      >
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />
        <h1 class="text-blue-900 text-4xl font-bold mb-6">
          Cadastro
        </h1>
        <div class="mb-8">
          <p class="text-blue-400 text-base text-center font-bold mb-5">
            Preencha os campos abaixo
          </p>
          <div class="flex flex-col gap-y-5 mb-4">
            <CustomInput
              name="name"
              label="Nome Completo"
              :required="true"
              :icon-path="mdiAccount"
            />
            <CustomInput
              name="username"
              label="Usuário"
              helper-text="Letras minúsculas e números com no mínimo seis caracteres"
              class-helper-text="text-gray-600"
              :required="true"
              :icon-path="mdiAccount"
            />
            <CustomInput
              name="registration"
              type="number"
              label="Matrícula"
              :icon-path="mdiSchool"
              :max-length="12"
              :min-length="12"
            />
            <CustomInput
              name="email"
              type="email"
              label="Email"
              helper-text="Se possível informe o mesmo e-mail que está cadastrado no SIGAA"
              class-helper-text="text-gray-600"
              :required="true"
              :icon-path="mdiEmail"
            />
            <CustomInput
              name="password"
              type="password"
              label="Senha"
              helper-text="Letras e números com no mínimo oito caracteres"
              class-helper-text="text-gray-600"
              error-message="Senha inválida"
              :required="true"
              :icon-path="mdiLock"
            />
            <CustomInput
              name="confirmationPassword"
              type="password"
              label="Confirme Senha"
              error-message="As senhas informadas são diferentes"
              :required="true"
              :icon-path="mdiLock"
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
import { useLoginStore } from 'src/store/LoginStore'
interface ProfileRegisterModel extends models.ProfileRegisterModel { }

const error = ref(false)
const errorMessages = ref({
  errorRequest: 'Requisição não aceita',
  userNotFound: 'Usuario não cadastrado pela faculdade'
})
const errorText = ref('')
const submitSuccess = ref(false)
const storeLogin = useLoginStore()

const schema = object().shape({
  name: string().required().matches(/^[A-Za-z]+(?:\s[A-Za-z]+)+$/),
  username: string().required().matches(/^[a-z0-9_.-]{6,}$/),
  registration: string().optional().matches(/^(\d{1,12})?$/),
  email: string().optional().matches(/^[a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}$/),
  password: string().required().matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/),
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
      profileData.username,
      profileData.password,
      profileData.email,
      profileData.name,
      [{
        id: 3
      }]
    )

    if (responseRegister.status === 201) {
      submitSuccess.value = true
      await storeLogin.userLogin(profileData.username, profileData.password)
      await storeLogin.saveUser()
      router.push({ path: '/cadastro' })
    } else if (responseRegister.status === 400) {
      errorText.value = responseRegister.data?.message
      error.value = true
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
  margin: 0;
  /* <-- Apparently some margin are still there even though it's hidden */
}

input[type="number"] {
  -moz-appearance: textfield;
  /* Firefox */
}
</style>
