<template>
  <Form
    ref="form"
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex gap-4 w-[960px] text-cyan-800 border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 shadow-md items-center">
        <SvgIcon
          type="mdi"
          size="32"
          class=""
          :path="mdiBullhorn"
        />
        <h1 class="text-2xl sm:text-3xl font-bold leading-tight">
          Anunciar vaga de emprego
        </h1>
      </div>
    </div>

    <div class="w-full flex items-center justify-center bg-neutral-100 mb-10 ">
      <div
        v-if="!submitSuccess"
        class="flex flex-col items-center bg-white w-[960px] py-6 sm:py-8 mx-4 sm:mx-6 rounded-bl-2xl rounded-br-2xl shadow-md"
      >
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
        />

        <div class="flex w-full px-8  mb-8 mx-4 sm:mx-0">
          <div class="flex flex-col  w-full gap-y-4 sm:gap-y-6">
            <div class="flex flex-col w-full gap-x-6 gap-y-4 md:gap-x-16 lg:gap-x-20 xl:gap-x-24 2xl:gap-x-32 sm:flex-col">
              <CustomInput
                name="titulo"
                label="Título da vaga"
                placeholder="Ex: Vaga no PCT-Guamá"
                :required="true"
              />
              <CustomSelect
                class="mb-5"
                name="areasEmprego"
                label="Área de emprego"
                :options="$store.areasEmprego"
                :required="true"
              />
              <CustomInput
                name="descricao"
                label="Descrição (máximo de 1000 caracteres)"
                placeholder="Insira a descrição da vaga que você deseja anunciar!"
                type="textarea"
                :max-length="1000"
                :input-class="classNames(['flex w-full'])"
                :required="true"
                :icon-path="mdiLink"
              />
              <CustomInput
                name="salario"
                label="Salário"
                type="text"
                placeholder="R$ 0,00"
                :max-length="12"
                :min-length="0"
                :min="0"
                money
              />
              <CustomInput
                name="link"
                label="Link da vaga"
                placeholder="Link referente a vaga"
                :required="true"
                :icon-path="mdiLink"
              />
              <CustomInput
                name="dataExpiracao"
                type="date"
                label="Data de expiração"
                :required="true"
              />
            </div>
          </div>
        </div>
        <div class="flex w-full justify-center gap-16 border-t-[1px] pt-8 mt-8 border-gray-200">
          <CustomButton
            tag="router"
            link="/vagas"
            type="button"
            color="gray"
          >
            Cancelar
          </CustomButton>
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

  <CustomDialog
    :model-value="submitSuccess"
    @close="retornaFeed"
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
        <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
          Anúncio cadastrado!
        </h1>
      </div>
    </div>
  </CustomDialog>
  <CustomDialog
    v-model="submitError"
  >
    <div class="h-full flex justify-center items-center">
      <div class="w-1/2">
        <div class="text-red-500 text-center mb-3">
          <SvgIcon
            type="mdi"
            size="100"
            class="inline"
            :path="mdiCloseCircle"
          />
        </div>
        <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
          Erro no cadastro
        </h1>
      </div>
    </div>
  </CustomDialog>
</template>

<script setup lang="ts">

import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomInput from 'src/components/CustomInput.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import { Form } from 'vee-validate'
import { object, string } from 'yup'
import { mdiCheckCircle, mdiBullhorn, mdiLink, mdiCloseCircle } from '@mdi/js'
import { useAnuncioVagaStore } from 'src/store/AnuncioVagaStore'
import classNames from 'classnames'
import { useRouter } from 'vue-router'

const router = useRouter()
const form = ref<typeof Form | null>(null)
const $store = useAnuncioVagaStore()
const error = ref(false)
const errorText = ref('')
const submitSuccess = ref(false)
const submitError = ref(false)

const retornaFeed = () => {
  router.push({ path: '/vagas' })
}

$store.fetchAreasEmprego()

const schema = object().shape({
  titulo: string().required('O título é um campo obrigatório').trim().matches(/^[\w\s\d\SÀ-ÿ]+$/, 'Somente letras e números.'),
  areasEmprego: string().required('A área da emprego é um campo obrigatório.'),
  dataExpiracao: string().required('Campo obrigatório').test('Data', 'Data deve ser sempre no futuro', (value) => {
    if (value) {
      const date = value.split('/').reverse().join('-') // Converte data para (YYYY-MM-DD)
      const minDate = new Date()
      const maxDate = new Date((minDate.getFullYear() + 1).toString() + '-12-31')
      const inputDate = new Date(date)
      return inputDate >= minDate && inputDate <= maxDate
    }
    return true
  }),
  salario: string().max(12),
  link: string().required('O link para contato é um campo obrigatório.').trim().matches(/^(http|https):\/\/[a-zA-Z0-9\-.]+\.[a-zA-Z]{2,}(\/\S*)?$/, 'Deve ser um formato de link válido em http ou https.'),
  descricao: string().required('A descrição é um campo obrigatório.')
})

// Post Anuncio
const handleSubmit = async (submitData: any) => {
  const responseValidation = await $store.cadastraAnuncio({
    titulo: submitData.titulo,
    areaEmprego: {
      id: submitData.areasEmprego,
      nome: ''
    },
    dataExpiracao: submitData.dataExpiracao.toString(),
    salario: submitData.salario,
    link: submitData.link,
    descricao: submitData.descricao
  })

  if (responseValidation === 201) {
    error.value = false
    submitSuccess.value = true
  } else {
    submitError.value = true
  }
}
const onInvalid = (e: any) => {
  console.log(e)
}

</script>
