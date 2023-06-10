<template>
  <FolderSection class="mt-6">
    <template #title>
      <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
        <SvgIcon
          type="mdi"
          size="20"
          class="inline mr-2"
          :path="mdiMessage"
        />
        Adicionais
      </h1>
    </template>

    <template #default>
      <div>
        <div v-if="isInput">
          <CustomCheckbox
            name="adicionais.palestras"
            label="Gostaria de apresentar palestras"
            class="mb-5"
            v-model:value="bools.palestras"
          />

          <div class="mb-5 text-sm font-semibold text-cyan-600">
            Descreva abaixo os assuntos nos quais você se sente mais confiante para apresentar palestras. <sup
              v-if="bools.palestras"
              class="text-red-500"
            >*</sup>
          </div>

          <CustomInput
            type="textarea"
            class="mb-5"
            name="adicionais.assuntosPalestras"
            :required="bools.palestras"
            :disabled="!bools.palestras"
          />

          <div class="mb-5 text-sm font-semibold text-cyan-600">
            Compartilhe abaixo, de forma simples e resumida, suas experiências positivas ao realizar o curso. <sup class="text-red-500">*</sup>
          </div>

          <CustomInput
            type="textarea"
            class="mb-5"
            name="adicionais.experiencias"
          />

          <div class="mb-5 text-sm font-semibold text-cyan-600">
            Compartilhe no campo abaixo todas as suas contribuições para a sociedade, sejam elas pequenas ou grandes, pois tudo tem impacto. <sup class="text-red-500">*</sup>
          </div>

          <CustomInput
            type="textarea"
            name="adicionais.contribuicoes"
          />
        </div>
        <div v-else>
          <slot name="NonInputData" />
        </div>
      </div>
    </template>

    <template
      #EditButton
    >
      <slot name="EditButton" />
    </template>
  </FolderSection>
</template>

<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, watch, onMounted } from 'vue'
import { mdiMessage } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'

const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

if(storage.has('loggedEgresso')){
  $store.fetchAll()
}


const pais = ref('')
const estado = ref('')
const form = ref<typeof Form | null>(null)

interface Props {
  isInput?: boolean
  bools?: any

}

const props = withDefaults(defineProps<Props>(), {
  isInput: true,
  bools: {
    cotista: false,
    bolsista: false,
    posGrad: false,
    palestras: false
  }

})
const bools = ref({
  cotista: props.bools?.cotista,
  bolsista: props.bools?.bolsista,
  posGrad: props.bools?.posGrad,
  palestras: props.bools?.palestras
})

onMounted(() => {
  watch(pais, () => {
    form.value?.setFieldValue('localizacao.cidade', '')
    form.value?.setFieldValue('localizacao.estado', '')
  })

  watch(estado, () => {
    form.value?.setFieldValue('localizacao.cidade', '')
  })

  if (storage.has('loggedUser')) {
    const userData = JSON.parse(storage.get('loggedUser'))

    form.value?.setFieldValue('geral.email', userData.email)
    form.value?.setFieldValue('geral.nome', userData.nome.split(' ').map((str: string) => {
      return str !== 'de' && str !== 'da' ? str[0].toUpperCase() + str.substring(1) : str
    }).join(' '))
  }
})
watch(() => props.bools.cotista, (newValue) => {
  bools.value.cotista = newValue
})

watch(() => props.bools.bolsista, (newValue) => {
  bools.value.bolsista = newValue
})

watch(() => props.bools.posGrad, (newValue) => {
  bools.value.posGrad = newValue
})

watch(() => props.bools.palestras, (newValue) => {
  bools.value.palestras = newValue
})
</script>
