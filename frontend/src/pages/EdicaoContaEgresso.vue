<template>
  <div>
    <Form
      ref="form"
      @submit="handleSubmit"
      @invalid-submit="onInvalid"
      :validation-schema="schema"
    >
      <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
        <div
          class="flex w-[960px] justify-center border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl py-8 mt-10 mx-6 shadow-md"
        >
          <h1 class="text-blue-900 text-3xl font-bold">
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
              Se necessário, altere os campos abaixo. Para a senha, repita a senha atual ou insira uma nova:
            </p>
            <div class="flex flex-col gap-y-5 mb-4 items-center">
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
                error-message="Os e-mails informados são diferentes"
                :required="true"
                :icon-path="mdiEmail"
              />
              <CustomInput
                name="password"
                type="password"
                label="Senha atual ou uma nova"
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
  </div>
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
  name: string().required('Informe nome e sobrenome').trim().matches(/^[A-Za-z]+(?:\s[A-Za-z]+)+$/, 'Informe nome e sobrenome'),
  email: string().required().matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))?$/, 'Email inválido'),
  confirmationEmail: string().email().required('Confirme seu email').oneOf([refYup('email')], 'Email diferente').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))?$/, 'Email inválido'),
  password: string().required().matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida'),
  confirmationPassword: string().required().oneOf([refYup('password')], 'As senhas informadas são diferentes').matches(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, 'Senha inválida')
})

// Chamando getUsuario
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
  window.scrollTo(0, 0)

  watch(nomeCompleto, () => {
    console.log('watch front nomeCompleto:', nomeCompleto.value)
    form.value?.setFieldValue('name', nomeCompleto.value)
  })
  watch(email, () => {
    form.value?.setFieldValue('email', email.value)
  })
})

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
