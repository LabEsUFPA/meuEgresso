<template>
  <div class="flex-1 min-h-screen items-center justify-center bg-neutral-100">
    <div
      class="flex place-items-center justify-between flex-wrap relative w-full h-[335px] pin-t bg-gradient-to-b from-sky-200 to-indigo-200 "
    >
      <!-- <ProfileHead /> -->
      <!-- Head Start-->
      <div class="items-center flex relative w-[7000px] flex-col">
        <div class="flex flex-auto justify-center mt-[-0.25rem] ">
          <img
            class="ml-[200px] mt-[37px] w-[120px] h-[120px] rounded-full"
            src="/src/assets/profile-pic.png"
            alt="Avatar"
          >

          <h1 class="mt-[5px] ml-[100px] ">
            <ButtonEdit
              label="Editar"
              icon-path="/src/assets/edit.svg"
              color="whitesky"
              @toggle="toggleIsInput('profileHead')"
              :is-input="!data.profileHead.isInput"
            />
          </h1>
        </div>
        <h1 class="text-cyan-800 text-xl font-bold mt-5">
          <!-- v-model="data.geral.nome" -->
          <slot v-if="data.geral.nome">
            {{ data.geral.nome }}
          </slot>

          <slot v-else>
            Nome Completo
          </slot>
        </h1>
        <!-- v-model="data.geral.linkedin" -->
        <div class="items-start flex justify-center mt-8 relative gap-[10px]">
          <CustomButtonLink
            label="Linkedin"
            icon-path="/src/assets/linkedin-icon.svg"
            :url="data.geral.linkedin"
            placeholder="https://br.linkedin.com/"
            color="whitesky"
            variant="standard"
            icon-size="25"
          />
          <CustomButtonLink
            label="Lattes"
            icon-path="/src/assets/lattes.svg"
            :url="data.geral.lattes"
            placeholder="https://lattes.cnpq.br/"
            color="whitesky"
            variant="standard"
            icon-size="22"
          />
        </div>
      </div>
    </div>
    <!-- Head End-->
    <div class="w-full mt-[12px]">
      <!-- <ProfileBodyView /> -->
      <!-- Body Start -->
      <div class="container mx-auto p-3 pb-0">
        <form @submit="handleSubmit($event)">
          <FolderSection>
            <template #EditButton>
              <h1 class="relative">
                <!-- Tem q ser o nome do folder atual @toggle="toggleIsInput('"data.label"')"  -->
                <!-- <ButtonEdit

                  @toggle="toggleIsInput('geral')"
                /> -->
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  color="invisiblesky"
                  classimg="sky-600"
                  :has-shadow="false"
                  icon-size="20"
                  @toggle="toggleIsInput('geral')"
                  :is-input="!data.geral.isInput"
                />
              </h1>
            </template>
            <template #title>
              <h1
                class="text-lg text-cyan-800 font-semibold flex flex-row items-center"
              >
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
              <div v-if="!data.geral.isInput">
                <!-- Talvez problema com v-model -->
                <!-- Add um v-if aq pro botão de ativar edição -->
                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  v-model="data.geral.nome"
                  vmodel="data.geral.nome"
                  placeholder="Masculino"
                  label="Gênero"
                  :icon-path="mdiAccount"
                />

                <CustomPerfilData
                  type="email"
                  class="mb-6"
                  v-model="data.geral.email"
                  vmodel="data.geral.email"
                  label="Email"
                  placeholder="marcele@email.com"
                  :icon-path="mdiEmail"
                />

                <CustomPerfilData
                  type="date"
                  class="mb-1"
                  v-model="data.geral.nascimento"
                  vmodel="data.geral.nascimento"
                  label="Data Nascimento"
                  placeholder="01/01/2001"
                  :icon-path="mdiCake"
                />
              </div>

              <div v-else>
                <CustomInput
                  class="mb-5"
                  v-model="data.geral.nome"
                  label="Nome"
                  placeholder="Ex: Marcelle Mota"
                  helper-text="Números e caracteres especiais não são permitidos"
                  :icon-path="mdiAccount"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.geral.nascimento"
                  label="Data de Nascimento"
                  type="date"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.geral.email"
                  label="Email"
                  placeholder="Ex: marcelle.mota.@gov.br"
                  helper-text="Use um email válido: hotmail, outlook, gmail, etc."
                  :icon-path="mdiEmail"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.geral.linkedin"
                  label="Linkedin"
                />

                <CustomInput
                  v-model="data.geral.lattes"
                  label="Curriculo Lattes"
                />
              </div>
            </template>
          </FolderSection>

          <FolderSection class="mt-6">
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  color="invisiblesky"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('localizacao')"
                  :is-input="!data.localizacao.isInput"
                />
              </h1>
            </template>
            <template #title>
              <h1
                class="text-lg text-cyan-800 font-semibold flex flex-row items-center"
              >
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
              <div v-if="!data.localizacao.isInput">
                <!-- <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.localizacao.cep"
                  v-model="data.localizacao.cep"
                  label="CEP"
                  placeholder="00000-000"
                  mask="#####-###"
                  :icon-path="mdiHome"
                /> -->

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.localizacao.pais"
                  v-model="data.localizacao.pais"
                  placeholder="Brasil"
                  label="País"
                  :icon-path="mdiWeb"
                />

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.localizacao.estado"
                  v-model="data.localizacao.estado"
                  label="Estado"
                  placeholder="Pará"
                  :icon-path="mdiMapOutline"
                />

                <CustomPerfilData
                  type="text"
                  class="mb-1"
                  vmodel="data.localizacao.cidade"
                  v-model="data.localizacao.cidade"
                  label="Cidade"
                  placeholder="Belém"
                  :icon-path="mdiMapMarkerRadius"
                />
              </div>
              <div v-else>
                <!-- <CustomInput
                  class="mb-5"
                  v-model="data.localizacao.cep"
                  label="CEP"
                  placeholder="00000-000"
                  mask="#####-###"
                /> -->

                <CustomSelect
                  class="mb-5"
                  v-model="data.localizacao.pais"
                  label="País"
                  :options="selectOpts.pais"
                />

                <CustomSelect
                  class="mb-5"
                  v-model="data.localizacao.estado"
                  label="Estado"
                  :options="selectOpts.estado"
                />

                <CustomSelect
                  v-model="data.localizacao.cidade"
                  label="Cidade"
                  :options="selectOpts.cidade"
                />
              </div>
            </template>
          </FolderSection>

          <FolderSection class="mt-6">
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  url="/Perfil"
                  color="invisiblesky"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('academico')"
                  :is-input="!data.academico.isInput"
                />
              </h1>
            </template>
            <template #title>
              <h1
                class="text-lg text-cyan-800 font-semibold flex flex-row items-center"
              >
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
              <div v-if="!data.academico.isInput">
                <!-- class="mb-1"
            v-model="data.localizacao.cidade"
            label="Cidade"
            placeholder="Belém"
            :icon-path="mdiMapMarkerRadius""
          /> -->
                <CustomPerfilData
                  type="number"
                  class="mb-5"
                  vmodel="data.academico.matricula"
                  v-model="data.academico.matricula"
                  label="Matrícula"
                  placeholder="Selecione"
                  icon-path=""
                />

                <!-- <CustomPerfilData
            class="mb-5"
            v-model="data.academico.email"
            label="Email institucional"
            placeholder="Selecione"
            icon-path=""
          />
          -->
                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.academico.cotista.tipo"
                  v-model="data.academico.cotista.tipo"
                  label="Cota"
                  placeholder="Tipo de cota"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.academico.tipoAluno"
                  v-model="data.academico.tipoAluno"
                  label="Formação"
                  placeholder="Selecione"
                  icon-path=""
                />

                <!-- <CustomPerfilData
            class="mb-5"
            v-model="data.academico.posGrad.tipo"
            label="Tipo de Aluno"
            placeholder="Tipo"
            icon-path=""
          /> -->

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.academico.posGrad.curso"
                  v-model="data.academico.posGrad.curso"
                  label="Curso"
                  placeholder="Curso de pós-graduação"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.academico.posGrad.local"
                  v-model="data.academico.posGrad.local"
                  label="Local da pós-graduação"
                  placeholder="UFPA"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-1"
                  vmodel="data.academico.bolsista.tipo"
                  v-model="data.academico.bolsista.tipo"
                  label="Bolsa"
                  placeholder="Bolsa"
                  icon-path=""
                />

                <!-- <div class="mb-5 text-sm font-semibold text-cyan-600">
                Marque todos as opções que sejam verdadeiras abaixo:
              </div>

              <CustomCheckbox
                class="mb-5"
                v-model="data.academico.cotista.value"
                label="Cotista"
              />

              <CustomInput
                class="mb-5"
                v-model="data.academico.cotista.tipo"
                label="Tipo de Cota"
                placeholder="Selecione"
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
              />

              <CustomInput
                class="mb-5"
                v-model="data.academico.bolsista.remuneracao"
                label="Remuneração da bolsa"
                placeholder="Selecione"
              />

              <CustomCheckbox
                class="mb-5"
                v-model="data.academico.posGrad.value"
                label="Pós-graduação"
              />

              <CustomInput
                class="mb-5"
                v-model="data.academico.posGrad.tipo"
                label="Tipo de pós-graduação"
                placeholder="Selecione"
              />

              <CustomInput
                class="mb-5"
                v-model="data.academico.posGrad.local"
                label="Local da pós-graduação"
                placeholder="Selecione"
              />

              <CustomInput
                v-model="data.academico.posGrad.curso"
                label="Curso de pós-graduação"
                placeholder="Selecione"
              /> -->
              </div>
              <div v-else>
                <CustomInput
                  class="mb-5"
                  v-model="data.academico.matricula"
                  label="Matrícula"
                  placeholder="Selecione"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.academico.email"
                  label="Email institucional"
                  placeholder="Selecione"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.academico.tipoAluno"
                  label="Tipo de Aluno"
                  placeholder="Selecione"
                />

                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Marque todos as opções que sejam verdadeiras abaixo:
                </div>

                <CustomCheckbox
                  class="mb-5"
                  v-model="data.academico.cotista.value"
                  label="Cotista"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.academico.cotista.tipo"
                  label="Tipo de Cota"
                  placeholder="Selecione"
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
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.academico.bolsista.remuneracao"
                  label="Remuneração da bolsa"
                  placeholder="Selecione"
                />

                <CustomCheckbox
                  class="mb-5"
                  v-model="data.academico.posGrad.value"
                  label="Pós-graduação"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.academico.posGrad.tipo"
                  label="Tipo de pós-graduação"
                  placeholder="Selecione"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.academico.posGrad.local"
                  label="Local da pós-graduação"
                  placeholder="Selecione"
                />

                <CustomInput
                  v-model="data.academico.posGrad.curso"
                  label="Curso de pós-graduação"
                  placeholder="Selecione"
                />
              </div>
            </template>
          </FolderSection>

          <FolderSection class="mt-6">
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  color="invisiblesky"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('carreira')"
                  :is-input="!data.carreira.isInput"
                />
              </h1>
            </template>
            <template #title>
              <h1
                class="text-lg text-cyan-800 font-semibold flex flex-row items-center"
              >
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
              <div v-if="!data.carreira.isInput">
                <CustomPerfilData
                  type="text"
                  class="mb-10"
                  vmodel="data.carreira.area"
                  v-model="data.carreira.area"
                  label="Area de Atuação"
                  placeholder="Área"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-10"
                  vmodel="data.carreira.setor"
                  v-model="data.carreira.setor"
                  label="Setor de Atuação"
                  placeholder="Setor"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  vmodel="data.carreira.empresa"
                  v-model="data.carreira.empresa"
                  label="Empresa Atual"
                  placeholder="Empresa"
                  icon-path=""
                />

                <!-- <CustomInput
                class="mb-5"
                v-model="data.carreira.faixaSalarial"
                label="Faixa Salarial"
                placeholder="Selecione"
              />

              <CustomInput
                v-model="data.carreira.remuneracao"
                label="Valor da remuneração mensal"
                placeholder="Selecione"
              /> -->
              </div>
              <div v-else>
                <CustomInput
                  class="mb-5"
                  v-model="data.carreira.area"
                  label="Area de Atuação"
                  placeholder="Selecione"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.carreira.setor"
                  label="Setor de Atuação"
                  placeholder="Selecione"
                />

                <CustomInput
                  class="mb-5"
                  v-model="data.carreira.empresa"
                  label="Empresa"
                  placeholder="Ex: Google"
                />

                <!-- <CustomInput
                  class="mb-5"
                  v-model="data.carreira.faixaSalarial"
                  label="Faixa Salarial"
                  placeholder="Selecione"
                />

                <CustomInput
                  v-model="data.carreira.remuneracao"
                  label="Valor da remuneração mensal"
                  placeholder="Selecione"
                /> -->
              </div>
            </template>
          </FolderSection>

          <FolderSection class="mt-6">
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  color="invisiblesky"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('adicionais')"
                  :is-input="!data.adicionais.isInput"
                />
              </h1>
            </template>
            <template #title>
              <h1
                class="text-lg text-cyan-800 font-semibold flex flex-row items-center"
              >
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
              <div v-if="!data.adicionais.isInput">
                <CustomPerfilData
                  type="text"
                  class="flex-auto mb-5"
                  vmodel="data.adicionais.experiencias"
                  v-model="data.adicionais.experiencias"
                  label="Depoimento"
                  placeholder="Lorem ipsum dolor sit amet, consect
            etur adipiscing elit, sed do eiusmod tempor incididun
            t ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis n
            ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                  icon-path=""
                />
                <CustomPerfilData
                  type="text"
                  class="flex-auto mb-5"
                  vmodel="data.adicionais.contribuicoes"
                  v-model="data.adicionais.contribuicoes"
                  label="Contribuições"
                  placeholder="Lorem ipsum dolor sit amet, consect
            etur adipiscing elit, sed do eiusmod tempor incididun
            t ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis n
            ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                  icon-path=""
                />

                <!-- <textarea
            class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
            v-model="data.adicionais.experiencias"
          /> -->

                <!-- <CustomCheckbox
                v-model="data.adicionais.palestras"
                label="Gostaria de apresentar palestras"
                class="mb-5"
              />

              <div class="mb-5 text-sm font-semibold text-cyan-600">
                Use o campo abaixo para listar aqueles assuntos que melhor você se sente para apresentar palestras:
              </div>

              <textarea
                class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
                v-model="data.adicionais.assuntosPalestras"
              />

              <div class="mb-5 text-sm font-semibold text-cyan-600">
                Use o campo abaixo para de forma simples e resumida  compartilhar com outras pessoas experiências positivas ao realizar o curso:
              </div>

              <textarea
                class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
                v-model="data.adicionais.experiencias"
              />

              <div class="mb-5 text-sm font-semibold text-cyan-600">
                Use o campo abaixo para que todos possam ter conhecimento sobre suas contribuições para a sociedade seja pequena ou grande, pois tudo tem seu impacto:
              </div>

              <textarea
                class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
                v-model="data.adicionais.contribuicoes"
              /> -->
              </div>
              <div v-else>
                <!-- <CustomCheckbox
                v-model="data.adicionais.palestras"
                label="Gostaria de apresentar palestras"
                class="mb-5"
              />

              <div class="mb-5 text-sm font-semibold text-cyan-600">
                Use o campo abaixo para listar aqueles assuntos que melhor você se sente para apresentar palestras:
              </div>

              <textarea
                class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
                v-model="data.adicionais.assuntosPalestras"
              />
            -->
                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Use o campo abaixo para de forma simples e resumida  compartilhar com outras pessoas experiências positivas ao realizar o curso:
                </div>

                <textarea
                  class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
                  v-model="data.adicionais.experiencias"
                />

                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Use o campo abaixo para que todos possam ter conhecimento sobre suas contribuições para a sociedade seja pequena ou grande, pois tudo tem seu impacto:
                </div>

                <textarea
                  class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
                  v-model="data.adicionais.contribuicoes"
                />
              </div>
            </template>
          </FolderSection>
          <div class="py-10 flex flex-row justify-center items-center" />
        </form>
      </div>
      <!-- Body End-->
    </div>
  </div>
