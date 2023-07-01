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
    ref="form"
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
                :max-length="100"
              />
              <CustomInput
                name="username"
                label="Usuário"
                helper-text="Use no mínimo quatro caracteres sem espaços"
                class-helper-text="text-gray-600"
                :required="true"
                :icon-path="mdiAccount"
                :max-length="50"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="email"
                label="E-mail"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
                :max-length="50"
              />
              <CustomInput
                name="confirmationEmail"
                label="Confirmar email"
                type="email"
                :required="true"
                :icon-path="mdiEmail"
                :max-length="50"
              />
            </div>
          </div>
          <p class="text-blue-400 text-base font-bold mb-5 mt-7">
            Selecione o nível de acesso:
          </p>
          <div class="flex flex-col gap-y-2">
            <CustomSelect
              ref="selectAccessLevel"
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
              alt="Ícone com sinal de positivo"
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
import { mdiAccount, mdiEmail, mdiLoading } from '@mdi/js'
import { Form } from 'vee-validate'
import { object, string, ref as refYup } from 'yup'
import { OLoading } from '@oruga-ui/oruga-next'
import CustomButton from 'src/components/CustomButton.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import { useLoginStore } from 'src/store/LoginStore'
import CustomDialog from 'src/components/CustomDialog.vue'
import { models } from 'src/@types'
interface AdminProfileRegisterModel extends models.AdminProfileRegisterModel {}

const form = ref<typeof Form | null>(null)
const error = ref(false)
const errorText = ref('')
const submitSuccess = ref(false)
const username = ref('')
const $store = useCadastroPerfilStore()
const accessLevel = ref(useLoginStore().userData?.scope)
const loading = ref(false)
const selectAccessLevel = ref()

const schema = object().shape({
  nome: string().required('Informe nome e sobrenome').trim().matches(/^[A-Za-zÀ-ÿ]+(?:\s[A-Za-zÀ-ÿ]+)+$/, 'Informe nome e sobrenome'),
  username: string().required('Informe um nome de usuário').min(4, 'Nome de usuário pequeno').max(15, 'Nome de usuário muito grande').trim().matches(/^[A-Za-z0-9_.-]+$/, 'Use apenas letras, números e os seguintes caracteres . _ -'),
  email: string().optional().matches(/^([A-Za-z\d]+([._][A-Za-z\d]+)*@[A-Za-z\d]+(.[A-Za-z\d]+)*(.[A-z]{2,}))?$/, 'Email inválido'),
  confirmationEmail: string().email().required('Confirme o email').oneOf([refYup('email')], 'Os e-mails informados são diferentes'),
  accessLevel: string().required('Informe o nível de acesso')
})

const mapAccessLevel = (accessLevel: string | undefined) => {
  if (accessLevel === 'Administrador') return 'ADMIN'
  else if (accessLevel === 'Secretário') return 'SECRETARIO'
  return 'EGRESSO'
}

const handleSubmit = async (submitData: any) => {
  const profileData: AdminProfileRegisterModel = submitData

  loading.value = true
  const response = await $store.registrationByAdmin(
    profileData.username,
    profileData.email,
    profileData.nome,
    [mapAccessLevel(profileData.accessLevel)]
  )

  if (response.status === 201) {
    username.value = submitData.username
    error.value = false
    submitSuccess.value = true
  } else if (response.status !== 201) {
    errorText.value = response.data?.message ? response.data.message : 'Requisição não aceita.'
    error.value = true
  }
  loading.value = false
}

const onInvalid = (e: any) => {
  console.log(e)
}

onMounted(() => {
  window.scrollTo(0, 0)
  selectAccessLevel.value.setInitialValues('Egresso')
})

</script>

<style>
input::-ms-reveal,
input::-ms-clear {
  display: none;
}
</style>
