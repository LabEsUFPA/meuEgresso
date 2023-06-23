<template>
  <OLoading
    :full-page="true"
    v-model:active="loading"
    full-page-class="bg-white/[.25] backdrop-blur-[1px] z-50"
  >
    <SvgIcon
      type="mdi"
      size="80"
      class="text-blue-400 animate-spin"
      :path="mdiLoading"
    />
  </OLoading>
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
        <h1 class="text-blue-900 text-4xl font-bold mb-6">
          Criar Perfil
        </h1>
        <div class="mb-8 mx-4 sm:mx-0">
          <p class="text-blue-400 text-center font-bold mb-5 sm:text-base">
            Preencha os campos abaixo:
          </p>
          <div class="flex flex-col">
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="nome"
                label="Nome Completo"
                :required="true"
                :icon-path="mdiAccount"
                :max-length="50"
              />
              <CustomInput
                name="username"
                label="Usuário"
                helper-text="Use no mínimo quatro caracteres sem espaços"
                class-helper-text="text-gray-600"
                :required="true"
                :icon-path="mdiAccount"
                :max-length="16"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="email"
                label="E-mail"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
                :max-length="64"
              />
              <CustomInput
                name="confirmationEmail"
                label="Confirmar email"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
                :max-length="64"
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
                :max-length="20"
              />
              <CustomInput
                name="confirmationPassword"
                label="Confirmar senha"
                :type="showPassword? 'text' : 'password'"
                :required="true"
                :icon-path="mdiLock"
                :max-length="20"
              />
            </div>
            <CustomCheckbox
              class="mt-2"
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
              :options="accessLevel === 'ADMIN'? ['Egresso', 'Secretário', 'Administrador'] : ['Egresso', 'Secretário']"
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
              src="src/assets/check.svg"
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
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAccount, mdiEmail, mdiLock, mdiLoading } from '@mdi/js'
import { Form } from 'vee-validate'
import { object, string, ref as refYup } from 'yup'
import { OLoading } from '@oruga-ui/oruga-next'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import { useLoginStore } from 'src/store/LoginStore'
import CustomDialog from 'src/components/CustomDialog.vue'
import { models } from 'src/@types'
interface ProfileRegisterModel extends models.ProfileRegisterModel {}

const error = ref(false)
const errorText = ref('')
const submitSuccess = ref(false)
const username = ref('')
const showPassword = ref(false)
const $store = useCadastroPerfilStore()
const accessLevel = ref(useLoginStore().userData?.scope)
const loading = ref(false)

const schema = object().shape({
  nome: string().required('Informe nome e sobrenome').trim().matches(/^[A-Za-zÀ-ÿ]+(?:\s[A-Za-zÀ-ÿ]+)+$/, 'Informe nome e sobrenome'),
  username: string().required('Informe um nome de usuário').trim().matches(/^[A-Za-z0-9_.-]{4,}$/, 'Use apenas letras, números e os seguintes caracteres . _ -'),
  email: string().required('Informe um email').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))/, 'Email inválido'),
  confirmationEmail: string().email().required('Confirme o email').oneOf([refYup('email')], 'Os e-mails informados são diferentes'),
  password: string().required('Informe uma senha').matches(/^(?=.*[a-zA-Z])(?=.*\d).{8,}$/, 'Senha inválida'),
  confirmationPassword: string().required('Confirme a senha').oneOf([refYup('password')], 'As senhas informadas são diferentes').matches(/^(?=.*[a-zA-Z])(?=.*\d).{8,}$/, 'Senha inválida'),
  accessLevel: string().required('Selecione o nível de acesso')
})

const toggleShowPassword = () => {
  showPassword.value = !showPassword.value
}

const mapAccessLevel = (accessLevel: string | undefined) => {
  if (accessLevel === 'Administrador') return 'ADMIN'
  else if (accessLevel === 'Secretário') return 'SECRETARIO'
  return 'EGRESSO'
}

const handleSubmit = async (submitData: any) => {
  const profileData: ProfileRegisterModel = submitData

  loading.value = true
  const response = await $store.registrationByAdmin(
    profileData.username,
    profileData.password,
    profileData.email,
    profileData.nome,
    mapAccessLevel(profileData.accessLevel)
  )

  if (response.status === 201) {
    username.value = submitData.username
    error.value = false
    submitSuccess.value = true
  } else if (response.status !== 201) {
    errorText.value = response.data.technicalMessage ? response.data.technicalMessage : 'Requisição não aceita.'
    error.value = true
  }
  loading.value = false
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
