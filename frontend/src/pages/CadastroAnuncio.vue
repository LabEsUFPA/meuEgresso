<template>
  <Form
    ref="form"
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  >
    <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl py-8 mt-10 mx-6 shadow-md">
        <h1 class="text-cyan-800 text-3xl font-bold">
          <SvgIcon
            type="mdi"
            size="50"
            class="ml-10 mr-5 inline"
            :path="mdiBullhorn"
          />
           Anunciar vaga de emprego.
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
                    label="Descrição"
                    placeholder="Insira a descrição da vaga que você deseja anunciar!"
                    type="textarea"
                    :inputClass="classNames(['flex w-full'])"
                    :required="true"
                    :iconPath="mdiLink"
                    
                  />
                  <CustomInput
                    name="salario"
                    label="Salário"
                    type="number"
                    placeholder="R$ 0,00"
                  />
                  <CustomInput
                    name="link"
                    label="link"
                    placeholder="Link referente a vaga"
                    :required="true"
                    :iconPath="mdiLink"
                  />
                  <CustomInput
                    name="dataExpiracao"
                    type="date"
                    label="dd/mm/aaaa"
                    :required="true"
                  />
              </div>
            </div>


        </div>
          <div class="flex w-full justify-center gap-16 border-t-[1px] pt-8 mt-8 border-gray-200">
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
          Anúncio cadastrado!
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
import CustomSelect from 'src/components/CustomSelect.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import { Form } from 'vee-validate'
import { object, string, date, ref as refYup, number } from 'yup'
import { mdiCheckCircle, mdiBullhorn, mdiLink, mdiPencil } from '@mdi/js'
import {useAnuncioVagaStore} from 'src/store/AnuncioVagaStore'
import classNames from 'classnames'

const form = ref<typeof Form | null>(null)
const titulo = ref('')
const areasEmprego = ref('')
const dataExpiracao = ref('')
const salario = ref('')
const link = ref('')
const descricao = ref('')
const $store = useAnuncioVagaStore()
const error = ref(false)
const errorText = ref('')
const submitSuccess = ref(false)

$store.fetchAreasEmprego()

const schema = object().shape({
  titulo: string().required('O título é um campo obrigatório'),
  areasEmprego: string().required('A área da emprego é um campo obrigatório'),
  dataExpiracao: date().required('A data de expiração é um campo obrigatório'),
  salario: number(),
  link: string().required('O link para contato é um campo obrigatório'),
  descricao: string().required('A descrição é um campo obrigatório'),
})




//Post Anuncio
const handleSubmit = async (submitData: any) => {
  console.log('submit:', submitData)
  const responseValidation = await $store.cadastraAnuncio({
    titulo:submitData.titulo,
    areaEmprego:{
      id:submitData.areasEmprego,
      nome: ""
    },
    dataExpiracao:submitData.dataExpiracao.toString(),
    salario:submitData.salario,
    link:submitData.link,
    descricao:submitData.descricao
  })


  if (responseValidation===201) {
    error.value = false
    console.log("Usuário atualizado: " + responseValidation)
    submitSuccess.value = true
  }
 
}
const onInvalid = (e: any) => {
  console.log(e)
}


onMounted(() => {
  console.log("onMounted front iniciado...")
  watch(titulo, () => {
    console.log("watch front titulo:", titulo.value)
    form.value?.setFieldValue('titulo', titulo.value)
  })
  watch(areasEmprego, () => {
    console.log("watch front areasEmprego:", areasEmprego.value)
    form.value?.setFieldValue('areasEmprego', areasEmprego.value)
  })
  watch(dataExpiracao, () => {
    console.log("watch front dataExpiracao:", dataExpiracao.value)
    form.value?.setFieldValue('dataExpiracao', dataExpiracao.value)
  })
  watch(salario, () => {
    console.log("watch front salario:", salario.value)
    form.value?.setFieldValue('salario', salario.value)
  })
  watch(link, () => {
    console.log("watch front link:", link.value)
    form.value?.setFieldValue('link', link.value)
  })
  watch(descricao, () => {
    console.log("watch front descricao:", descricao.value)
    form.value?.setFieldValue('descricao', descricao.value)
  })

})
</script>
