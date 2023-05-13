<template>
  <div>
    <Form
      ref="form"
      @submit="handleSubmit"
      @invalid-submit="onInvalid"
      :validation-schema="schema"
    >
      <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
        <div class="flex w-[960px] justify-center border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl py-8 mt-10 mx-6 shadow-md">
          <h1 class="text-blue-900 text-3xl font-bold">
            Editar conta egresso
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
            <RouterLink to="/">
              <CustomButton type="button" color="gray">
                Cancelar
              </CustomButton>
            </RouterLink>
            <CustomButton type="submit" color="emerald">
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

import { ref, computed, watch, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import router from 'src/router'
import { Form } from 'vee-validate'
import { models } from 'src/@types'
import { object, string, ref as refYup, number } from 'yup'
import { mdiAccount, mdiEmail, mdiLock, mdiCheckCircle } from '@mdi/js'
import { useEditaContaUsuarioStore } from 'src/store/EditaContaUsuarioStore.js'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
interface ProfileRegisterModel extends models.ProfileRegisterModel {}


const form = ref<typeof Form | null>(null)

const id = ref(0)
const username = ref('')
const email = ref('')
const nomeCompleto = ref('')
const senha = ref('')
const grupos = ref([{id: number, nomeGrupo: string}])

const error = ref(false)
const errorMessages = ref({
  errorRequest: 'Requisição não aceita',
  userNotFound: 'Usuario não cadastrado pela faculdade'
})
const errorText = ref('')
const submitSuccess = ref(false)
const schema = object().shape({
  name: string().required(),
  username: string().required(),
  email: string().email().required(),
  confirmationEmail: string().email().required().oneOf([refYup('email')]),
  password: string().required(),
  confirmationPassword: string().required().oneOf([refYup('password')]),
})

//Chamando getUsuario
const $store = useEditaContaUsuarioStore()
$store.fetchUsuario().then(usuario =>{
  console.log("THEN:", usuario)
  id.value = usuario?.id
  nomeCompleto.value = usuario?.nome
  username.value = usuario?.username
  email.value = usuario?.email
  grupos.value = usuario?.grupos
})



/*
const handleSubmit = async (profileData: ProfileRegisterModel) => {
  const responseValidation = await useEditaContaUsuarioStore().updateContaUsuario(
    id.value,
    username.value,
    email.value,
    nomeCompleto.value,
    grupos.value,
  )

  if (responseValidation.status === 200) {
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

    if (responseRegister.status === 201) {
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
*/
const onInvalid = (e: any) => {
  console.log(e)
} 


onMounted(() => {
  console.log("onMounted front iniciado...")
  watch(nomeCompleto, () => {
    console.log("watch front nomeCompleto:", nomeCompleto.value)
    form.value?.setFieldValue('name', nomeCompleto.value)
  })
  watch(email, () => {
    console.log("watch front email:", email.value)
    form.value?.setFieldValue('email', email.value)
  })
})

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