</template>

<script setup lang="ts">
// import ProfileHead from 'src/components/ProfileHead.vue'
// import ProfileBodyView from 'src/components/ProfileBodyView.vue'
import CustomButtonLink from 'src/components/CustomButtonLink.vue'
import ButtonEdit from 'src/components/ButtonEdit.vue'
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomPerfilData from 'src/components/CustomPerfilData.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomSelect from 'src/components/CustomSelect.vue'
// import SvgIcon from '@jamescoyle/vue-icon'
// mdiHome CEP,
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool,
  mdiCake,
  mdiWeb,
  mdiMapOutline,
  mdiMapMarkerRadius
} from '@mdi/js'
import { ref } from 'vue'
// const editMode = ref({
//    isInput:{
//     geral:false,
//     localizacao
//    }
//    }
//   })
const data = ref({
  geral: {
    nome: '',
    nascimento: '',
    email: '',
    confirmacaoEmail: '',
    linkedin: '',
    lattes: '',
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
      tipo: ''
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
      curso: ''
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
    isInput: false
  }
})
const selectOpts = ref({
  pais: ['Brasil', 'Espanha', 'Reino Unido', 'China'],
  estado: ['Pará', 'Rio Grande do Norte', 'São Paulo', 'Ceara'],
  cidade: ['Belém', 'Ananideua', 'Natal', 'Fortaleza']
})

