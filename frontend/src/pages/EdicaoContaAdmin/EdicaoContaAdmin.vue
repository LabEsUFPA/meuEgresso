<template>
  <Form
    ref="form"
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex w-[960px] justify-center border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl py-8 mt-10 mx-6 shadow-md">
        <h1 class="text-blue-900 text-3xl font-bold">
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
            Se necessário, altere os campos abaixo. Para a senha, repita a senha atual ou insira uma nova:
          </p>
          <div class="flex flex-col gap-y-4 sm:gap-y-6">
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="name"
                label="Nome Completo"
                :required="true"
                :icon-path="mdiAccount"
                :max-length="100"
              />
              <CustomInput
                name="username"
                label="Usuário"
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
                label="Confirmar e-mail"
                type="email"
                error-message="Os e-mails informados são diferentes"
                :required="true"
                :icon-path="mdiEmail"
                :max-length="50"
              />
            </div>
            <div class="flex flex-col gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-row">
              <CustomInput
                name="password"
                label="Senha atual ou uma nova"
                type="password"
                :required="true"
                :icon-path="mdiLock"
                :max-length="80"
              />
              <CustomInput
                name="confirmationPassword"
                label="Confirmar senha"
                type="password"
                error-message="As senhas informadas são diferentes"
                :required="true"
                :icon-path="mdiLock"
                :max-length="80"
              />
            </div>
          </div>

          <div class="flex w-full justify-center gap-16 border-t-[1px] pt-8 mt-8 border-gray-200">
            <RouterLink to="/">
              <CustomButton
                type="button"
                color="gray"
              >
                Cancelar
              </CustomButton>
            </RouterLink>
            <CustomButton
              type="submit"
              color="emerald"
            >
              Salvar
            </CustomButton>
          </div>
        </div>
      </div>
    </div>
  </Form>

  <CustomDialog v-model="submitSuccess">
    <div class="h-full flex justify-center items-center">
      <div class="w-1/2">
        <div class="text-green-500 text-center mb-3">
          <SvgIcon
            type="mdi"
            size="100"
            class="inline"
            :path="mdiCheckCircle"
          />
        </div>
        <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
          Dados atualizados com sucesso!
        </h1>
      </div>
    </div>
  </CustomDialog>
</template>

<script setup lang="ts">

import { ref, watch, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import { Form } from 'vee-validate'
import { object, string, ref as refYup } from 'yup'
import { mdiAccount, mdiEmail, mdiLock, mdiCheckCircle } from '@mdi/js'
import { useEditaContaUsuarioStore } from 'src/store/EditaContaUsuarioStore.js'

const form = ref<typeof Form | null>(null)
const username = ref('')
const email = ref('')
const nomeCompleto = ref('')

let dataUserUpdate = {
  id: 0,
  username: '',
  email: '',
  nome: '',
  password: ''
}

const error = ref(false)

const errorText = ref('')
const submitSuccess = ref(false)

const schema = object().shape({
  name: string().required('Informe nome e sobrenome').trim().matches(/^[A-Za-zÀ-ÿ]+(?:\s[A-Za-zÀ-ÿ]+)+$/, 'Informe nome e sobrenome'),
  email: string().required().matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))?$/, 'Email inválido'),
  username: string().required('Informe um nome de usuário').trim().matches(/^[a-z0-9_.-]{4,}$/, 'Use apenas letras, números e os seguintes caracteres . _ -'),
  confirmationEmail: string().email().required('Confirme seu email').oneOf([refYup('email')], 'Email diferente').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))?$/, 'Email inválido'),
  password: string().required().matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida'),
  confirmationPassword: string().required().oneOf([refYup('password')], 'As senhas informadas são diferentes').matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida')
})

//  Chamando getUsuario
const $store = useEditaContaUsuarioStore()
$store.fetchUsuario().then(usuario => {
  nomeCompleto.value = usuario?.nome
  username.value = usuario?.username
  email.value = usuario?.email
})

// Update Usuario
const handleSubmit = async (submitData: any) => {
  const usuario = await $store.fetchUsuario()
  dataUserUpdate = {
    id: usuario?.id,
    username: usuario?.username,
    email: submitData?.email,
    nome: submitData?.name,
    password: submitData?.password
  }

  const responseValidation = await useEditaContaUsuarioStore().updateContaUsuario(
    dataUserUpdate.id,
    dataUserUpdate.username,
    dataUserUpdate.email,
    dataUserUpdate.nome,
    dataUserUpdate.password
  )

  if (responseValidation.status === 201) {
    error.value = false
    submitSuccess.value = true
  }
}
const onInvalid = (e: any) => {
  console.log(e)
}

onMounted(() => {
  watch(nomeCompleto, () => {
    form.value?.setFieldValue('name', nomeCompleto.value)
  })
  watch(username, () => {
    form.value?.setFieldValue('username', username.value)
  })
  watch(email, () => {
    form.value?.setFieldValue('email', email.value)
  })
})

onMounted(() => {
  window.scrollTo(0, 0)
})

</script>
