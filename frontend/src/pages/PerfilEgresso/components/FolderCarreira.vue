
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

        <div class="mb-5 text-sm font-semibold text-cyan-600">
          <SvgIcon
            type="mdi"
            size="20"
            class="inline mr-2"
            :path="mdiMapMarker"
          />
          Localização:
        </div>

        <slot name="local" />
      </div>

      <div v-else>
        <slot name="NonInputData" />
      </div>
    </template>
    <template #EditButton>
      <slot name="EditButton" />
    </template>
  </FolderSection>
</template>
<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, watch, onMounted } from 'vue'
import { mdiBriefcase, mdiMapMarker } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

if (storage.has('loggedEgresso')) {
  $store.fetchAll()
}

const pais = ref('')
const estado = ref('')
const area = ref('')
const form = ref<typeof Form | null>(null)

const selectOpts = ref({
  tipoAluno: ['Graduação', 'Pós-graduação'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Programador', 'Analista', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docência', 'Outros']
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

const placeHolders = ref({
  areaAtuacaoHolder: props.areaAtuacaoHolder,
  setorAtuacaoHolder: props.setorAtuacaoHolder,
  faixaSalarialHolder: props.faixaSalarialHolder
})

onMounted(() => {
  watch(pais, () => {
    form.value?.setFieldValue('carreira.cidade', '')
    form.value?.setFieldValue('carreira.estado', '')
  })

  watch(estado, () => {
    form.value?.setFieldValue('carreira.cidade', '')
  })

  if (storage.has('loggedUser')) {
    const userData = JSON.parse(storage.get('loggedUser'))

    form.value?.setFieldValue('geral.email', userData.email)
    form.value?.setFieldValue('geral.nome', userData.nome)
  }
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
