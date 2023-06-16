<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <RouterLink
            to="/"
            class="flex items-center hover:bg-sky-600/20 rounded-md"
          >
            <div class="flex-1" />

            <SvgIcon
              type="mdi"
              size="32"
              class="inline"
              :path="mdiChevronLeft"
            />
          </RouterLink>

          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiEmail"
            class="ml-2"
          />

          <h1 class="text-[32px] sm:text-3xl font-bold ml-2 ">
            E-mail de atualização
          </h1>
        </div>
      </div>
    </div>
    <div class="flex flex-col gap-4 sm:gap-8 mb-5 ">
      <Form
        ref="form"
        @submit="handleSubmit"
        @invalid-submit="handleFail"
        :validation-schema="schema"
      >
        <div class="flex justify-center">
          <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl overflow-hidden mx-4 sm:mx-6 ">
            <div class="p-6 sm:p-8 container mx-auto items-start border-b ml-4 mt-[-25px]">
              <h1 class=" w-[193%]">
                <h3 class="gap-[10px]">
                  <CustomInput
                    class="mt-1.5 "
                    placeholder="Escopo do E-mail"
                    type="text"
                    name="escopo"
                    input-class="w-[25%] h-[40px]"
                    custom-label
                    required
                  >
                    <template #label>
                      <h2 class="text-2xl font-semibold text-neutral-900 inline">
                        Assunto
                      </h2>
                    </template>
                  </CustomInput>
                </h3>

                <div class="mt-7 mb-10">
                  <CustomInput
                    class="mt-1"
                    placeholder="Conteúdo do E-mail"
                    type="textarea"
                    name="corpo"
                    :input-class="classNames(['flex w-full'])"
                    height="560px"
                    :max-length="2000"
                    custom-label
                    required
                  >
                    <template #label>
                      <h2 class="text-2xl font-semibold text-neutral-900 inline ">
                        Conteúdo
                      </h2>
                    </template>
                  </CustomInput>
                </div>
              </h1>
              <div class="mt-7 mb-5 ">
                <CustomInput
                  class="mb-5 mt-1.5 "
                  name="dataEnvio"
                  type="date"
                  custom-label
                  required
                >
                  <template #label>
                    <div class="text-lg font-medium text-neutral-900 inline">
                      Data do próximo envio
                    </div>
                  </template>
                </CustomInput>
              </div>
            </div>
            <div class="flex flex-col items-start sm:flex-row justify-end gap-4 p-4 m-1 mr-5 mb-5">
              <CustomButton
                variant="flat"
                color="gray"
                tag="button"
                @click="handleCancel"
              >
                <h1 class=" text-gray-400 px-10 py-1.5">
                  Cancelar
                </h1>
              </CustomButton>

              <CustomButton
                class=""
                color="emerald"
                type="submit"
                tag="button"
              >
                <h1 class="px-10 py-1.5">
                  Salvar
                </h1>
              </CustomButton>
            </div>
          </div>
        </div>
      </Form>
    </div>
  </div>
  <CustomDialog v-model="dialogSucesso">
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
          E-mail atualizado com sucesso!
        </h1>
      </div>
    </div>
  </CustomDialog>
  <CustomDialog
    v-model="dialogFalha"
  >
    <div class="h-full flex justify-center items-center">
      <div class="w-1/2">
        <div class="text-red-600 text-center mb-3">
          <SvgIcon
            type="mdi"
            size="100"
            class="inline"
            :path="mdiAlertCircle"
          />
        </div>
        <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
          Falha ao atualizar o E-mail
        </h1>
      </div>
    </div>
  </CustomDialog>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import {
  mdiEmail,
  mdiChevronLeft,
  mdiCheckCircle,
  mdiAlertCircle

} from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import CustomInput from 'src/components/CustomInput.vue'
import classNames from 'classnames'
import { object, string } from 'yup'
import { Form } from 'vee-validate'
import CustomDialog from 'src/components/CustomDialog.vue'
import { useEmailStore } from 'src/store/EmailStore'

const emailStore = useEmailStore()

const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const form = ref<typeof Form | null>(null)

async function handleSubmit (values: any) {
  console.log('sub')
  const status = await emailStore.updateEmail(values)
  if (status !== 201) {
    dialogFalha.value = true
  } else {
    dialogSucesso.value = true
  }
  fetchUpdateEmail()
}
async function handleFail (values: any) {
  console.log('fail')
}
// botar data no futuro
const schema = object().shape({
  escopo: string().required('Insira o escopo do email'),
  corpo: string().required('Insira o corpo do email'),
  dataEnvio: string().required('Insira no valida futuro para o envio do email').test('Data', 'Data inválida', (value) => {
    if (value) {
      const date = value.split('/').reverse().join('-') // Convert date to ISO format (YYYY-MM-DD)
      const inputDate = new Date(date)
      const minDate = new Date() // Use the current date as the minimum date
      return inputDate >= minDate
    }
    return true
  })
})

async function handleCancel (values: any) {
  console.log('cancelar')
  fetchUpdateEmail()
}

let jsonResponse : any
console.log(jsonResponse)
async function fetchUpdateEmail () {
  const responseBack = await emailStore.fetchEmail()
  const jsonEmail = JSON.parse(responseBack)
  jsonResponse = jsonEmail

  console.log('jsonResponse')
  console.log(jsonResponse)

  // const message = jsonEmail.corpo
  if (jsonEmail.length > 1) {
    form.value?.setFieldValue('corpo', jsonEmail[0].corpo)
    form.value?.setFieldValue('escopo', jsonEmail[0].escopo)
  } else {
    form.value?.setFieldValue('corpo', jsonEmail.corpo)
    form.value?.setFieldValue('escopo', jsonEmail.escopo)
  }

  //   form.value?.setFieldValue('escopo', 'Atualização Cadastral - Meu Egresso')
  //   const message = `Prezado(a) [nome do aluno],

  // Espero que esta mensagem o encontre bem. Gostaríamos de lembrá-lo(a) da importância de manter seu cadastro atualizado em nosso portal Meu Egresso.

  // Para garantir que possamos manter contato com você e fornecer informações importantes sobre eventos, oportunidades de emprego, cursos e outros escopos relevantes, solicitamos que atualize suas informações pessoais e profissionais.

  // Pedimos que acesse o portal Meu Egresso (link) e faça login com suas credenciais. Em seguida, atualize suas informações no seu perfil.

  // Caso tenha alguma dificuldade para acessar o portal ou atualizar suas informações, entre em contato conosco pelo e-mail (e-mail) ou telefone (número). Teremos o maior prazer em ajudá-lo(a).

  // Agradecemos antecipadamente pela sua colaboração em manter suas informações atualizadas. Isso nos ajuda a manter contato com você e oferecer um serviço mais eficiente e personalizado.

  // Atenciosamente,

  // [Seu nome]

  // [Assinatura]`
}
onMounted(() => {
  fetchUpdateEmail()
})
</script>
