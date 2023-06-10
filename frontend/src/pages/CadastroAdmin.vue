<template>
  <Form
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
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
                name="name"
                label="Nome Completo"
                :required="true"
                :icon-path="mdiAccount"
              />
              <CustomInput
                name="username"
                label="Usuário"
                helper-text="Use no mínimo quatro caracteres sem espaços"
                class-helper-text="text-gray-600"
                :required="true"
                :icon-path="mdiAccount"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="email"
                label="Email"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
              />
              <CustomInput
                name="confirmationEmail"
                label="Confirmar email"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="password"
                label="Senha"
                :type="showPassword? 'text' : 'password'"
                helper-text="Use oito ou mais caracteres com uma combinação de letras, números e símbolos"
                class-helper-text="text-gray-600"
                :required="true"
                :icon-path="mdiLock"
              />
              <CustomInput
                name="confirmationPassword"
                label="Confirmar senha"
                :type="showPassword? 'text' : 'password'"
                :required="true"
                :icon-path="mdiLock"
              />
            </div>
            <CustomCheckbox
              label="Visualizar senhas"
              name="showPassword"
              @update:value="toggleShowPassword"
            />
          </div>
          <p class="text-blue-400 text-base font-bold mb-5 mt-7">
            Selecione o nível de acesso:
          </p>
          <div class="flex flex-col gap-y-2">
            <CustomSelect
              label="Nível de Acesso"
              name="accessLevel"
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

      <CustomDialog v-model="submitSuccess">
        <div
          class="flex h-full bg-whit mx-6 rounded-2xl"
        >
          <div class="flex flex-col w-full items-center justify-center text-center gap-y-4 sm:gap-y-6">
            <img
              class="w-16 sm:w-24"
              src="../assets/check.svg"
              alt="Loading"
            >
            <h1 class="text-blue-900 font-bold text-2xl sm:text-4xl">
              Perfil {{ username }} <br>
              criado com sucesso!
            </h1>
          </div>
        </div>
      </CustomDialog>
    </div>
  </Form>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiAccount, mdiEmail, mdiLock } from '@mdi/js'
import { Form } from 'vee-validate'
import { object, string, ref as refYup, number } from 'yup'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import CustomDialog from 'src/components/CustomDialog.vue'
import { models } from 'src/@types'
interface ProfileRegisterModel extends models.ProfileRegisterModel {}

const error = ref(false)
const errorMessages = ref({
  errorRequest: 'Requisição não aceita.'
})
const errorText = ref('')
const submitSuccess = ref(false)
const username = ref('')
const showPassword = ref(false)
const storeCadastro = useCadastroPerfilStore()

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
  name: string().required('Informe nome e sobrenome').trim().matches(/^[A-Za-z]+(?:\s[A-Za-z]+)+$/, 'Informe nome e sobrenome'),
  username: string().required('Informe um nome de usuário').trim().matches(/^[a-z0-9_.-]{4,}$/, 'Use apenas letras, números e os seguintes caracteres . _ -'),
  email: string().required('Informe um email').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))/, 'Email inválido'),
  confirmationEmail: string().email().required('Confirme o email').oneOf([refYup('email')], 'Os e-mails informados são diferentes'),
  password: string().required('Informe uma senha').matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida'),
  confirmationPassword: string().required('Confirme a senha').oneOf([refYup('password')], 'As senhas informadas são diferentes').matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida'),
  accessLevel: string().required('Selecione o nível de acesso'),
  idAccessLevel: number()
})

const toggleShowPassword = () => {
  showPassword.value = !showPassword.value
}

const handleSubmit = async (submitData: any) => {
  const profileData: ProfileRegisterModel = submitData

  profileData.idAccessLevel = setIdAccessLevel(profileData.accessLevel ? profileData.accessLevel : 'Egresso')
  const response = await storeCadastro.userProfileRegister(
    profileData.username,
    profileData.password,
    profileData.email,
    profileData.name,
    [{
      id: submitData.idAccessLevel
    }]
  )

  if (response.status === 201) {
    username.value = submitData.username
    error.value = false
    submitSuccess.value = true
  } else {
    errorText.value = response.data?.message ? response.data.message : errorMessages.value.errorRequest
    error.value = true
  }
}

const onInvalid = (e: any) => {
  console.log(e)
}

onMounted(() => {
  window.scrollTo(0, 0)
})

</script>

<style>
input::-ms-reveal,
input::-ms-clear {
  display: none;
}
</style>
