
<template>
  <FolderSection class="mt-6">
    <template #title>
      <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
        <SvgIcon
          type="mdi"
          size="20"
          class="inline mr-2"
          :path="mdiBriefcase"
        />
        Carreira
      </h1>
    </template>

    <template #default>
      <div v-if="isInput">
        <CustomSelect
          class="mb-5"
          name="carreira.area"
          label="Área de Atuação"
          :placeholder="placeHolders.areaAtuacaoHolder"
          @change="area = $event"
          :options="selectOpts.areaAtuacao"
          required
          :pre-filled="true"
        />

        <CustomSelect
          class="mb-5"
          name="carreira.setor"
          label="Setor de Atuação"
          :placeholder="placeHolders.setorAtuacaoHolder"
          :options="selectOpts.setorAtuacao"
          :required="area !== 'Desempregado'"
          :disabled="area === 'Desempregado'"
          :pre-filled="true"
        />

        <CustomInput
          class="mb-5"
          name="carreira.empresa"
          label="Empresa"
          placeholder="Ex: Google"
          :required="area !== 'Desempregado'"
          :disabled="area === 'Desempregado'"
        />

        <CustomSelect
          class="mb-5"
          name="carreira.faixaSalarial"
          label="Faixa Salarial"
          :placeholder="placeHolders.faixaSalarialHolder"
          :options="$store.faixasSalariais"
          :required="area !== 'Desempregado'"
          :disabled="area === 'Desempregado'"
          :pre-filled="true"
        />
      </div>
      <div v-else>
        <slot name="NonInputData" />
      </div>
    </template>
    <template #EditButton>
      <slot name="EditButton" />
    </template>
  </FolderSection>
  <CustomDialog v-model="dialogInstituicao">
    <div class="h-full flex justify-center gap-10 flex-col items-center">
      <div class="text-2xl font-semibold text-cyan-800">
        Cadastrar Empresa
      </div>

      <Form
        :validation-schema="instituicaoSchema"
        @submit="handleNewInstituicao"
        class="flex flex-col items-center gap-4"
      >
        <CustomInput
          name="nome"
          label="Nome da instituição de ensino"
          placeholder="Universidade Federal do Pará (UFPA)"
        />

        <CustomButton type="submit">
          Cadastrar
        </CustomButton>
      </Form>
    </div>
  </CustomDialog>
</template>
<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import CustomButton from 'src/components/CustomButton.vue'

import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { object, string } from 'yup'
import { ref, watch } from 'vue'
import { mdiBriefcase } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import CustomDialog from 'src/components/CustomDialog.vue'

const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

if (storage.has('loggedEgresso')) {
  $store.fetchAll()
}

const area = ref('')
const dialogInstituicao = ref(false)

const selectOpts = ref({
  tipoAluno: ['Graduação', 'Pós-graduação'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docencia', 'Outros']
})
interface Props {
  isInput?: boolean
  areaAtuacaoHolder: string
  setorAtuacaoHolder: string
  faixaSalarialHolder: string
}

const props = withDefaults(defineProps<Props>(), {
  isInput: true,
  areaAtuacaoHolder: 'Selecione',
  setorAtuacaoHolder: 'Selecione',
  faixaSalarialHolder: 'Selecione'
})
async function handleNewInstituicao (event: any) {
  const response = await $store.cadastrarInstituicao(event.nome)

  if (response?.status === 201) {
    alert('Instituição cadastrada com sucesso.')
    dialogInstituicao.value = false
  }
}
const instituicaoSchema = object().shape({
  nome: string().required('Insira o nome da instituição')
})
const placeHolders = ref({
  areaAtuacaoHolder: props.areaAtuacaoHolder,
  setorAtuacaoHolder: props.setorAtuacaoHolder,
  faixaSalarialHolder: props.faixaSalarialHolder
})

watch(() => props.areaAtuacaoHolder, (newValue) => {
  placeHolders.value.areaAtuacaoHolder = newValue
})

watch(() => props.setorAtuacaoHolder, (newValue) => {
  placeHolders.value.setorAtuacaoHolder = newValue
})

watch(() => props.faixaSalarialHolder, (newValue) => {
  placeHolders.value.faixaSalarialHolder = newValue
})

</script>
