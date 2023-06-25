<template>
  <Form
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="w-full flex items-center justify-center bg-neutral-100 my-4 sm:my-12 ">
      <div
        class="flex flex-col items-center justify-center bg-white w-[960px] py-10 mx-6 rounded-2xl shadow-md"
      >
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />
        <h1 class="text-blue-900 text-4xl font-bold mb-12">
          Acessar Sistema
        </h1>
        <p class="text-blue-400 text-base text-center font-bold mb-6">
          Primeiro, você deve realizar login no sistema.
        </p>
        <div class="flex flex-col gap-y-5 mb-4">
          <CustomInput
            name="username"
            label="Usuário"
            :icon-path="mdiAccount"
            without-validation
            required
          />
          <CustomInput
            name="password"
            label="Senha"
            :type="showPassword? 'text' : 'password'"
            :icon-path="mdiLock"
            without-validation
            required
          />
          <CustomCheckbox
            label="Visualizar senha"
            name="showPassword"
            @update:value="toggleShowPassword"
          />
        </div>
        <p class="mb-14">
          Esqueceu a senha?
          <RouterLink
            to="/redefinir-senha"
            class="text-sky-600"
          >
            Recupere aqui
          </RouterLink>
        </p>
        <CustomButton
          label="Entrar"
          type="submit"
        >
          Entrar
        </CustomButton>
        <p class="mt-9">
          Não possui login?
          <RouterLink
            to="/cadastro-perfil"
            class="text-sky-600"
          >
            Cadastre-se
          </RouterLink>
        </p>
      </div>
    </div>
  </Form>
  <CustomDialog
    v-model="showValidationModal"
    @close="$router.push('/cadastro')"
  >
    <div class="flex flex-col h-full justify-center items-center text-center gap-y-6 sm:gap-y-10">
      <div class="flex flex-col justify-center items-center gap-y-4">
        <SvgIcon
          type="mdi"
          size="50"
          :path="mdiCheckboxMarkedCircleOutline"
          class="text-emerald-500"
        />
        <p class="text-emerald-500 text-2xl sm:text-3xl font-bold">
          Validação Realizada
        </p>
      </div>
      <p class="font-medium text-lg">
        O seu e-mail foi validado com sucesso!
      </p>
      <CustomButton
        type="button"
        tag="router"
        color="emerald"
        text-class="text-white font-bold text-lg p-20 w-64 py-6"
        link="/cadastro"
      >
        Prosseguir
      </CustomButton>
    </div>
  </CustomDialog>
</template>

<script setup lang="ts">
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import { ref, onMounted } from 'vue'
import { Form } from 'vee-validate'
import { object, string } from 'yup'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAccount, mdiLock, mdiCheckboxMarkedCircleOutline } from '@mdi/js'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import { useLoginStore } from 'src/store/LoginStore'
import { models } from 'src/@types'
import { useRouter } from 'vue-router'
interface LoginModel extends models.LoginModel {}

const error = ref(false)
const $store = useLoginStore()
const errorText = ref('Nome de usuário ou senha incorretos.')
const $router = useRouter()
const tokenAuth = ref($router.currentRoute.value.query.tokenAuth)
const showValidationModal = ref(false)

const schema = object().shape({
  username: string().required('Informe o seu usuário'),
  password: string().required('Informe a sua senha')
})

const showPassword = ref(false)
const toggleShowPassword = () => {
  showPassword.value = !showPassword.value
}

const handleSubmit = async (submitData: any) => {
  const loginData: LoginModel = submitData

  if (tokenAuth.value) {
    const response = await $store.userLogin(loginData.username, loginData.password, `${tokenAuth.value}`)

    if (response.status === 200) {
      error.value = false
      showValidationModal.value = true
    } else if (response.status !== 200) {
      if (response.data?.technicalMessage) {
        errorText.value = response.data.technicalMessage
      } else {
        errorText.value = 'Requisição não aceita'
      }
      error.value = true
    }
  } else {
    const response = await $store.userLogin(loginData.username, loginData.password)

    if (response.status === 200) {
      error.value = false
      $router.push('/')
    } else if (response.status !== 200) {
      if (response.data?.technicalMessage) {
        errorText.value = response.data?.technicalMessage
      } else {
        errorText.value = 'Requisição não aceita'
      }
      error.value = true
    }
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
