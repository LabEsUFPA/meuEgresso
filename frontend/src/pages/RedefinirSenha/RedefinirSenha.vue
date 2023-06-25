<template>
  <Form
    v-if="tokenAuth"
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="flex flex-col">
      <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
        <div class="flex flex-col justify-center gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center">
          <div class="flex gap-6 text-cyan-800 items-center">
            <SvgIcon
              type="mdi"
              size="32"
              :path="mdiKey"
            />
            <h1 class="text-2xl sm:text-3xl font-bold">
              Redefinir senha
            </h1>
          </div>
        </div>
      </div>

      <div
        class="flex flex-col gap-4 sm:gap-8 mb-10"
      >
        <div class="flex justify-center">
          <div class="flex flex-col items-center justify-center w-[960px] bg-white min-h-[500px] rounded-bl-2xl rounded-br-2xl gap-y-6 mx-4 sm:mx-6">
            <p>
              Crie uma nova senha para entrar na sua conta
            </p>

            <div class="flex flex-col w-full items-center gap-y-8">
              <div class="flex flex-col gap-y-6">
                <div>
                  <p class="font-medium text-lg">
                    Senha
                  </p>
                  <CustomInput
                    name="password"
                    :type="showPassword? 'text' : 'password'"
                    placeholder="Digite uma nova senha"
                    :icon-path="mdiLock"
                    input-class="flex w-80 sm:w-96"
                    :max-length="80"
                  />
                </div>
                <div>
                  <p class="font-medium text-lg">
                    Confirmar Senha
                  </p>
                  <CustomInput
                    name="confirmationPassword"
                    :type="showPassword? 'text' : 'password'"
                    placeholder="Confirme a senha"
                    :icon-path="mdiLock"
                    input-class="flex w-80 sm:w-96"
                    :max-length="80"
                  />
                </div>
                <div>
                  <CustomCheckbox
                    label="Visualizar senhas"
                    name="showPassword"
                    @update:value="toggleShowPassword"
                  />
                </div>
              </div>
              <hr class="w-full">
              <div class="flex flex-col justify-center items-center gap-x-8 gap-y-2 rounded sm:flex-row sm:gap-y-0">
                <div class="flex items-center">
                  <SvgIcon
                    type="mdi"
                    size="32"
                    :path="mdiChevronLeft"
                    class="text-gray-400 hidden sm:block"
                  />
                  <p class="hover:underline">
                    <RouterLink
                      to="/entrar"
                      class="font-bold text-lg text-gray-400"
                    >
                      Voltar para login
                    </RouterLink>
                  </p>
                </div>
                <CustomButton
                  type="submit"
                  color="emerald"
                  text-class="text-white font-bold text-lg p-20 w-40 sm:w-56 py-2 sm:py-6"
                >
                  Redefinir senha
                </CustomButton>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="flex justify-center">
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />
      </div>
    </div>

    <CustomDialog
      v-model="showResetDoneModal"
      :hide-close-button="true"
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
            Senha redefinida
          </p>
        </div>
        <p class="font-medium text-lg">
          Sua senha foi alterada com sucesso.
        </p>
        <CustomButton
          type="button"
          tag="router"
          color="emerald"
          text-class="text-white font-bold text-lg p-20 w-64 py-2 sm:py-6"
          link="/entrar"
        >
          Continuar para login
        </CustomButton>
      </div>
    </CustomDialog>
  </Form>

  <Form
    v-else
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="flex flex-col">
      <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
        <div class="flex flex-col justify-center gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center">
          <div class="flex gap-6 text-cyan-800 items-center">
            <SvgIcon
              type="mdi"
              size="32"
              :path="mdiLock"
            />
            <h1 class="text-2xl sm:text-3xl font-bold">
              Esqueceu a senha?
            </h1>
          </div>
        </div>
      </div>
      <div
        class="flex flex-col gap-4 sm:gap-8 mb-10"
      >
        <div class="flex justify-center w-full">
          <div class="flex flex-col items-center justify-center w-[960px] bg-white min-h-[325px] rounded-bl-2xl rounded-br-2xl mx-4 sm:mx-6">
            <div
              v-if="loading"
              class="w-full h-full flex items-center justify-center"
            >
              <SvgIcon
                type="mdi"
                size="80"
                class="animate-spin text-gray-400"
                :path="mdiLoading"
              />
            </div>
            <div
              class="flex flex-col w-full gap-y-6"
              v-else
            >
              <p class="text-center">
                Enviaremos para o seu e-mail instruções para criar uma nova senha
              </p>
              <div class="flex flex-col w-full items-center gap-y-8">
                <div>
                  <p class="font-medium text-lg">
                    Email
                  </p>
                  <CustomInput
                    name="email"
                    type="text"
                    placeholder="Informe seu e-mail"
                    :icon-path="mdiEmail"
                    input-class="flex w-80 sm:w-96"
                    :max-length="50"
                  />
                </div>
                <hr class="w-full">
                <div class="flex flex-col justify-center items-center gap-x-8 gap-y-2 rounded sm:flex-row sm:gap-y-0">
                  <div class="flex items-center">
                    <SvgIcon
                      type="mdi"
                      size="32"
                      :path="mdiChevronLeft"
                      class="text-gray-400 hidden sm:block"
                    />
                    <p class="hover:underline">
                      <RouterLink
                        to="/entrar"
                        class="font-bold text-lg text-gray-400"
                      >
                        Voltar para login
                      </RouterLink>
                    </p>
                  </div>
                  <CustomButton
                    type="submit"
                    color="emerald"
                    text-class="text-white font-bold text-lg p-20 w-40 sm:w-56 py-2 sm:py-6"
                  >
                    Enviar e-mail
                  </CustomButton>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <CustomDialog
      v-model="showSentEmailModal"
      :hide-close-button="true"
    >
      <div class="flex flex-col h-full justify-center items-center text-center gap-y-2 sm:gap-y-6">
        <div class="flex flex-col justify-center items-center gap-y-0 sm:gap-y-4">
          <SvgIcon
            type="mdi"
            size="50"
            :path="mdiEmail"
            class="text-blue-500"
          />
          <p class="text-blue-500 text-2xl sm:text-3xl font-bold">
            Verifique seu e-mail
          </p>
        </div>
        <div class="flex flex-col">
          <p class="font-medium text-md max-w-lg px-8 sm:text-lg sm:px-0">
            Se <span class="font-bold">{{ userEmail }}</span> for correspondente a uma conta válida, será enviado um e-mail para sua caixa de entrada com um link para alterar sua senha. Se não encontrar na sua caixa de entrada, procure também na sua caixa de spam ou lixo eletrônico.
          </p>
        </div>
        <CustomButton
          tag="router"
          color="emerald"
          text-class="text-white font-bold text-lg p-20 w-28 py-2 sm:py-6"
          link="/"
        >
          OK
        </CustomButton>
      </div>
    </CustomDialog>
  </Form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiLock, mdiEmail, mdiChevronLeft, mdiCheckboxMarkedCircleOutline, mdiKey, mdiLoading } from '@mdi/js'