const error = ref(false)
const errorMessages = ref({
  senha: 'As senhas informadas são diferentes',
  email: 'Os e-mails informados são diferentes',
  standard: 'Por favor, preencha todos os campos abaixo',
  accessLevel: 'Por favor, informe o nível de acesso',
  registrationLength: 'Matrícula inválida, por favor digite novamente'
})
const errorText = ref('')
const submitSuccess = ref(false)

interface registerData {
  name: string
  registration: string
  email: string
  password: string
  confirmationPassword: string
}

const userRegisterData = ref<registerData>({
  name: '',
  registration: '',
  email: '',
  password: '',
  confirmationPassword: ''
})

const handleSubmit = ($event: Event) => {
  $event.preventDefault()
  if (
    userRegisterData.value.password !== userRegisterData.value.confirmationPassword
  ) {
    errorText.value = String(errorMessages.value.senha)
    error.value = true
  } else if (userRegisterData.value.registration.length < 12) {
    errorText.value = String(errorMessages.value.registrationLength)
    error.value = true
  } else {
    error.value = false
    console.log(userRegisterData.value)
    submitSuccess.value = true
  }
}
function toggleIsInput (FolderLabel: string) {
  console.log('EditMode: ' + FolderLabel)
  switch (FolderLabel) {
    case 'profileHead':
      data.value.profileHead.isInput = !data.value.profileHead.isInput
      break
    case 'geral':
      data.value.geral.isInput = !data.value.geral.isInput
      break
    case 'localizacao':
      data.value.localizacao.isInput = !data.value.localizacao.isInput
      break
    case 'academico':
      data.value.academico.isInput = !data.value.academico.isInput
      break
    case 'carreira':
      data.value.carreira.isInput = !data.value.carreira.isInput
      break
    case 'adicionais':
      data.value.adicionais.isInput = !data.value.adicionais.isInput
  }
}

</script>
<style>
</style>
