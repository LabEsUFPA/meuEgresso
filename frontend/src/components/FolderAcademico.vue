<template>
  <FolderSection class="mt-6">
    <template #title>
      <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
        <SvgIcon
          type="mdi"
          size="20"
          class="inline mr-2"
          :path="mdiSchool"
        />
        Acadêmico
      </h1>
    </template>

    <template #default>
      <div v-if="isInput">
        <CustomInput
          class="mb-5"
          name="academico.matricula"
          label="Matrícula"
          mask="############"
          placeholder="205004940001"
        />

        <div class="mb-5 text-sm font-semibold text-cyan-600">
          Marque todos as opções que sejam verdadeiras abaixo:
        </div>

        <CustomCheckbox
          class="mb-5"
          name="academico.cotista.value"
          label="Cotista"
          v-model:value="bools.cotista"
        />

        <div class="mb-5 text-sm font-semibold text-cyan-600">
          Tipos de cota:
        </div>

        <div class="w-fit p-3 pr-5 rounded-xl bg-gray-100 mb-5">
          <CustomCheckbox
            class="mb-5"
            name="academico.cotista.tipos.renda"
            label="Cota Renda"
            :disabled="!bools.cotista"
          />

          <CustomCheckbox
            class="mb-5"
            name="academico.cotista.tipos.escola"
            label="Cota Escola"
            :disabled="!bools.cotista"
          />

          <CustomCheckbox
            class="mb-5"
            name="academico.cotista.tipos.raca"
            label="Autodeclaração de Raça"
            :disabled="!bools.cotista"
          />

          <CustomCheckbox
            name="academico.cotista.tipos.quilombolaIndigena"
            label="Quilombola/Indigena"
            :disabled="!bools.cotista"
          />
        </div>

        <CustomCheckbox
          class="mb-5"
          name="academico.bolsista.value"
          label="Bolsista"
          v-model:value="bools.bolsista"
        />

        <CustomSelect
          class="mb-5"
          name="academico.bolsista.tipo"
          label="Tipo de Bolsa"
          placeholder="Selecione"
          :options="$store.tiposBolsa"
          :required="bools.bolsista"
          :disabled="!bools.bolsista"
        />

        <CustomInput
          class="mb-5"
          name="academico.bolsista.remuneracao"
          label="Remuneração da bolsa"
          type="number"
          step="0.01"
          :required="bools.bolsista"
          :disabled="!bools.bolsista"
        />

        <CustomCheckbox
          class="mb-5"
          name="academico.posGrad.value"
          v-model:value="bools.posGrad"
          label="Pós-graduação"
        />

        <CustomInput
          class="mb-5"
          name="academico.posGrad.local"
          label="Instituição da pós-graduação"
          :required="bools.posGrad"
          :disabled="!bools.posGrad"
        />

        <CustomInput
          class="mb-5"
          name="academico.posGrad.curso"
          label="Curso de pós-graduação"
          :required="bools.posGrad"
          :disabled="!bools.posGrad"
        />

        <CustomCheckbox
          name="academico.posGrad.desejaPos"
          label="Desejo realizar pós graduação"
          v-if="!bools.posGrad"
        />
      </div>
      <div v-else>
        <slot name="NonInputData" />
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
import CustomSelect from 'src/components/CustomSelect.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, watch, onMounted } from 'vue'
import { mdiSchool } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

$store.fetchAll()

const pais = ref('')
const estado = ref('')
const form = ref<typeof Form | null>(null)

const bools = ref({
  cotista: false,
  bolsista: false,
  posGrad: false,
  palestras: false
})
interface Props {
  isInput?: boolean

}

const props = withDefaults(defineProps<Props>(), {
  isInput: true

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

</script>