import { useRouter } from 'vue-router'
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import { Form } from 'vee-validate'
import { object, string, ref as refYup } from 'yup'
import Api from 'src/services/api'

const $route = useRouter()
const tokenAuth = ref($route.currentRoute.value.query.tokenAuth)
const showSentEmailModal = ref(false)
const showResetDoneModal = ref(false)
const loading = ref(false)
const userEmail = ref('')
const error = ref(false)
const errorText = ref('Ocorreu algum erro :(')
const showPassword = ref(false)

const schemeForgotPassword = {
  email: string().required('Informe o seu e-mail').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.[a-zA-Z]{2,}))?$/, 'Email inválido')
}

const passwordResetScheme = {
  password: string().required('Informe uma senha').matches(/^(?=.*[a-zA-Z])(?=.*\d).{8,}$/, 'Senha inválida'),
  confirmationPassword: string().required('Confirme a sua senha').oneOf([refYup('password')], 'As senhas informadas são diferentes').matches(/^(?=.*[a-zA-Z])(?=.*\d).{8,}$/, 'Senha inválida')
}

const schema = object().shape(tokenAuth.value ? passwordResetScheme : schemeForgotPassword)

const toggleShowPassword = () => {
  showPassword.value = !showPassword.value
}

const handleSubmit = async (data: any) => {
  if (tokenAuth.value) {
    const response = await Api.request({
      method: 'post',
      route: `/auth/recoveryPassword/${tokenAuth.value}`,
      body: {
        novaSenha: data.password
      }
    })

    if (response?.status === 204) {
      showResetDoneModal.value = true
    } else if (response?.status === 401) {
      errorText.value = response.data?.technicalMessage
      error.value = true
    }
  } else {
    loading.value = true
    const response = await Api.request({
      method: 'post',
      route: '/auth/recoveryPassword',
      body: {
        email: data.email,
        redirect: 'https://egressos.computacao.ufpa.br/redefinir-senha'
      }
    })

    if (response?.status === 204) {
      userEmail.value = data.email
      loading.value = false
      showSentEmailModal.value = true
    }
  }
}

const onInvalid = (e: any) => {
  console.log(e)
}
</script>

<style>
  input::-ms-reveal,
  input::-ms-clear {
    display: none;
  }
</style>
