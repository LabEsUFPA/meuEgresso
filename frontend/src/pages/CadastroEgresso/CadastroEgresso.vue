<template>
  <div class="container mx-auto p-3 pb-0 mt-10">
    <Form
      ref="form"
      @submit="handleSubmit"
      @invalid-submit="handleFail"
      :validation-schema="schema"
      v-slot="{ values }"
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
              :max-length="100"
              required
            />

            <CustomDatepicker
              class="mb-5"
              name="geral.nascimento"
              type="date"
              label="Data de Nascimento"
              :max-date="eighteenYearsAgo"
              :min-date="minDate"
              :max-length="10"
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
              :max-length="50"
              required
            />

            <CustomInput
              class="mb-5"
              name="geral.linkedin"
              label="LinkedIn"
              :icon-path="svgPath.linkedin"
            />

            <CustomInput
              label="Currículo Lattes"
              name="geral.lattes"
              icon-path="/img/lattesCinza.svg"
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
              placeholder="Ex: 205004940001"
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
              <p
                v-if="values.academico?.cotista.value"
                class="text-sm mt-1 position-absolute display-none mb-5"
              >
                Por favor, marque pelo menos uma das opções abaixo:
              </p>
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
                class="mb-5"
                name="academico.cotista.tipos.quilombolaIndigena"
                label="Quilombola/Indígena"
                :disabled="!bools.cotista"
              />

              <CustomCheckbox
                class="mb-5"
                name="academico.cotista.tipos.pcd"
                label="PCD"
                :disabled="!bools.cotista"
              />
              <p
                v-if="bools.cotista &&
                  !values.academico?.cotista?.tipos?.renda &&
                  !values.academico?.cotista?.tipos?.escola &&
                  !values.academico?.cotista?.tipos?.raca &&
                  !values.academico?.cotista?.tipos?.quilombolaIndigena &&
                  !values.academico?.cotista?.tipos?.pcd"
                class="text-red-500 text-sm mt-1 position-absolute display-none"
              >
                Marque pelo menos uma das opções acima!
              </p>
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
              :max-length="12"
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
              placeholder="Selecione"
              :options="$storeCadastro.instituicoes"
              :required="bools.posGrad"
              :disabled="!bools.posGrad"
              :is-fetching="$storeCadastro.isFetchingUniversidades"
              @typing="$storeCadastro.fetchUniversidadesAsync($event, true)"
              @infinite-scroll="$storeCadastro.fetchMoreUniversidadesAsync"
              infinite
              id="posGradLocal"
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
              placeholder="Selecione"
              :options="$storeCadastro.cursos"
              :required="bools.posGrad"
              :disabled="!bools.posGrad"
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
              label="Desejo realizar pós-graduação"
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
              ref="selectSetor"
              :options="selectOpts.setorAtuacao"
              :required="area !== 'Desempregado'"
              :disabled="area === 'Desempregado'"
            />

            <CustomInput
              class="mb-5"
              name="carreira.empresa"
              label="Empresa"
              placeholder="Google"
              :options="$storeCadastro.empresas"
              :required="area !== 'Desempregado'"
              :disabled="area === 'Desempregado'"
            />

            <CustomSelect
              class="mb-5"
              name="carreira.faixaSalarial"
              label="Faixa Salarial"
              ref="selectFaixa"
              :options="$storeCadastro.faixasSalariais"
              :required="area !== 'Desempregado'"
              :disabled="area === 'Desempregado'"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Localização:
            </div>

            <LocalizacaoSelect
              ref="localizacao"
              spacing="mb-5"
              pais-holder="Selecione"
              estado-holder="Selecione"
              cidade-holder="Selecione"
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
              :max-length="300"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              <p>
                Compartilhe abaixo, de forma simples e resumida, suas experiências positivas ao realizar o curso.<sup
                  class="text-red-500"
                >*</sup>
              </p>
              <span>(max. 300 caracteres)</span>
            </div>

            <CustomInput
              type="textarea"
              class="mb-5"
              name="adicionais.experiencias"
              :max-length="300"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              <p>
                Compartilhe no campo abaixo todas as suas contribuições para a sociedade, sejam elas pequenas ou grandes,
                pois tudo tem impacto.<sup class="text-red-500">*</sup>
              </p>
              <span>(max. 300 caracteres)</span>
            </div>

            <CustomInput
              type="textarea"
              name="adicionais.contribuicoes"
              :max-length="300"
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
        <InvalidInsert
          :text="errorText"
          :show-alert="error"
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
      @close="$route.params.id !== undefined ? $router.push('/painel-admin') : $router.push('/egresso')"
    >
      <div class="h-full flex justify-center items-center">
        <div class="flex flex-col full items-center justify-center gap-y-3 sm:gap-y-7">
          <div class="text-green-500 text-center">
            <img
              class="w-16 sm:w-24"
              src="src/assets/check.svg"
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
              :link="`https://www.linkedin.com/sharing/share-offsite/?url=${baseURL}`"
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

    <CustomDialog v-model="dialogFalha">
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

    <CustomDialog v-model="dialogInstituicao">
      <div class="h-full flex justify-center gap-10 flex-col items-center">
        <div class="text-2xl font-semibold text-cyan-800">
          Cadastrar instituição
        </div>

        <Form
          :validation-schema="instituicaoSchema"
          @submit="handleNewInstituicao"
          class="flex flex-col items-center gap-4"
        >
          <CustomInput
            name="nome"
            label="Nome da instituição de ensino"
            placeholder="Universidade Federal do Pará (UFPA)"
          />

          <CustomButton type="submit">
            Cadastrar
          </CustomButton>
        </Form>
      </div>
    </CustomDialog>

    <CustomDialog v-model="dialogCurso">
      <div class="h-full flex justify-center gap-10 flex-col items-center">
        <div class="text-2xl font-semibold text-cyan-800">
          Cadastrar curso
        </div>

        <Form
          :validation-schema="cursoSchema"
          @submit="handleNewCurso"
          class="flex flex-col items-center gap-4"
        >
          <CustomInput
            name="nome"
            label="Nome da curso"
            placeholder="Engenharia de software"
          />

          <CustomButton type="submit">
            Cadastrar
          </CustomButton>
        </Form>
      </div>
    </CustomDialog>
  </div>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import {
  mdiAccount,
  mdiAlertCircle,
  mdiBriefcase,
  mdiEmail,
  mdiLinkedin,
  mdiMessage,
  mdiSchool,
  mdiTwitter,
  mdiWhatsapp
} from '@mdi/js'
import svgPath from 'src/assets/svgPaths.json'
import CustomButton from 'src/components/CustomButton.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomDatepicker from 'src/components/CustomDatepicker.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import LocalizacaoSelect from 'src/components/LocalizacaoSelect.vue'
import FolderSection from 'src/components/FolderSection.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'
import FotoInput from 'src/pages/CadastroEgresso/components/FotoInput.vue'
import LocalStorage from 'src/services/localStorage'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import { useLoginStore } from 'src/store/LoginStore'
import { Form } from 'vee-validate'
import { computed, onMounted, ref, watch } from 'vue'
import VueScrollTo from 'vue-scrollto'
import { boolean, mixed, object, string } from 'yup'
import { useRoute } from 'vue-router'
import apiEnderecos from 'src/services/apiEnderecos'

