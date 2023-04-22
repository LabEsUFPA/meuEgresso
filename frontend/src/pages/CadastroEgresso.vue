<template>
  <div class="container mx-auto p-3 pb-0 mt-10">
    <form @submit.prevent="handleSubmit($event)">
      <h1 class="text-cyan-800 text-2xl font-semibold">
        Cadastro de egresso
      </h1>
      <FolderSection>
        <template #title>
          <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
            <SvgIcon
              type="mdi"
              size="20"
              class="inline mr-2"
              :path="mdiAccount"
            />
            Geral
          </h1>
        </template>
        <template #default>
          <div>
            <CustomInput
              class="mb-5"
              v-model="data.geral.nome"
              label="Nome"
              helper-text="Números e caracteres especiais não são permitidos"
              :icon-path="mdiAccount"
              required
            />

            <CustomInput
              class="mb-5"
              v-model="data.geral.nascimento"
              label="Data de Nascimento"
              type="date"
              required
            />

            <CustomSelect
              class="mb-5"
              v-model="data.geral.genero"
              label="Genero"
              :options="selectOpts.genero"
              required
            />

            <CustomInput
              class="mb-5"
              v-model="data.geral.email"
              label="Email"
              placeholder="Ex: example@gov.br"
              helper-text="Use um email válido: hotmail, outlook, gmail, etc."
              :icon-path="mdiEmail"
              required
            />

            <CustomInput
              class="mb-5"
              v-model="data.geral.linkedin"
              :icon-path="svgPath.linkedin"
              label="Linkedin"
            />

            <CustomInput
              v-model="data.geral.lattes"
              label="Curriculo Lattes"
              icon-path="src/assets/Lattes.svg"
              img-icon
            />
          </div>
        </template>
      </FolderSection>

      <FolderSection class="mt-6">
        <template #title>
          <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
            <SvgIcon
              type="mdi"
              size="20"
              class="inline mr-2"
              :path="mdiMapMarker"
            />
            Localização
          </h1>
        </template>

        <template #default>
          <div>
            <CustomSelect
              class="mb-5"
              v-model="data.localizacao.pais"
              label="País"
              :options="countries"
              required
            />

            <CustomSelect
              class="mb-5"
              v-model="data.localizacao.estado"
              label="Estado"
              :options="states"
              required
            />

            <CustomSelect
              v-model="data.localizacao.cidade"
              label="Cidade"
              :options="cities"
              required
            />
          </div>
        </template>
      </FolderSection>

      <FolderSection class="mt-6">
        <template #title>
          <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
            <SvgIcon
              type="mdi"
              size="20"
              class="inline mr-2"
              :path="mdiSchool"
            />
            Academico
          </h1>
        </template>

        <template #default>
          <div>
            <CustomInput
              class="mb-5"
              v-model="data.academico.matricula"
              label="Matrícula"
              mask="############"
              placeholder="205004940001"
              required
            />

            <CustomInput
              class="mb-5"
              v-model="data.academico.email"
              label="Email institucional"
              placeholder="Selecione"
              required
            />

            <CustomSelect
              class="mb-5"
              v-model="data.academico.tipoAluno"
              label="Tipo de Aluno"
              placeholder="Selecione"
              :options="selectOpts.tipoAluno"
              required
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Marque todos as opções que sejam verdadeiras abaixo:
            </div>

            <CustomCheckbox
              class="mb-5"
              v-model="data.academico.cotista.value"
              label="Cotista"
            />

            <CustomSelect
              class="mb-5"
              v-model="data.academico.cotista.tipo"
              label="Tipo de Cota"
              placeholder="Selecione"
              :options="selectOpts.tipoCota"
              :required="data.academico.cotista.value"
            />

            <CustomCheckbox
              class="mb-5"
              v-model="data.academico.bolsista.value"
              label="Bolsista"
            />

            <CustomInput
              class="mb-5"
              v-model="data.academico.bolsista.tipo"
              label="Tipo de Bolsa"
              placeholder="Selecione"
              :options="selectOpts.tipoBolsa"
              :required="data.academico.bolsista.value"
            />

            <CustomInput
              class="mb-5"
              v-model="data.academico.bolsista.remuneracao"
              label="Remuneração da bolsa"
              placeholder="Selecione"
              type="number"
              step="0.01"
              :required="data.academico.bolsista.value"
            />

            <CustomCheckbox
              class="mb-5"
              v-model="data.academico.posGrad.value"
              label="Pós-graduação"
            />

            <CustomInput
              class="mb-5"
              v-model="data.academico.posGrad.local"
              label="Local da pós-graduação"
              placeholder="Selecione"
              :required="data.academico.posGrad.value"
            />

            <CustomInput
              class="mb-5"
              v-model="data.academico.posGrad.curso"
              label="Curso de pós-graduação"
              placeholder="Selecione"
              :required="data.academico.posGrad.value"
            />

            <CustomCheckbox
              v-model="data.academico.desejaPos"
              label="Deseja realizar pós graduação?"
              v-if="!data.academico.posGrad.value"
            />
          </div>
        </template>
      </FolderSection>

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
          <div>
            <CustomSelect
              class="mb-5"
              v-model="data.carreira.area"
              label="Area de Atuação"
              placeholder="Selecione"
              :options="selectOpts.areaAtuacao"
            />

            <CustomSelect
              class="mb-5"
              v-model="data.carreira.setor"
              label="Setor de Atuação"
              placeholder="Selecione"
              :required="data.carreira.area !== 'Desempregado'"
              :options="selectOpts.setorAtuacao"
            />

            <CustomInput
              class="mb-5"
              v-model="data.carreira.empresa"
              label="Empresa"
              placeholder="Ex: Google"
              :required="data.carreira.area !== 'Desempregado'"
            />

            <CustomInput
              class="mb-5"
              v-model="data.carreira.faixaSalarial"
              label="Faixa Salarial"
              type="number"
              step="0.01"
              :required="data.carreira.area !== 'Desempregado'"
            />
          </div>
        </template>
      </FolderSection>

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
            <CustomCheckbox
              v-model="data.adicionais.palestras"
              label="Gostaria de apresentar palestras"
              class="mb-5"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para listar aqueles assuntos que melhor você se sente para apresentar palestras:
            </div>

            <textarea
              class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block focus:outline-sky-400 focus:outline-2"
              v-model="data.adicionais.assuntosPalestras"
              :required="data.adicionais.palestras"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para de forma simples e resumida  compartilhar com outras pessoas experiências positivas ao realizar o curso:
            </div>

            <textarea
              class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block focus:outline-sky-400 focus:outline-2"
              v-model="data.adicionais.experiencias"
              required
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para que todos possam ter conhecimento sobre suas contribuições para a sociedade seja pequena ou grande, pois tudo tem seu impacto:
            </div>

            <textarea
              class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block focus:outline-sky-400 focus:outline-2"
              v-model="data.adicionais.contribuicoes"
              required
            />
          </div>
        </template>
      </FolderSection>
      <div class="py-10 flex flex-row justify-center items-center">
        <CustomButton
          color="emerald"
          type="submit"
        >
          Salvar
        </CustomButton>
      </div>
    </form>
  </div>
