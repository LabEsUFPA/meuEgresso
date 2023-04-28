<template>
  <div class="container mx-auto p-3 pb-0 mt-10">
    <Form
      @submit="handleSubmit"
      @invalid-submit="onInvalid"
      :validation-schema="schema"
    >
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
              name="geral.nome"
              label="Nome"
              :icon-path="mdiAccount"
              required
            />

            <CustomInput
              class="mb-5"
              name="geral.nascimento"
              type="date"
              label="Data de Nascimento"
              required
            />

            <CustomSelect
              class="mb-5"
              name="geral.genero"
              label="Genero"
              :options="selectOpts.genero"
              required
            />

            <CustomInput
              class="mb-5"
              name="geral.email"
              label="E-mail"
              placeholder="Ex: example@gov.br"
              helper-text="Use um email válido: hotmail, outlook, gmail, etc."
              :icon-path="mdiEmail"
              required
            />

            <CustomInput
              class="mb-5"
              name="geral.linkedin"
              label="Linkedin"
              :icon-path="svgPath.linkedin"
            />

            <CustomInput
              label="Curriculo Lattes"
              name="geral.lattes"
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
              name="localizacao.pais"
              label="País"
              :options="countries"
              v-model:value="selections.pais"
              required
            />

            <CustomSelect
              class="mb-5"
              name="localizacao.estado"
              label="Estado"
              :options="states"
              v-model:value="selections.estado"
              required
            />

            <CustomSelect
              name="localizacao.cidade"
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
              name="academico.matricula"
              label="Matrícula"
              mask="############"
              placeholder="205004940001"
              required
            />

            <CustomInput
              class="mb-5"
              name="academico.email"
              label="Email institucional"
              placeholder="Selecione"
              required
            />

            <CustomSelect
              class="mb-5"
              name="academico.tipoAluno"
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
              name="academico.cotista.value"
              label="Cotista"
              v-model:value="bools.cotista"
            />

            <CustomSelect
              class="mb-5"
              name="academico.cotista.tipo"
              label="Tipo de Cota"
              placeholder="Selecione"
              :options="selectOpts.tipoCota"
              :required="bools.cotista"
              :disabled="!bools.cotista"
            />

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
              :options="selectOpts.tipoBolsa"
              :required="bools.bolsista"
              :disabled="!bools.bolsista"
            />

            <CustomInput
              class="mb-5"
              name="academico.bolsista.remuneracao"
              label="Remuneração da bolsa"
              placeholder="Selecione"
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
              label="Local da pós-graduação"
              placeholder="Selecione"
              :required="bools.posGrad"
              :disabled="!bools.posGrad"
            />

            <CustomInput
              class="mb-5"
              name="academico.posGrad.curso"
              label="Curso de pós-graduação"
              placeholder="Selecione"
              :required="bools.posGrad"
              :disabled="!bools.posGrad"
            />

            <CustomCheckbox
              name="academico.posGrad.desejaPos"
              label="Deseja realizar pós graduação?"
              v-if="!bools.posGrad"
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
              name="carreira.area"
              label="Area de Atuação"
              placeholder="Selecione"
              v-model:value="selections.area"
              :options="selectOpts.areaAtuacao"
            />

            <CustomSelect
              class="mb-5"
              name="carreira.setor"
              label="Setor de Atuação"
              placeholder="Selecione"
              :options="selectOpts.setorAtuacao"
              :required="selections.area !== 'Desempregado'"
              :disabled="selections.area === 'Desempregado'"
            />

            <CustomInput
              class="mb-5"
              name="carreira.empresa"
              label="Empresa"
              placeholder="Ex: Google"
              :required="selections.area !== 'Desempregado'"
              :disabled="selections.area === 'Desempregado'"
            />

            <CustomInput
              class="mb-5"
              name="carreira.faixaSalarial"
              label="Faixa Salarial"
              type="number"
              step="0.01"
              :required="selections.area !== 'Desempregado'"
              :disabled="selections.area === 'Desempregado'"
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
              name="adicionais.palestras"
              label="Gostaria de apresentar palestras"
              class="mb-5"
              v-model:value="bools.palestras"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para listar aqueles assuntos que melhor você se sente para apresentar palestras:
            </div>

            <CustomTextarea
              class="mb-5"
              name="adicionais.assuntosPalestras"
              :required="bools.palestras"
              :disabled="!bools.palestras"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para de forma simples e resumida  compartilhar com outras pessoas experiências positivas ao realizar o curso:
            </div>

            <CustomTextarea
              class="mb-5"
              name="adicionais.experiencias"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para que todos possam ter conhecimento sobre suas contribuições para a sociedade seja pequena ou grande, pois tudo tem seu impacto:
            </div>

            <CustomTextarea name="adicionais.contribuicoes" />
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
    </Form>
  </div>
