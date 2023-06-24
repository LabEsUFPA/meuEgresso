<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <RouterLink
            to="/painel-admin"
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
        @submit="handleSubmit"
        @invalid-submit="handleFail"
        :validation-schema="schema"
        ref="form"
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
                <div>
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
                      <h2 class="text-2xl font-semibold text-neutral-900 inline">
                        Conteúdo
                      </h2>
                    </template>
                  </CustomInput>
                </div>
              </h1>
              <div>
                <CustomDatepicker
                  name="dataEnvio"
                  :icon-path="mdiCalendarEdit"
                  :mask="['##/##/####', '##/##/##']"
                  custom-label
                  required
                >
                  <template #label>
                    <div class="text-lg font-medium text-neutral-900 inline">
                      Data do próximo envio
                    </div>
                  </template>
                </CustomDatepicker>
                <CustomTimepicker
                  class="mb-10"
                  name="tempoEnvio"
                  :icon-path="mdiClockEditOutline"
                  mask="##:##"
                  custom-label
                  required
                >
                  <template #label>
                    <div class="text-lg font-medium text-neutral-900 inline">
                      Horário do próximo envio
                    </div>
                  </template>
                </CustomTimepicker>
                <CustomCheckbox
                  name="destinatarioUnico"
                  label="E-mail para destinatário único"
                  v-model:value="bools.destinatarioUnico"
                  :disabled="bools.semestral || bools.anual"
                />
                <CustomInput
                  v-show="bools.destinatarioUnico"
                  class="mt-[-1.5em] mb-5"
                  name="email"
                  type="text"
                  :icon-path="mdiEmail"
                  custom-label
                  :required="bools.destinatarioUnico"
                  :disabled="bools.semestral || bools.anual"
                >
                  <template #label>
                    <div class="text-lg font-medium text-neutral-900 inline">
                      Email
                    </div>
                  </template>
                </CustomInput>
                <CustomCheckbox
                  name="semestral"
                  label="Envio Semestral"
                  v-model:value="bools.semestral"
                  :disabled="bools.anual || bools.destinatarioUnico"
                />
                <CustomCheckbox
                  class="mb-15"
                  name="anual"
                  label="Envio Anual"
                  v-model:value="bools.anual"
                  :disabled="bools.semestral || bools.destinatarioUnico"
                />
              </div>
            </div>
            <div class="flex flex-col items-start sm:flex-row justify-end gap-4 p-4 m-1 mr-5 mb-5">
              <CustomButton
                tag="router"
                link="/painel-admin"
                variant="flat"
                color="gray"
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
  <CustomDialog
    v-model="dialogSucesso"
    @close="$router.push('/painel-admin')"
  >
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
        <h1
          class="text-blue-900 text-center text-2xl font-semibold mb-8"
        >
          E-mail enviado ou programado com sucesso!
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
  mdiAlertCircle,
  mdiCalendarEdit,
  mdiClockEditOutline
} from '@mdi/js'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomDatepicker from 'src/components/CustomDatepicker.vue'
import CustomTimepicker from 'src/components/CustomTimepicker.vue'
import classNames from 'classnames'
import { object, string, boolean } from 'yup'
import { Form } from 'vee-validate'
import CustomDialog from 'src/components/CustomDialog.vue'
import { useEmailStore } from 'src/store/EmailStore'
import { usePainelStore } from 'src/store/PainelStore'

const emailStore = useEmailStore()
const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const form = ref<typeof Form | null>(null)
const $painelStore = usePainelStore()

const bools = ref({
  destinatarioUnico: !!$painelStore.getEgressoEmail(),
  semestral: false,
  anual: false
})

async function handleSubmit (values: any) {
  const data = {
    escopo: values.escopo,
    corpo: values.corpo,
    dataEnvio: setDatetime(new Date(values.dataEnvio), new Date(values.tempoEnvio)),
    email: values.destinatarioUnico && !values.semestral && !values.anual ? values.email : '',
    frequente: values.semestral || values.anual,
    anual: values.anual === undefined ? false : values.anual
  }
  const status = await emailStore.createEmail(data)
  if (status !== 201) {
    dialogFalha.value = true
  } else {
    dialogSucesso.value = true
  }
  fetchUpdateEmail()
}

const setDatetime = (date: Date, time: Date) => {
  const fulldate = new Date()
  fulldate.setTime(time.getTime())
  fulldate.setFullYear(date.getFullYear(), date.getMonth(), date.getDate())
  const isoDateTime = new Date(fulldate.getTime() - (fulldate.getTimezoneOffset() * 60000)).toISOString()

  return isoDateTime
}

