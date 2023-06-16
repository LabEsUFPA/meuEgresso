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
          :error-message="`Matrícula inválida, faltam ${missingDigits} dígitos`"
          custom-error-message
          @update:value="checkRegistrationLength"
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
            :required="bools.cotista"
            :disabled="!bools.cotista"
            :pre-filled="true"
          />

          <CustomCheckbox
            class="mb-5"
            name="academico.cotista.tipos.escola"
            label="Cota Escola"
            :required="bools.cotista"
            :disabled="!bools.cotista"
          />

          <CustomCheckbox
            class="mb-5"
            name="academico.cotista.tipos.raca"
            label="Autodeclaração de Raça"
            :required="bools.cotista"
            :disabled="!bools.cotista"
          />

          <CustomCheckbox
            name="academico.cotista.tipos.quilombolaIndigena"
            label="Quilombola/Indigena"
            :required="bools.cotista"
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
          :placeholder="placeHolders.bolsaHolder"
          :options="$storeCadastro.tiposBolsa"
          :required="bools.bolsista"
          :disabled="!bools.bolsista"
          :pre-filled="true"
        />

        <CustomInput
          class="mb-5"
          name="academico.bolsista.remuneracao"
          label="Remuneração da bolsa"
          type="number"
          step="0.01"
          placeholder="R$ 0,00"
          :required="bools.bolsista"
          :disabled="!bools.bolsista"
          money
        />

        <CustomCheckbox
          class="mb-5"
          name="academico.posGrad.value"
          v-model:value="bools.posGrad"
          label="Pós-graduação"
        />

        <CustomSelect
          class="mb-1"
          name="academico.posGrad.local"
          label="Instituição da pós-graduação"
          :placeholder="placeHolders.instituicaoHolder"
          :options="$storeCadastro.instituicoes"
          :required="bools.posGrad"
          :disabled="!bools.posGrad"
          :is-fetching="$storeCadastro.isFetchingUniversidades"
          @typing="$storeCadastro.fetchUniversidadesAsync($event, true)"
          @infinite-scroll="$storeCadastro.fetchMoreUniversidadesAsync"
          infinite
          id="posGradLocal"
          :pre-filled="true"
        />

        <button
          type="button"
          class="mb-5 ml-1 text-sm disabled:opacity-75 text-cyan-700 enabled:hover:text-cyan-500 disabled:cursor-not-allowed cursor-pointer"
          :disabled="!bools.posGrad"
          @click="dialogInstituicao = true"
        >
          Não encontrou sua instituição? Clique aqui
        </button>

        <CustomSelect
          class="mb-1"
          name="academico.posGrad.curso"
          label="Curso de pós-graduação"
          :placeholder="placeHolders.cursoHolder"
          :options="$storeCadastro.cursos"
          :required="bools.posGrad"
          :disabled="!bools.posGrad"
          :pre-filled="true"
        />

        <button
          type="button"
          class="mb-5 ml-1 text-sm disabled:opacity-75 text-cyan-700 enabled:hover:text-cyan-500 disabled:cursor-not-allowed cursor-pointer"
          :disabled="!bools.posGrad"
          @click="dialogCurso = true"
        >
          Não encontrou seu curso? Clique aqui
        </button>

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
  <CustomDialog v-model="dialogInstituicao">
    <div class="h-full flex justify-center flex-col items-center">
      <div class="text-2xl font-semibold text-cyan-800">
        Cadastrar instituição
      </div>

      <Form
        :validation-schema="instituicaoSchema"
        @submit="handleNewInstituicao"
        class="flex flex-col items-center gap-1"
      >
        <CustomInput
          class="mt-[-1px]"
          name="nome"
          label="Nome da instituição de ensino"
          placeholder="Universidade Federal do Pará (UFPA)"
        />

        <CustomButton
          class="mt-3"
          type="submit"
        >
          Cadastrar
        </CustomButton>
      </Form>
    </div>
  </CustomDialog>
  <CustomDialog v-model="dialogCurso">
    <div class="h-full flex justify-center flex-col items-center">
      <div class="text-2xl font-semibold text-cyan-800">
        Cadastrar curso
      </div>

      <Form
        :validation-schema="cursoSchema"
        @submit="handleNewCurso"
        class="flex flex-col items-center gap-1"
      >
        <CustomInput
          class="mt-[-1px]"
          name="nome"
          label="Nome da curso"
          placeholder="Engenharia de software"
        />
        <CustomButton
          class="mt-3"
          type="submit"
        >
          Cadastrar
        </CustomButton>
      </Form>
    </div>
  </CustomDialog>
</template>

<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, watch } from 'vue'
import { mdiSchool } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import { object, string } from 'yup'

const $storeCadastro = useCadastroEgressoStore()
const storage = new LocalStorage()

if (storage.has('loggedEgresso')) {
  $storeCadastro.fetchAll()
}

const missingDigits = ref(0)
const dialogInstituicao = ref(false)
const dialogCurso = ref(false)
interface Props {
  isInput?: boolean
  bools?: any
  bolsaHolder?: string
  instituicaoHolder: string,
  cursoHolder: string
}

const props = withDefaults(defineProps<Props>(), {
  isInput: true,
  bools: {
    cotista: false,
    bolsista: false,
    posGrad: false,
    palestras: false
  },
  bolsaHolder: 'Selecione',
  instituicaoHolder: 'Selecione',
  cursoHolder: 'Selecione'

})
const bools = ref({
  cotista: props.bools?.cotista,
  bolsista: props.bools?.bolsista,
  posGrad: props.bools?.posGrad,
  palestras: props.bools?.palestras
})
const placeHolders = ref({
  bolsaHolder: props.bolsaHolder,
  instituicaoHolder: props.instituicaoHolder,
  cursoHolder: props.cursoHolder
})

const checkRegistrationLength = ($event: Event) => {
  missingDigits.value = 12 - String($event).length
}

async function handleNewInstituicao (event: any) {
  const response = await $storeCadastro.cadastrarInstituicao(event.nome)

  if (response?.status === 201) {
    alert('Instituição cadastrada com sucesso.')
    dialogInstituicao.value = false
  }
}

async function handleNewCurso (event: any) {
  const response = await $storeCadastro.cadastrarCurso(event.nome)

  if (response?.status === 201) {
    alert('Instituição cadastrada com sucesso.')
    dialogCurso.value = false
  }
}
const instituicaoSchema = object().shape({
  nome: string().required('Insira o nome da instituição')
})

const cursoSchema = object().shape({
  nome: string().required('Insira o nome do curso')
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

watch(() => props.bolsaHolder, (newValue) => {
  placeHolders.value.bolsaHolder = newValue
})
watch(() => props.instituicaoHolder, (newValue) => {
  placeHolders.value.instituicaoHolder = newValue
})
watch(() => props.cursoHolder, (newValue) => {
  placeHolders.value.cursoHolder = newValue
})

</script>
