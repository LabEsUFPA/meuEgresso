<template>
  <div class="container mx-auto p-3 pb-0 mt-10">
    <Form
      ref="form"
      @submit="handleSubmit"
      @invalid-submit="handleFail"
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
              error-message="Informe nome e sobrenome"
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
              label="Gênero"
              :options="$store.generos"
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
              icon-path="src/assets/lattesCinza.svg"
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
              :path="mdiSchool"
            />
            Acadêmico
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
              label="Área de Atuação"
              placeholder="Selecione"
              v-model:value="area"
              :options="selectOpts.areaAtuacao"
            />

            <CustomSelect
              class="mb-5"
              name="carreira.setor"
              label="Setor de Atuação"
              placeholder="Selecione"
              :options="selectOpts.setorAtuacao"
              :required="area !== 'Desempregado'"
              :disabled="area === 'Desempregado'"
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
              :options="$store.faixasSalariais"
              :required="area !== 'Desempregado'"
              :disabled="area === 'Desempregado'"
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
              v-model:value="pais"
              required
            />

            <CustomSelect
              class="mb-5"
              name="localizacao.estado"
              label="Estado"
              :options="states"
              v-model:value="estado"
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
              Use o campo abaixo para listar aqueles assuntos que melhor você se sente para apresentar palestras: <sup
                v-if="bools.palestras"
                class="text-red-500"
              >*</sup>
            </div>

            <CustomTextarea
              class="mb-5"
              name="adicionais.assuntosPalestras"
              :required="bools.palestras"
              :disabled="!bools.palestras"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para de forma simples e resumida  compartilhar com outras pessoas experiências positivas ao realizar o curso: <sup class="text-red-500">*</sup>
            </div>

            <CustomTextarea
              class="mb-5"
              name="adicionais.experiencias"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para que todos possam ter conhecimento sobre suas contribuições para a sociedade seja pequena ou grande, pois tudo tem seu impacto: <sup class="text-red-500">*</sup>
            </div>

            <CustomTextarea name="adicionais.contribuicoes" />
          </div>
        </template>
      </FolderSection>
      <div class="py-10 flex flex-col justify-center items-center">
        <InvalidInsert
          :show-alert="camposFaltosos"
          text="Campos inválidos ou faltando"
          class="mb-3"
        />

        <CustomButton
          color="emerald"
          type="submit"
        >
          Salvar
        </CustomButton>
      </div>
    </Form>
    <CustomDialog
      v-model="dialogSucesso"
      @close="$router.push('/egresso')"
    >
      <div class="h-full flex justify-center items-center">
        <div class="flex flex-col full items-center justify-center gap-y-3 sm:gap-y-7">
          <div class="text-green-500 text-center">
            <img
              class="w-16 sm:w-24"
              src="../assets/check.svg"
              alt="Loading"
            >
          </div>
          <h1 class="text-blue-900 w-3/4 text-center font-semibold text-2xl sm:text-3xl">
            Dados cadastrados com sucesso!
          </h1>
          <div class="flex flex-row justify-center">
            <CustomButton variant="outlined">
              <SvgIcon
                type="mdi"
                class="inline mr-3 mb-1"
                size="20"
                :path="mdiShareVariant"
              />
              Compartilhar
            </CustomButton>
          </div>
        </div>
      </div>
    </CustomDialog>

    <CustomDialog
      v-model="dialogFalha"
    >
      <div class="h-full flex justify-center items-center">
        <div class="w-1/2">
          <div class="text-red-600 text-center mb-3">
            <SvgIcon
              type="mdi"
              size="100"
              class="inline"
              :path="mdiAlertCircle"
            />
          </div>
          <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
            Falha ao cadastrar os dados
          </h1>
        </div>
      </div>
    </CustomDialog>
  </div>
</template>