</template>

<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { ref, computed } from 'vue'
import { Country, State, City } from 'country-state-city'
import svgPath from 'src/assets/svgPaths.json'
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool
} from '@mdi/js'

const data = ref({
  geral: {
    nome: '',
    nascimento: '',
    email: '',
    genero: '',
    confirmacaoEmail: '',
    linkedin: '',
    lattes: ''
  },
  localizacao: {
    pais: '',
    estado: '',
    cidade: ''
  },
  academico: {
    matricula: '',
    email: '',
    tipoAluno: '',
    cotista: {
      value: false,
      tipo: ''
    },
    bolsista: {
      value: false,
      tipo: '',
      remuneracao: ''
    },
    posGrad: {
      value: false,
      local: '',
      curso: ''
    },
    desejaPos: false
  },
  carreira: {
    area: '',
    setor: '',
    empresa: '',
    faixaSalarial: '',
    remuneracao: ''
  },
  adicionais: {
    palestras: false,
    assuntosPalestras: '',
    experiencias: '',
    contribuicoes: ''
  }
})

const selectOpts = ref({
  genero: ['Masculino', 'Feminino', 'Não-Binário', 'Transsexual'],
  estado: ['Pará', 'Rio Grande do Norte', 'São Paulo', 'Ceara'],
  cidade: ['Belém', 'Ananideua', 'Natal', 'Fortaleza'],
  tipoAluno: ['Graduação', 'Pós-graduação'],
  tipoCota: ['Escola', 'Renda', 'Autodeclaração de Raça', 'Quilombola/Indígena'],
  tipoBolsa: ['PIBIC', 'PROAD', 'PROEX', 'Permanência', 'Outros'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docencia', 'Outros']
})

function handleSubmit ($event: Event) {
  console.log(data.value)
}

const countries = computed(() => {
  const countries = Country.getAllCountries()
  const filteredCountries = []
  for (const country of countries) {
    filteredCountries.push({
      label: country.name,
      value: country.isoCode
    })
  }

  return filteredCountries
})

const states = computed(() => {
  const states = State.getStatesOfCountry(data.value.localizacao.pais)
  const filteredStates = []

  for (const state of states) {
    filteredStates.push({
      label: state.name,
      value: state.isoCode
    })
  }
  return filteredStates
})

const cities = computed(() => {
  const cities = City.getCitiesOfState(data.value.localizacao.pais, data.value.localizacao.estado)
  const filteredCities = []

  for (const city of cities) {
    filteredCities.push(city.name)
  }
  return filteredCities
})
</script>
