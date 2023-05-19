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
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="name"
                label="Nome Completo"
                class-helper-text="text-gray-600"
                error-message="Informe nome e sobrenome"
                :required="true"
                :icon-path="mdiAccount"
              />
              <CustomInput
                name="username"
                label="Usuário"
                helper-text="Use no mínimo quatro caracteres sem espaços"
                class-helper-text="text-gray-600"
                error-message="Use apenas letras, números e os seguintes caracteres . _ -"
                :required="true"
                :icon-path="mdiAccount"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="registration"
                type="number"
                label="Matrícula"
                helper-text="Informe a sua matrícula da faculdade"
                class-helper-text="text-gray-600"
                :error-message="`Matrícula inválida, faltam ${missingDigits} dígitos`"
                :icon-path="mdiSchool"
                :max-length="12"
                :min-length="12"
                :min="0"
                @update:value="checkRegistrationLength"
              />
              <CustomInput
                name="email"
                type="email"
                label="Email"
                helper-text="Informe o mesmo e-mail que está cadastrado no SIGAA"
                error-message="Email inválido"
                class-helper-text="text-gray-600"
                :icon-path="mdiEmail"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="password"
                label="Senha"
                helper-text="Use oito ou mais caracteres com uma combinação de letras, números e símbolos"
                class-helper-text="text-gray-600"
                error-message="Senha inválida"
                :type="showPassword? 'text' : 'password'"
                :required="true"
                :icon-path="mdiLock"
              />
              <CustomInput
                name="confirmationPassword"
                label="Confirme Senha"
                :type="showPassword? 'text' : 'password'"
                :required="true"
                :icon-path="mdiLock"
                :custom-error-message="true"
              />
            </div>
            <CustomCheckbox
              label="Visualizar senhas"
              name="showPassword"
              @update:value="toggleShowPassword"
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
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
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
  name: string().required().trim().matches(/^[A-Za-z]+(?:\s[A-Za-z]+)+$/),
  username: string().required().trim().matches(/^[a-z0-9_.-]{4,}$/),
  registration: string().matches(/^(\d{12})?$/),
  email: string().optional().matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))?$/),
  password: string().required().matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/),
  confirmationPassword: string().required('Senha inválida').oneOf([refYup('password')], 'As senhas informadas são diferentes').matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida')
})

const missingDigits = ref(0)
const checkRegistrationLength = ($event: Event) => {
  missingDigits.value = 12 - String($event).length
}

const showPassword = ref(false)
const toggleShowPassword = () => {
  showPassword.value = !showPassword.value
}

const handleSubmit = async (submitData: any) => {
  const profileData: ProfileRegisterModel = submitData

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

input::-ms-reveal,
input::-ms-clear {
  display: none;
}
</style>