const baseURL = window.location.origin
const $storeCadastro = useCadastroEgressoStore()
useLoginStore()
const storage = new LocalStorage()
const $route = useRoute()

$storeCadastro.fetchAll()

const mensagemShare = `🎉%20Acabei%20de%20me%20cadastrar%20na%20plataforma%20Meu%20Egresso,%20se%20cadastre%20também:%0D%0A➡️ ${baseURL}`

const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const dialogInstituicao = ref(false)
const dialogCurso = ref(false)
const camposFaltosos = ref(false)
const missingDigits = ref(0)

const area = ref('')
const temFoto = ref(false)
const form = ref()
const errorText = ref('')
const error = ref(false)

const selectSetor = ref()
const selectFaixa = ref()
const localizacao = ref()

const minDate = ref(new Date(-8640000000000000))
const eighteenYearsAgo = ref(new Date())
eighteenYearsAgo.value.setFullYear(eighteenYearsAgo.value.getFullYear() - 18)

const bools = ref({
  cotista: false,
  bolsista: false,
  posGrad: false,
  palestras: false
})

const selectOpts = ref({
  tipoAluno: ['Graduação', 'Pós-graduação'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Programador', 'Analista', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docência', 'Outros']
})

const compCotista = computed(() => {
  return bools.value.cotista
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

  if (values.academico.cotista.tipos.pcd) {
    cotas.push({
      id: 5
    })
  }

  if (cotas.length === 0) {
    cotas = null
  }

  const empresa = values.carreira.area !== 'Desempregado'
    ? {
        areaAtuacao: values.carreira.area,
        faixaSalarialId: values.carreira.faixaSalarial ? parseInt(values.carreira.faixaSalarial) : null,
        setorAtuacao: values.carreira.setor,
        nome: values.carreira.empresa,
        endereco: {
          pais: await apiEnderecos.getPaisById(values.carreira.pais),
          estado: await apiEnderecos.getEstadoById(values.carreira.estado),
          cidade: await apiEnderecos.getCidadeById(values.carreira.cidade),
          cidadeId: values.carreira.cidade
        }
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

  const isAdm = $route.params.id !== undefined

  // const status = 201

  const status = await $storeCadastro.cadastrarEgresso({
    temFoto: temFoto.value, // false por padrao
    foto: formData
  }, {
    nascimento: values.geral.nascimento,
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
    emprego: empresa,
    titulacao
  }, isAdm, isAdm ? Number($route.params.id) : null)

  if (status !== 201) {
    dialogFalha.value = true
    error.value = true
  } else {
    dialogSucesso.value = true
    const token = storage.getToken()

    if (token !== undefined) {
      storage.setLoggedUser(token)
    }
  }
}

function handleFail (e: any) {
  console.log(e)
  camposFaltosos.value = true

  const incorrectElements = Object.keys(e.errors)
  const el = document.querySelector(`#${incorrectElements[0].replaceAll('.', '-')}`)
  VueScrollTo.scrollTo(el, 800, { offset: -300 })
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
    alert('Curso cadastrado com sucesso.')
    dialogCurso.value = false
  }
}

const instituicaoSchema = object().shape({
  nome: string().required('Insira o nome da instituição')
})

const cursoSchema = object().shape({
  nome: string().required('Insira o nome do curso')
})

const schema = object().shape({
  geral: object({
    foto: mixed().test('fileSize', 'Tamanho do arquivo deve ser menor que 5 MB', (value: any) => {
      return value ? value.size <= 5000000 : true
    }),
    nome: string().required('Campo obrigatório').trim().test('Nome', 'Nome inválido', (value) => {
      if (value) {
        return value?.match(/^[A-Za-zÀ-ÿ]+(?:\s[A-Za-zÀ-ÿ]+)+$/)
      }

      return (typeof value).constructor(true)
    }),
    nascimento: string().required('Campo obrigatório').test('Data', 'Data inválida', (value) => {
      if (value) {
        const date = value.split('/').reverse().join('-')
        const inputDate = new Date(date)

        return inputDate >= minDate.value && inputDate <= eighteenYearsAgo.value
      }
      return true
    }),
    email: string().email('Email inválido').required('Campo obrigatório').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.[a-zA-Z]{2,}))?$/, 'Email inválido'),
    genero: string().required('Campo obrigatório'),
    linkedin: string().notRequired().test('linkedin', 'Link inválido', (value) => {
      if (value) {
        return value?.match(/\bhttps?:\/\/(?:www\.)?(?:br\.)?linkedin\.com\/in\/[\w-]+\/?\b/)
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
  academico: object({
    matricula: string().max(12, 'Valor muito comprido, insira até 12 caracteres').matches(/^(\d{12})?$/),
    tipoAluno: string(),
    cotista: object({
      value: boolean().test('Cotas', 'Marque pelo menos uma das opções acima', (value: any, cotas) => {
        if (value) {
          if (cotas.parent.tipos.renda || cotas.parent.tipos.escola || cotas.parent.tipos.raca || cotas.parent.tipos.quilombolaIndigena || cotas.parent.tipos.pcd) return true
          return false
        }
        return true
      }),
      tipos: object({
        renda: boolean(),
        escola: boolean(),
        raca: boolean(),
        quilombolaIndigena: boolean(),
        pcd: boolean()
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
    }),
    pais: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required('Campo obrigatório') : schema.notRequired()
    }),
    estado: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required('Campo obrigatório') : schema.notRequired()
    }),
    cidade: string().when('area', ([area], schema) => {
      return area !== 'Desempregado' ? schema.required('Campo obrigatório') : schema.notRequired()
    })
  }),
  adicionais: object({
    palestras: boolean(),
    assuntosPalestras: string().when('palestras', ([palestras], schema) => {
      return palestras ? schema.required('Campo obrigatório') : schema.notRequired()
    }),
    experiencias: string(),
    contribuicoes: string()
  })
})

onMounted(async () => {
  // watch(pais, () => {
  //   selectEstado.value.setInitialValues('')
  //   form.value.setFieldTouched('carreira.estado', false)
  // })

  // watch(estado, () => {
  //   selectCidade.value.setInitialValues('')
  //   form.value.setFieldTouched('carreira.cidade', false)
  // })

  watch(compCotista, (_, oldVal) => {
    if (oldVal) {
      ['renda', 'escola', 'raca', 'quilombolaIndigena', 'pcd'].forEach(field => {
        form.value.setFieldValue(`academico.cotista.tipos.${field}`, false)
      })
    }
  })

  watch(area, (newVal) => {
    if (newVal === 'Desempregado') {
      selectSetor.value.setInitialValues('')
      form.value.setFieldTouched('carreira.setor', false)
      selectFaixa.value.setInitialValues('')
      form.value.setFieldTouched('carreira.faixaSalarial', false)
      form.value.setFieldValue('carreira.empresa', '')
      form.value.setFieldTouched('carreira.empresa', false)
      localizacao.value.setPais('')
      localizacao.value.setEstado('')
      localizacao.value.setCidade('')
      form.value.setFieldTouched('carreira.pais', false)
      form.value.setFieldTouched('carreira.estado', false)
      form.value.setFieldTouched('carreira.cidade', false)
    }
  })

  if (storage.has('loggedUser') && $route.params.id === undefined) {
    const userData = JSON.parse(storage.get('loggedUser'))

    form.value.setFieldValue('geral.email', userData.email)
    form.value.setFieldValue('geral.nome', userData.nomeCompleto)
  } else if ($route.params.id !== undefined) {
    const userData = await $storeCadastro.fetchUserData(Number($route.params.id))

    if (typeof userData !== 'number') {
      form.value.setFieldValue('geral.email', userData.email)
      form.value.setFieldValue('geral.nome', userData.nome)
    }
  }
})

const checkRegistrationLength = ($event: Event) => {
  missingDigits.value = 12 - String($event).length
}

onMounted(async () => {
  window.scrollTo(0, 0)
})

</script>