<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomTextarea from 'src/components/CustomTextarea.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomButton from 'src/components/CustomButton.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, computed, watch, onMounted } from 'vue'
import { Country, State, City } from 'country-state-city'
import svgPath from 'src/assets/svgPaths.json'
import { object, string, date, boolean } from 'yup'
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool,
  mdiShareVariant,
  mdiAlertCircle
} from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import { useRouter } from 'vue-router'

const router = useRouter()

const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

$store.fetchAll()

const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const camposFaltosos = ref(false)

const pais = ref('')
const estado = ref('')
const area = ref('')
const form = ref<typeof Form | null>(null)

const bools = ref({
  cotista: false,
  bolsista: false,
  posGrad: false,
  palestras: false
})

const selectOpts = ref({
  tipoAluno: ['Graduação', 'Pós-graduação'],
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
  const states = State.getStatesOfCountry(pais.value)
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
  const cities = City.getCitiesOfState(pais.value, estado.value)
  const filteredCities = []

  for (const city of cities) {
    filteredCities.push(city.name)
  }
  return filteredCities
})

async function handleSubmit (values: any) {
  camposFaltosos.value = false
  let cotas: Array<{ id: number }> | null = []

  if (values.academico.cotista.tipos.escola) {
    cotas.push({
      id: 1
    })
  }

  if (values.academico.cotista.tipos.renda) {
    cotas.push({
      id: 2
    })
  }

  if (values.academico.cotista.tipos.raca) {
    cotas.push({
      id: 3
    })
  }

  if (values.academico.cotista.tipos.quilombolaIndigena) {
    cotas.push({
      id: 4
    })
  }

  if (cotas.length === 0) {
    cotas = null
  }

  console.log(values.carreira.area !== 'Desempregado')
  const empresa = values.carreira.area !== 'Desempregado'
    ? {
        areaAtuacao: values.carreira.area,
        faixaSalarialId: values.carreira.faixaSalarial ? parseInt(values.carreira.faixaSalarial) : null,
        setorAtuacao: values.carreira.setor,
        nome: values.carreira.empresa,
        endereco: values.localizacao
      }
    : null

  const titulacao = values.academico.posGrad.value
    ? {
        instituicao: values.academico.posGrad.local,
        curso: values.academico.posGrad.curso
      }
    : null

  const palestras = values.adicionais.palestras
    ? {
        descricao: values.adicionais.assuntosPalestras
      }
    : null

  const status = await $store.cadastrarEgresso({
    nascimento: values.geral.nascimento.toString(),
    generoId: parseInt(values.geral.genero),
    matricula: values.academico.matricula || null,
    cotista: Boolean(values.academico.cotista.value),
    bolsista: Boolean(values.academico.bolsista.value),
    interesseEmPos: Boolean(values.academico.desejaPos),
    lattes: values.geral.lattes || null,
    linkedin: values.geral.linkedin || null,
    posGraduacao: Boolean(values.academico.posGrad.value),
    remuneracaoBolsa: Number(values.academico.bolsista.remuneracao),
    cotas,
    nome: values.geral.nome,
    palestras,
    contribuicao: {
      descricao: values.adicionais.contribuicoes
    },
    depoimento: {
      descricao: values.adicionais.experiencias
    },
    bolsaId: values.academico.bolsista.tipo ? parseInt(values.academico.bolsista.tipo) : null,
    empresa,
    titulacao
  })
  console.log('Staus: ')
  console.log(status)

  if (status !== 201) {
    dialogFalha.value = true
  } else {
    dialogSucesso.value = true
  }
}

function handleFail (e: any) {
  console.log(e)
  camposFaltosos.value = true
}

const schema = object().shape({
  geral: object({
    nome: string().required().trim().matches(/^[A-Za-z]+(?:\s[A-Za-z]+)+$/),
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
    matricula: string().max(12),
    tipoAluno: string(),
    cotista: object({
      value: boolean(),
      tipos: object({
        renda: boolean(),
        escola: boolean(),
        raca: boolean(),
        quilombolaIndigena: boolean()
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