async function handleFail (e: any) {
  console.log(e)
}
// botar data no futuro
const schema = object().shape({
  escopo: string().required('Insira o escopo do email'),
  corpo: string().required('Insira o corpo do email'),
  dataEnvio: string().required('Insira uma data valida no futuro').test('Data', 'Data inválida', (value) => {
    if (value) {
      const inputDate = new Date(value)
      const currentate = new Date(new Date().setHours(0, 0, 0, 0))
      if (currentate.getTime() > inputDate.getTime()) return false
      return true
    }
    return false
  }),
  tempoEnvio: string().required('Insira um horário').test('Tempo', 'Insira um horário no futuro', (value, schema) => {
    if (value) {
      const currentDate = new Date(schema.parent.dataEnvio)
      const inputDate = new Date(value)
      if (
        currentDate.getDate() > inputDate.getDate() ||
        currentDate.getMonth() > inputDate.getMonth() ||
        currentDate.getFullYear() > inputDate.getFullYear()
      ) return true
      if (currentDate.getHours() === inputDate.getHours()) {
        if (currentDate.getMinutes() >= inputDate.getMinutes()) return false
        return true
      } else if (inputDate.getHours() > currentDate.getHours()) return true
    }
    return false
  }),
  destinatarioUnico: boolean(),
  email: string()
    .email('Email inválido')
    .test('required', 'Campo obrigatório', function (value) {
      if (!this.parent.destinatarioUnico) return true
      else if (value) {
        if (value.length) return true
      }
      return false
    })
    .matches(
      /^([A-Za-z\d]+([._][A-Za-z\d]+)*@[A-Za-z\d]+(.[A-Za-z\d]+)*(.[A-z]{2,}))?$/,
      'Email inválido'
    ),
  semestral: boolean(),
  anual: boolean()
})

async function handleCancel (e: any) {
  console.log(e)
  fetchUpdateEmail()
}

// let jsonResponse : any
// console.log(jsonResponse)

async function fetchUpdateEmail () {
  // const responseBack = await emailStore.fetchEmail()
  // const jsonEmail = JSON.parse(responseBack)
  // jsonResponse = jsonEmail

  // // const message = jsonEmail.corpo
  // if (jsonEmail.length > 1) {
  //   form.value?.setFieldValue('corpo', jsonEmail[0].corpo)
  //   form.value?.setFieldValue('escopo', jsonEmail[0].escopo)
  // } else {
  //   form.value?.setFieldValue('corpo', jsonEmail.corpo)
  //   form.value?.setFieldValue('escopo', jsonEmail.escopo)
  // }

  const message = `Prezado(a),

  Espero que esta mensagem o encontre bem. Gostaríamos de lembrá-lo(a) da importância de manter seu cadastro atualizado em nosso portal Meu Egresso.

  Para garantir que possamos manter contato com você e fornecer informações importantes sobre eventos, oportunidades de emprego, cursos e outros escopos relevantes, solicitamos que atualize suas informações pessoais e profissionais.

  Pedimos que acesse o portal Meu Egresso (https://egressos.computacao.ufpa.br/) e faça login com suas credenciais. Em seguida, atualize suas informações no seu perfil.

  Caso tenha alguma dificuldade para acessar o portal ou atualizar suas informações, entre em contato conosco pelo e-mail egressocomp@ufpa.br ou pelo telefone 3201-7405 (Faculdade de Computação). Teremos o maior prazer em ajudá-lo(a).

  Agradecemos antecipadamente pela sua colaboração em manter suas informações atualizadas. Isso nos ajuda a manter contato com você e oferecer um serviço mais eficiente e personalizado.

  Atenciosamente,

  [Seu nome]

  [Assinatura]`
  form.value?.setFieldValue('escopo', 'Atualização Cadastral - Meu Egresso')
  form.value?.setFieldValue('corpo', message)
  form.value?.setFieldValue('dataEnvio', new Date())
  form.value?.setFieldValue('tempoEnvio', new Date(new Date().setMinutes(new Date().getMinutes() + 10)))

  if ($painelStore.getEgressoEmail()) {
    form.value?.setFieldValue('destinatarioUnico', true)
    form.value?.setFieldValue('email', $painelStore.getEgressoEmail())
  }
}
onMounted(() => {
  // router.push({ name: 'email', params: { destino: 'kalilsaldanha@gmail.com' } })
  fetchUpdateEmail()
})
</script>
