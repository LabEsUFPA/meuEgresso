<template>
  <CustomDialog
    v-model="showValidationSuccessModal"
    @close="$router.push('/entrar')"
  >
    <div class="flex flex-col h-full justify-center items-center text-center p-4 gap-y-6 sm:gap-y-10">
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
        text-class="text-white font-bold text-lg p-20 w-64 py-2 sm:py-6"
        link="/entrar"
      >
        Ir para o login
      </CustomButton>
    </div>
  </CustomDialog>
  <CustomDialog
    v-model="showValidationFailureModal"
    :hide-close-button="loading"
    @close="$router.push('/')"
  >
    <div class="flex flex-col min-h-[16rem] justify-center items-center p-4 gap-y-6 sm:gap-y-10 sm:h-full">
      <div
        v-if="loading"
        class="flex flex-col justify-center items-center"
      >
        <SvgIcon
          type="mdi"
          size="80"
          class="animate-spin text-gray-400"
          :path="mdiLoading"
        />
      </div>
      <div
        v-else
        class="flex flex-col justify-center items-center gap-y-10"
      >
        <div class="flex flex-col items-center">
          <SvgIcon
            type="mdi"
            size="50"
            :path="mdiAlertRemoveOutline"
            class="text-rose-500"
          />
          <p class="text-rose-500 text-2xl sm:text-3xl font-bold">
            Falha na validação
          </p>
        </div>
        <p
          v-if="!showEmailInput"
          class="font-medium text-lg text-center sm:text-justify"
        >
          Ocorreu algum erro durante a validação
        </p>
        <CustomButton
          v-if="!showEmailInput"
          type="button"
          tag="button"
          color="sky"
          text-class="text-white font-bold text-lg p-20 w-64 py-2 sm:py-6"
          @click="showEmailInput = true"
        >
          Reenviar token
        </CustomButton>
        <Form
          v-else
          class="flex flex-col items-center justify-center gap-y-4"
          @submit="handleSubmit"
          @invalid-submit="onInvalid"
          :validation-schema="schema"
        >
          <CustomInput
            name="email"
            label="E-mail"
          />
          <CustomButton
            type="submit"
          >
            Enviar
          </CustomButton>
        </Form>
      </div>
    </div>
  </CustomDialog>
  <CustomDialog
    v-model="showSentEmailModal"
    @close="$router.push('/')"
  >
    <div class="flex flex-col h-full justify-center items-center text-center p-4 gap-y-6 sm:gap-y-10">
      <div class="flex flex-col justify-center items-center gap-y-4">
        <SvgIcon
          type="mdi"
          size="50"
          :path="mdiCheckboxMarkedCircleOutline"
          class="text-emerald-500"
        />
        <p class="text-emerald-500 text-2xl sm:text-3xl font-bold">
          Email enviado
        </p>
      </div>
      <p class="font-medium text-lg">
        Um novo link de validação foi enviado para o e-mail: <br> <span class="font-bold">{{ userEmail }}</span>
      </p>
      <CustomButton
        type="button"
        tag="router"
        color="emerald"
        text-class="text-white font-bold text-lg p-20 sm:w-64 py-2 sm:py-6"
        link="/"
      >
        Fechar
      </CustomButton>
    </div>
  </CustomDialog>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheckboxMarkedCircleOutline, mdiAlertRemoveOutline, mdiLoading } from '@mdi/js'
import { useCadastroPerfilStore } from 'src/store/CadastroPerfilStore'
import { useLoginStore } from 'src/store/LoginStore'
import { Form } from 'vee-validate'
import { object, string } from 'yup'
import CustomDialog from 'src/components/CustomDialog.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomInput from 'src/components/CustomInput.vue'

const $router = useRouter()
const $store = useCadastroPerfilStore()
const $storeLogin = useLoginStore()
const tokenAuth = ref($router.currentRoute.value.query.tokenAuth)
const showValidationSuccessModal = ref(false)
const showValidationFailureModal = ref(false)
const showEmailInput = ref(false)
const showSentEmailModal = ref(false)
const loading = ref(false)
const userEmail = ref('')

onMounted(async () => {
  if (tokenAuth.value) {
    const response = await $store.validateEmail(`${tokenAuth.value}`)

    if (response.status === 204) {
      $storeLogin.isFirstAccess = 'yes'
      showValidationSuccessModal.value = true
    } else {
      showValidationFailureModal.value = true
    }
  } else {
    await $router.push('/')
  }
})

const schema = object().shape({
  email: string().required().matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.[a-zA-Z]{2,}))?$/, 'Email inválido')
})

const handleSubmit = async (value: any) => {
  loading.value = true
  await $store.requestNewValidation(value.email)
  userEmail.value = value.email
  showValidationFailureModal.value = false
  showSentEmailModal.value = true
  loading.value = false
}

const onInvalid = (e: any) => {
  console.log(e)
}
</script>
