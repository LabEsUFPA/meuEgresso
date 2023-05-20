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

      <FolderGeral />

      <FolderAcademico />

      <FolderCarreira />

      <FolderLocalizacao />

      <FolderAdicionais />

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
import { object, string, boolean } from 'yup'
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool,
  mdiCheckCircle,
  mdiShareVariant,
  mdiAlertCircle
} from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import FolderGeral from 'src/components/FolderGeral.vue'
import FolderAcademico from 'src/components/FolderAcademico.vue'
import FolderCarreira from 'src/components/FolderCarreira.vue'
import FolderLocalizacao from 'src/components/FolderLocalizacao.vue'
import FolderAdicionais from 'src/components/FolderAdicionais.vue'

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
    nome: string().required('Campo obrigatório').test('Nome', 'Nome inválido', (value) => {
      if (value) {
        return value?.match(/^[A-Za-z]+(?:\s[A-Za-z]+)+\s*$/)
      }

      return (typeof value).constructor(true)
    }),
    nascimento: string().required('Campo obrigatório'),
    email: string().email('Email inválido').required('Campo obrigatório'),
    genero: string().required('Campo obrigatório'),
    linkedin: string().notRequired().test('linkedin', 'Link inválido', (value) => {
      if (value) {
        return value?.match(/https?:\/\/(?:www\.)?br\.linkedin\.com\/in\/[a-zA-Z0-9-]+\/*/)
      }

      return (typeof value).constructor(true)
    }),
    lattes: string().notRequired().test('lattes', 'Link inválido', (value) => {
      if (value) {
        return value?.match(/(https?:\/\/)?(www\.)?lattes\.cnpq\.br\/(\d+)/)
      }

      return (typeof value).constructor(true)
    })
  }),
  localizacao: object({
    pais: string().required('Campo obrigatório'),
    estado: string().required('Campo obrigatório'),
    cidade: string().required('Campo obrigatório')
  }),
  academico: object({
    matricula: string().max(12, 'Valor muito comprido, insira até 12 caracteres'),
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
        return value ? schema.required('Campo obrigatório') : schema.notRequired()
      }),
      remuneracao: string().when('value', ([value], schema) => {
        return value ? schema.required('Campo obrigatório') : schema.notRequired()
      })
    }),
    posGrad: object({
      value: boolean(),
      local: string().when('value', ([value], schema) => {
        return value ? schema.required('Campo obrigatório') : schema.notRequired()
      }),
      curso: string().when('value', ([value], schema) => {
        return value ? schema.required('Campo obrigatório') : schema.notRequired()
      })
    }),
    desejaPos: boolean()
  }),
  carreira: object({
    area: string().required('Campo obrigatório'),
    setor: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required('Campo obrigatório') : schema.notRequired()
    }),
    empresa: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required('Campo obrigatório') : schema.notRequired()
    }),
    faixaSalarial: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required('Campo obrigatório') : schema.notRequired()
    })
  }),
  adicionais: object({
    palestras: boolean(),
    assuntosPalestras: string().when('palestras', ([palestras], schema) => {
      return palestras ? schema.required('Campo obrigatório') : schema.notRequired()
    }),
    experiencias: string().required('Campo obrigatório'),
    contribuicoes: string().required('Campo obrigatório')
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
