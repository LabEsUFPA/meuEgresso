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
            <FotoInput
              @upload="temFoto = true"
              @clean="temFoto = false"
              name="geral.foto"
              class="mb-5"
            />

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
              label="Gênero"
              :options="$storeCadastro.generos"
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
              placeholder="Selecione"
              :options="$storeCadastro.tiposBolsa"
              :required="bools.bolsista"
              :disabled="!bools.bolsista"
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

            <CustomInput
              class="mb-5"
              name="academico.posGrad.local"
              label="Instituição da pós-graduação"
              :required="bools.posGrad"
              :disabled="!bools.posGrad"
              id="posGradLocal"
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
              @change="area = $event"
              :options="selectOpts.areaAtuacao"
              required
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
              :options="$storeCadastro.faixasSalariais"
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
              @change="pais = $event"
              required
            />

            <CustomSelect
              class="mb-5"
              name="localizacao.estado"
              label="Estado"
              :options="states"
              v-model:value="estado"
              @change="estado = $event"
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
              <p>
                Descreva abaixo os assuntos nos quais você se sente mais confiante para apresentar palestras.<sup
                  v-if="bools.palestras"
                  class="text-red-500"
                >*</sup>
              </p>
              <span>(max. 300 caracteres)</span>
            </div>

            <CustomInput
              type="textarea"
              class="mb-5"
              name="adicionais.assuntosPalestras"
              :required="bools.palestras"
              :disabled="!bools.palestras"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              <p>Compartilhe abaixo, de forma simples e resumida, suas experiências positivas ao realizar o curso.<sup class="text-red-500">*</sup></p>
              <span>(max. 300 caracteres)</span>
            </div>

            <CustomInput
              type="textarea"
              class="mb-5"
              name="adicionais.experiencias"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              <p>Compartilhe no campo abaixo todas as suas contribuições para a sociedade, sejam elas pequenas ou grandes, pois tudo tem impacto.<sup class="text-red-500">*</sup></p>
              <span>(max. 300 caracteres)</span>
            </div>

            <CustomInput
              type="textarea"
              name="adicionais.contribuicoes"
            />
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
          <div class="flex flex-col items-center justify-center text-lg font-semibold text-blue-900">
            Compartilhar:
          </div>
          <div class="flex flex-row justify-center gap-2">
            <CustomButton
              tag="a"
              link="https://www.linkedin.com/sharing/share-offsite/?url=https://meuegresso.alverad.com.br"
              target="_blank"
            >
              <SvgIcon
                type="mdi"
                :path="mdiLinkedin"
              />
            </CustomButton>

            <CustomButton
              tag="a"
              :link="`https://web.whatsapp.com/send?text=${mensagemShare}`"
              target="_blank"
            >
              <SvgIcon
                type="mdi"
                :path="mdiWhatsapp"
              />
            </CustomButton>

            <CustomButton
              tag="a"
              :link="`https://twitter.com/intent/tweet?text=${mensagemShare}`"
              target="_blank"
            >
              <SvgIcon
                type="mdi"
                :path="mdiTwitter"
              />
            </CustomButton>

            <CustomButton
              tag="a"
              :link="`https://t.me/share/url?url=${mensagemShare}`"
              target="_blank"
            >
              <div class="p-[2px]">
                <img
                  src="src/assets/telegram.svg"
                  width="20"
                  alt="Ícone do Telegram"
                >
              </div>
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
import FotoInput from 'src/components/FotoInput.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, computed, watch, onMounted } from 'vue'
import { Country, State, City } from 'country-state-city'
import svgPath from 'src/assets/svgPaths.json'
import { object, string, boolean, mixed } from 'yup'
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool,
  mdiAlertCircle,
  mdiLinkedin,
  mdiWhatsapp,
  mdiTwitter
} from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import { useLoginStore } from 'src/store/LoginStore'
const baseURL = import.meta.env.VITE_API_URL_LOCAL

const $storeCadastro = useCadastroEgressoStore()
useLoginStore()
const storage = new LocalStorage()

$storeCadastro.fetchAll()

const mensagemShare = `🎉%20Acabei%20de%20me%20cadastrar%20na%20plataforma%20Meu%20Egresso,%20se%20cadastre%20também:%0D%0A➡️ ${baseURL}`

const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const camposFaltosos = ref(false)
const missingDigits = ref(0)

const pais = ref('')
const estado = ref('')
const area = ref('')
const temFoto = ref(false)
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

  const formData = new FormData()
  formData.append('arquivo', values.geral.foto)

  const status = await $storeCadastro.cadastrarEgresso({
    temFoto: temFoto.value, // false por padrao
    foto: formData
  }, {
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
    foto: mixed().test('fileSize', 'Tamanho do arquivo deve ser menor que 5 MB', (value: any) => {
      return value ? value.size <= 5000000 : true
    }),
    nome: string().required('Campo obrigatório').trim().test('Nome', 'Nome inválido', (value) => {
      if (value) {
        return value?.match(/^[A-Za-z]+(?:\s[A-Za-z]+)+\s*$/)
      }

      return (typeof value).constructor(true)
    }),
    nascimento: string().required('Campo obrigatório').test('Data', 'Data inválida', (value) => {
      if (value) {
        const date = value.split('/').reverse().join('-')
        const minDate = new Date('1940-01-01')
        const maxDate = new Date('2023-12-31')
        const inputDate = new Date(date)

        const eighteenYearsAgo = new Date()
        eighteenYearsAgo.setFullYear(eighteenYearsAgo.getFullYear() - 18)

        return inputDate >= minDate && inputDate <= maxDate && inputDate <= eighteenYearsAgo
      }
      return true
    }),
    email: string().email('Email inválido').required('Campo obrigatório').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))$/, 'Email inválido'),
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
    matricula: string().max(12, 'Valor muito comprido, insira até 12 caracteres').matches(/^(\d{12})?$/),
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
  const estadoInput = document.querySelector('.localizacao-estado') as HTMLInputElement
  const cidadeInput = document.querySelector('.localizacao-cidade') as HTMLInputElement
  watch(pais, () => {
    form.value?.setFieldValue('localizacao.cidade', '')
    form.value?.setFieldValue('localizacao.estado', '')
    setTimeout(() => {
      estadoInput.value = ''
      cidadeInput.value = ''
    }, 10)
  })

  watch(estado, () => {
    form.value?.setFieldValue('localizacao.cidade', '')
    setTimeout(() => {
      cidadeInput.value = ''
    }, 10)
  })

  if (storage.has('loggedUser')) {
    const userData = JSON.parse(storage.get('loggedUser'))

    form.value?.setFieldValue('geral.email', userData.email)
    form.value?.setFieldValue('geral.nome', userData.nomeCompleto)
  }
})

const checkRegistrationLength = ($event: Event) => {
  missingDigits.value = 12 - String($event).length
}

onMounted(() => {
  window.scrollTo(0, 0)
})

</script>
