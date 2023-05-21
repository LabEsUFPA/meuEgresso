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
import { ref, computed, watch, onMounted } from 'vue'
import { Country, State, City } from 'country-state-city'
import { object, string, boolean } from 'yup'
import { mdiMessage } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import CustomPerfilData from 'src/components/CustomPerfilData.vue'

const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

$store.fetchAll()

const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const camposFaltosos = ref(false)

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
const dataEgresso = ref({
  egressoId: 0,
  generoId: 0,
  bolsaId: 0,
  areaAtuacaoId: 0,
  faixaSalarialId: 0,
  // cotasIds: [0, 0],

  // usuarioId: 0,
  // usuarioGruposId: [0],

  // palestrasId: 0,
  // contribuicaoId: 0,
  // titulacaoId: 0,
  // empregoId: 0,
  // empresaId: 0,
  // setorAtuacaoId: 0,
  // endereçoId: 0,

  // areaAtuacaoId: 0,
  // depoimentoId: 0,

  grupos: [''],

  geral: {
    email: '',
    genero: '',
    confirmacaoEmail: '',
    nascimento: '',
    isInput: false
  },
  localizacao: {
    cep: '',
    pais: '',
    estado: '',
    cidade: '',
    isInput: false
  },
  academico: {
    matricula: '',
    email: '',
    tipoAluno: '',
    cotista: {
      value: false,
      tipo: '',
      tipos: {
        escola: false,
        renda: false,
        raca: false,
        quilombolaIndigena: false

      }
    },
    bolsista: {
      value: false,
      tipo: '',
      remuneracao: ''
    },
    posGrad: {
      value: false,
      tipo: '',
      local: '',
      curso: '',
      desejaPos: false
    },
    isInput: false
  },
  carreira: {
    area: '',
    setor: '',
    empresa: '',
    faixaSalarial: '',
    remuneracao: '',
    isInput: false
  },
  adicionais: {
    palestras: false,
    assuntosPalestras: '',
    experiencias: '',
    contribuicoes: '',
    isInput: false
  },
  profileHead: {
    nome: '',
    linkedin: '',
    lattes: '',
    isInput: false
  }
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