</template>

<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomTextarea from 'src/components/CustomTextarea.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, computed } from 'vue'
import { Country, State, City } from 'country-state-city'
import svgPath from 'src/assets/svgPaths.json'
import { object, string, date, boolean } from 'yup'
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool
} from '@mdi/js'

const selections = ref({
  pais: '',
  estado: '',
  area: ''
})

const bools = ref({
  cotista: false,
  bolsista: false,
  posGrad: false,
  palestras: false
})

const selectOpts = ref({
  genero: ['Masculino', 'Feminino', 'Não-Binário', 'Transsexual'],
  tipoAluno: ['Graduação', 'Pós-graduação'],
  tipoCota: ['Escola', 'Renda', 'Autodeclaração de Raça', 'Quilombola/Indígena'],
  tipoBolsa: ['PIBIC', 'PROAD', 'PROEX', 'Permanência', 'Outros'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docencia', 'Outros']
})

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
  const states = State.getStatesOfCountry(selections.value.pais)
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
  const cities = City.getCitiesOfState(selections.value.pais, selections.value.estado)
  const filteredCities = []

  for (const city of cities) {
    filteredCities.push(city.name)
  }
  return filteredCities
})

function handleSubmit (values: any) {
  console.log(values)
}

function onInvalid (e: any) {
  console.log(e)
}

const schema = object().shape({
  geral: object({
    nome: string().required(),
    nascimento: date().required(),
    email: string().email().required(),
    genero: string().required(),
    linkedin: string(),
    lattes: string()
  }),
  localizacao: object({
    pais: string().required(),
    estado: string().required(),
    cidade: string().required()
  }),
  academico: object({
    matricula: string().required(),
    email: string().email().required(),
    tipoAluno: string().required(),
    cotista: object({
      value: boolean(),
      tipo: string().when('value', ([value], schema) => {
        return value ? schema.required() : schema.notRequired()
      })
    }),
    bolsista: object({
      value: boolean(),
      tipo: string().when('value', ([value], schema) => {
        return value ? schema.required() : schema.notRequired()
      }),
      remuneracao: string().when('value', ([value], schema) => {
        return value ? schema.required() : schema.notRequired()
      })
    }),
    posGrad: object({
      value: boolean(),
      local: string().when('value', ([value], schema) => {
        return value ? schema.required() : schema.notRequired()
      }),
      curso: string().when('value', ([value], schema) => {
        return value ? schema.required() : schema.notRequired()
      })
    }),
    desejaPos: boolean()
  }),
  carreira: object({
    area: string().required(),
    setor: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required() : schema.notRequired()
    }),
    empresa: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required() : schema.notRequired()
    }),
    faixaSalarial: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required() : schema.notRequired()
    })
  }),
  adicionais: object({
    palestras: boolean(),
    assuntosPalestras: string().when('palestras', ([palestras], schema) => {
      return palestras ? schema.required() : schema.notRequired()
    }),
    experiencias: string().required(),
    contribuicoes: string().required()
  })
})
</script>
