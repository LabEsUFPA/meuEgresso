<template>
  <div
    v-if="loading"
    class="flex items-center justify-center text-center"
  >
    <img
      class="animate-spin mr-3 max-w-[100px]"
      src="../assets/loading.svg"
      alt="Loading"
    >
  </div>
  <div
    v-else
    class="flex-1 min-h-screen items-center justify-center bg-neutral-100"
  >
    <div
      class="flex place-items-center justify-between flex-wrap relative w-full h-[335px] pin-t bg-gradient-to-b from-sky-200 to-indigo-200 "
    >
      <!-- Head Start -->
      <div class="items-center flex relative w-[7000px] flex-col">
        <Form
          ref="formHeader"
          @submit="handleSubmitHeader"
          @invalid-submit="onInvalid"
          :validation-schema="schemaHeader"
        >
          <h1 class="absolute ml-[220px] sm:ml-[270px] md:ml-[300px] mr-1 ">
            <ButtonEdit
              label="Editar"
              icon-path="/src/assets/edit.svg"
              icon-path2="/src/assets/wcheck.svg"
              color="whitesky"
              color2="emerald"
              @toggle="toggleIsInput('profileHead')"
              :is-input="dataEgresso.profileHead.isInput"
              v-if="!isPublic"
            />
          </h1>
          <div class="flex flex-auto justify-center mt-[-0.25rem] ">
            <div
              class="mt-[37px] flex flex-col items-center justify-center"
            >
              <ProfileImage
                ref="profileImageRef"
                @imageUploadBack="profileImageSave"
                @remove="removeImageEgresso"
                :img-url="dataEgresso.profileHead.image"
                img-default="/src/assets/profile-pic.png"
                :is-input="dataEgresso.profileHead.isInput"
                :trigger-back-upload="dataEgresso.profileHead.isInput"
              />
            </div>
          </div>
          <div class="head">
            <h1 class="grid place-items-center text-cyan-800 text-xl font-bold mt-5 ">
              <div v-if="!dataEgresso.profileHead.isInput">
                <slot v-if="dataEgresso.profileHead.nome">
                  {{ dataEgresso.profileHead.nome }}
                </slot>

                <slot v-else>
                  Nome Completo
                </slot>
              </div>

              <div
                v-else
                class="mb-[-35px]  ml-7"
              >
                <CustomInput
                  class="mb-5"
                  name="geral.nome"
                  :value="dataEgresso.profileHead.nome"
                  label=""
                  placeholder="Ex: Marcelle Mota"
                  :icon-path="mdiAccount"
                />
              </div>
            </h1>
            <div
              v-if="!dataEgresso.profileHead.isInput"
              class="items-start flex justify-center mt-8 relative gap-[10px]"
            >
              <CustomButtonLink
                label="Linkedin"
                icon-path="/src/assets/linkedin-icon.svg"
                :url="dataEgresso.profileHead.linkedin"
                placeholder="https://br.linkedin.com/"
                color="whitesky"
                variant="standard"
                icon-size="25"
              />

              <CustomButtonLink
                label="Lattes"
                icon-path="/src/assets/lattesP.svg"
                :url="dataEgresso.profileHead.lattes"
                placeholder="https://lattes.cnpq.br/"
                color="whitesky"
                variant="standard"
                icon-size="22"
              />
            </div>
            <div
              v-else
              class="items-start flex justify-center mt-8 relative gap-[10px]"
            >
              <CustomButtonLink
                label="Linkedin"
                icon-path="/src/assets/linkedin-icon.svg"
                :url="dataEgresso.profileHead.linkedin"
                placeholder="https://br.linkedin.com/"
                color="whitesky"
                variant="standard"
                icon-size="25"
                mode="input"
              >
                <template #input>
                  <CustomInput
                    class="mr-[-5px]"
                    label=""
                    input-class="w-[150px] h-[31px] "
                    :icon-path="mdiLinkVariant"
                    name="geral.linkedin"
                    :value="dataEgresso.profileHead.linkedin"
                  />
                </template>
              </CustomButtonLink>

              <CustomButtonLink
                label="Lattes"
                icon-path="/src/assets/lattesP.svg"
                :url="dataEgresso.profileHead.lattes"
                placeholder="https://lattes.cnpq.br/"
                color="whitesky"
                variant="standard"
                icon-size="22"
                mode="input"
              >
                <template #input>
                  <CustomInput
                    class="mr-[-5px]"
                    input-class="w-[150px] h-[31px]"
                    label=""
                    :icon-path="mdiLinkVariant"
                    name="geral.lattes"
                    :value="dataEgresso.profileHead.lattes"
                  />
                </template>
              </Custombuttonlink>
            </div>
          </div>
        </Form>
      </div>
    </div>
    <!-- Head End-->
    <div class="w-full mt-[12px]">
      <!-- Body Start -->
      <div class="container mx-auto p-3 pb-0">
        <Form
          ref="formGeral"
          @submit="handleSubmitGeral"
          @invalid-submit="onInvalid"
          :validation-schema="schemaGeral"
        >
          <FolderSection>
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  icon-path2="/src/assets/wcheck.svg"
                  color="invisiblesky"
                  color2="emerald"
                  classimg="sky-600"
                  :has-shadow="false"
                  icon-size="20"
                  @toggle="toggleIsInput('geral')"
                  :is-input="dataEgresso.geral.isInput"
                  v-if="!isPublic"
                />
              </h1>
            </template>
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
              <div v-if="!dataEgresso.geral.isInput">
                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  name="dataEgresso.geral.genero"
                  :vmodel="dataEgresso.geral.genero"
                  placeholder="Masculino"
                  label="Gênero"
                  :icon-path="mdiAccount"
                />

                <CustomPerfilData
                  type="email"
                  class="mb-6"
                  name="geral.email"
                  :vmodel="dataEgresso.geral.email"
                  label="E-mail"
                  placeholder="marcele@email.com"
                  :icon-path="mdiEmail"
                  v-if="!isPublic"
                />
                <CustomPerfilData
                  type="date"
                  class="mb-1"
                  name="geral.nascimento"
                  :vmodel="dataEgresso.geral.nascimento.split('-').reverse().join('/')"
                  label="Data de Nascimento"
                  placeholder="01/01/2001"
                  :icon-path="mdiCake"
                />
              </div>

              <div v-else>
                <CustomSelect
                  class="mb-5"
                  name="geral.genero"
                  :placeholder="dataEgresso.geral.genero"
                  label="Gênero"
                  :options="$store.generos"
                  required
                />

                <CustomInput
                  class="mb-5"
                  name="geral.email"
                  label="E-mail"
                  placeholder="Ex: marcelle.mota.@gov.br"
                  helper-text="Use um email válido: hotmail, outlook, gmail, etc."
                  :icon-path="mdiEmail"
                  required
                />
                <CustomInput
                  class="mb-5"
                  name="geral.nascimento"
                  :value="dataEgresso.geral.nascimento"
                  label="Data de Nascimento"
                  type="date"
                />
              </div>
            </template>
          </FolderSection>
        </Form>
        <Form
          ref="formAcademico"
          @submit="handleSubmitAcademico"
          @invalid-submit="onInvalid"
          :validation-schema="schemaAcademico"
        >
          <FolderAcademico
            :is-input="dataEgresso.academico.isInput"
            :bools="bools"
            :bolsa-holder="placeHolders.bolsaNome"
          >
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  icon-path2="/src/assets/wcheck.svg"
                  color="invisiblesky"
                  color2="emerald"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('academico')"
                  :is-input="dataEgresso.academico.isInput"
                  v-if="!isPublic"
                />
              </h1>
            </template>
            <template #NonInputData>
              <CustomPerfilData
                type="number"
                class="mb-5"
                :vmodel="dataEgresso.academico.matricula"
                name="academico.matricula"
                label="Matrícula"
                placeholder="205004940001"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-5"
                :vmodel="dataEgresso.academico.cotista.tipo"
                name="academico.cotista.tipo"
                label="Cotas"
                placeholder="Tipo de cota"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-5"
                :vmodel="dataEgresso.academico.tipoAluno"
                name="academico.tipoAluno"
                label="Formação"
                placeholder="Selecione"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-5"
                :vmodel="dataEgresso.academico.posGrad.curso"
                name="academico.posGrad.curso"
                label="Curso"
                placeholder="Curso de pós-graduação"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-5"
                :vmodel="dataEgresso.academico.posGrad.local"
                name="academico.posGrad.local"
                label="Local da pós-graduação"
                placeholder="Local da pós-graduação"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-1"
                :vmodel="dataEgresso.academico.bolsista.tipo"
                name="academico.bolsista.tipo"
                label="Bolsa"
                placeholder="Bolsa"
                icon-path=""
              />
            </template>
          </FolderAcademico>
        </Form>
        <Form
          ref="formCarreira"
          @submit="handleSubmitCarreira"
          @invalid-submit="onInvalid"
          :validation-schema="schemaCarreira"
        >
          <FolderCarreira
            :is-input="dataEgresso.carreira.isInput"
            :area-atuacao-holder="placeHolders.areaAtuacao"
            :setor-atuacao-holder="placeHolders.setorAtuacao"
            :faixa-salarial-holder="placeHolders.faixaSalarial"
          >
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/src/assets/edit.svg"
                  icon-path2="/src/assets/wcheck.svg"
                  color="invisiblesky"
                  color2="emerald"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('carreira')"
                  :is-input="dataEgresso.carreira.isInput"
                  v-if="!isPublic"
                />
              </h1>
            </template>
            <template #NonInputData>
              <CustomPerfilData
                type="text"
                class="mb-10"
                :vmodel="dataEgresso.carreira.area"
                name="carreira.area"
                label="Área de Atuação"
                placeholder="Área"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-10"
                :vmodel="dataEgresso.carreira.setor"
                name="carreira.setor"
                label="Setor de Atuação"
                placeholder="Setor"
                icon-path=""
              />

              <CustomPerfilData
                type="text"
                class="mb-5"
                :vmodel="dataEgresso.carreira.empresa"
                name="carreira.empresa"
                label="Empresa Atual"
                placeholder="Empresa"
                icon-path=""
              />
            </template>
          </FolderCarreira>

          <Form
            ref="formLocalizacao"
            @submit="handleSubmitLocalizacao"
            @invalid-submit="onInvalid"
            :validation-schema="schemaLocalizacao"
          >
            <FolderLocalizacao
              :is-input="dataEgresso.localizacao.isInput"
              :pais-holder="Country.getCountryByCode(dataEgresso.localizacao.pais)?.name"
              :estado-holder="State.getStateByCodeAndCountry(dataEgresso.localizacao.estado, dataEgresso.localizacao.pais)?.name"
              :cidade-holder="dataEgresso.localizacao.cidade"
            >
              <template #EditButton>
                <h1 class="relative">
                  <ButtonEdit
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    icon-path2="/src/assets/wcheck.svg"
                    color="invisiblesky"
                    color2="emerald"
                    classimg="sky-600"
                    :has-shadow="false"
                    @toggle="toggleIsInput('localizacao')"
                    :is-input="dataEgresso.localizacao.isInput"
                    v-if="!isPublic"
                  />
                </h1>
              </template>
              <template #NonInputData>
                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  :vmodel="Country.getCountryByCode(dataEgresso.localizacao.pais)?.name"
                  name="localizacao.pais"
                  placeholder="Brasil"
                  label="País"
                  :icon-path="mdiWeb"
                />

                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  :vmodel="State.getStateByCodeAndCountry(dataEgresso.localizacao.estado, dataEgresso.localizacao.pais)?.name"
                  name="localizacao.estado"
                  label="Estado"
                  placeholder="Pará"
                  :icon-path="mdiMapOutline"
                />

                <CustomPerfilData
                  type="text"
                  class="mb-1"
                  :vmodel="dataEgresso.localizacao.cidade"
                  name="localizacao.cidade"
                  label="Cidade"
                  placeholder="Belém"
                  :icon-path="mdiMapMarkerRadius"
                />
              </template>
            </FolderLocalizacao>
          </Form>
          <Form
            ref="formAdicionais"
            @submit="handleSubmitAdicionais"
            @invalid-submit="onInvalid"
            :validation-schema="schemaAdicionais"
          >
            <FolderAdicionais
              :is-input="dataEgresso.adicionais.isInput"
              :bools="bools"
            >
              <template #EditButton>
                <h1 class="relative">
                  <ButtonEdit
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    icon-path2="/src/assets/wcheck.svg"
                    color="invisiblesky"
                    color2="emerald"
                    classimg="sky-600"
                    :has-shadow="false"
                    @toggle="toggleIsInput('adicionais')"
                    :is-input="dataEgresso.adicionais.isInput"
                    v-if="!isPublic"
                  />
                </h1>
              </template>
              <template #NonInputData>
                <!-- <CustomPerfilData
                      type="text"
                      class="flex-auto mb-5"
                      :vmodel="dataEgresso.adicionais.assuntosPalestras"
                      name="adicionais.assuntosPalestras"
                      label="Palestras"
                      placeholder="Lorem ipsum dolor sit amet, consect
                  etur adipiscing elit, sed do eiusmod tempor incididun
                  t ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis n
                  ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                      icon-path=""
                    /> -->
                <!-- <CustomPerfilData
                      type="text"
                      class="flex-auto mb-5"
                      :vmodel="dataEgresso.adicionais.assuntosPalestras"
                      name="adicionais.assuntosPalestras"
                      label="Palestras"
                      placeholder="Lorem ipsum dolor sit amet, consect
                  etur adipiscing elit, sed do eiusmod tempor incididun
                  t ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis n
                  ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                      icon-path=""
                    /> -->
                <CustomPerfilData
                  type="text"
                  class="flex-auto mb-5"
                  :vmodel="dataEgresso.adicionais.experiencias"
                  name="adicionais.experiencias"
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
                  :vmodel="dataEgresso.adicionais.contribuicoes"
                  name="adicionais.contribuicoes"
                  label="Contribuições"
                  placeholder="Lorem ipsum dolor sit amet, consect
                  etur adipiscing elit, sed do eiusmod tempor incididun
                  t ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis n
                  ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                  icon-path=""
                />
              </template>
            </FolderAdicionais>

            <div class="py-10 flex flex-row justify-center items-center" />
          </Form>
        </form>
      </div>
    <!-- Body End-->
    </div>
    <!-- </div> -->
    <CustomDialog v-model="dialogSucesso">
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
            Dados Atualizados com sucesso!
          </h1>
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
            Falha ao atualizar os dados
          </h1>
        </div>
      </div>
    </CustomDialog>
  </div>
</template>

<script setup lang="ts">
import CustomButtonLink from 'src/components/CustomButtonLink.vue'
import ButtonEdit from 'src/components/ButtonEdit.vue'
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomPerfilData from 'src/components/CustomPerfilData.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomSelect from 'src/components/CustomSelect.vue'
import { Country, State, City } from 'country-state-city'
import { computed, ref, watch, onMounted } from 'vue'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import { Form } from 'vee-validate'
import { object, string, mixed, boolean } from 'yup'
import LocalStorage from 'src/services/localStorage'
import { useLoginStore } from 'src/store/LoginStore'
import CustomDialog from 'src/components/CustomDialog.vue'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import FolderAcademico from 'src/components/FolderAcademico.vue'
import FolderCarreira from 'src/components/FolderCarreira.vue'
import FolderLocalizacao from 'src/components/FolderLocalizacao.vue'
import FolderAdicionais from 'src/components/FolderAdicionais.vue'
import ProfileImage from 'src/components/ProfileImage.vue'
import {
  mdiAccount,
  mdiEmail,
  mdiCake,
  mdiWeb,
  mdiMapOutline,
  mdiMapMarkerRadius,
  mdiLinkVariant,
  mdiCheckCircle,
  mdiAlertCircle
} from '@mdi/js'
import { useRoute } from 'vue-router'
const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const $route = useRoute()
const $store = useCadastroEgressoStore()
const egressoStore = usePerfilEgressoStore()

$store.fetchAll()
const storage = new LocalStorage()
const formHeader = ref<typeof Form | null>(null)
const formGeral = ref<typeof Form | null>(null)
const formAcademico = ref<typeof Form | null>(null)
const formCarreira = ref<typeof Form | null>(null)
const formLocalizacao = ref<typeof Form | null>(null)
const formAdicionais = ref<typeof Form | null>(null)

const isPublic = computed(() => {
  if (Object.keys($route.params).length === 1 && dataEgresso.value.egressoId !== Number($route.params?.id)) {
    return true
  } else {
    return false
  }
})

function handleStatus (status: any) {
  if (status !== 201) {
    dialogFalha.value = true
    return false
  } else {
    dialogSucesso.value = true
    return true
  }
}
const profileImageRef = ref<typeof ProfileImage | null>(null)
const profileImageSave = () => {
  return profileImageRef?.value?.imageUploadBack()
}
async function handleSubmitHeader (values: any) {
  jsonResponse.usuario.nome = values.geral.nome
  if(values.geral.linkedin !== '' && values.geral.linkedin !== undefined){
    jsonResponse.linkedin = values.geral.linkedin
  }
  else{
    jsonResponse.linkedin = null
  }
  if(values.geral.lattes !== '' && values.geral.lattes !== undefined){
    console.log(jsonResponse.lattes);
    jsonResponse.lattes = values.geral.lattes
  }
  else{
    jsonResponse.lattes = null
  }
  
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  const responseImage = await profileImageSave()
  // console.log(status)
  // console.log(responseImage)

  if (status === 201 && responseImage === 201) {
    dialogSucesso.value = true
    await useLoginStore().saveUser()

    toggleIsInput('profileHead')
    fetchUpdateEgresso()
    fetchUpdateEgresso()
  } else {
    dialogFalha.value = true
  }
}

async function handleSubmitGeral (values: any) {
  jsonResponse.usuario.email = values.geral.email
  // ID request
  jsonResponse.genero.id = values.geral.genero
  jsonResponse.nascimento = values.geral.nascimento
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    await useLoginStore().saveUser()
    toggleIsInput('geral')
  }

  fetchUpdateEgresso()
}

async function handleSubmitAcademico (values: any) {
  const cotas: Array<{ id: number }> | null = []
  if (values.academico.cotista.value) {
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
  }

  jsonResponse.posGraduacao = values.academico.posGrad.value
  if (!values.academico.posGrad.value) {
    jsonResponse.interesseEmPos = values.academico.posGrad.desejaPos
    jsonResponse.titulacao = null
  } else {
    jsonResponse.interesseEmPos = false

    if (jsonResponse.titulacao === undefined) {
      const titulacao = {
        id: {
          egressoId: jsonResponse.id,
          titulacaoId: 2
        },
        curso: {
          id: 1,
          nome: values.academico.posGrad.curso
        },
        empresa: {
          id: 1,
          nome: values.academico.posGrad.local

        },
        titulacao: {
          id: 2
        }
      }
      jsonResponse.titulacao = titulacao
    } else {
      jsonResponse.titulacao.empresa.nome = values.academico.posGrad.local
      jsonResponse.titulacao.curso.nome = values.academico.posGrad.curso
    }
  }

  jsonResponse.matricula = values.academico.matricula

  jsonResponse.cotista = values.academico.cotista.value

  jsonResponse.bolsista = values.academico.bolsista.value

  jsonResponse.cotas = cotas

  const bolsa = {
    id: values.academico.bolsista.tipo
  }
  if (values.academico.bolsista.value) {
    jsonResponse.bolsa = bolsa
    // jsonResponse.bolsa.id = values.academico.bolsista.tipo
    jsonResponse.remuneracaoBolsa = values.academico.bolsista.remuneracao
  } else {
    jsonResponse.bolsa = null
    jsonResponse.remuneracaoBolsa = 0
  }

  const status = await egressoStore.atualizarEgresso(jsonResponse)

  if (handleStatus(status)) {
    toggleIsInput('academico')
  }

  fetchUpdateEgresso()
}
async function handleSubmitLocalizacao (values: any) {
  jsonResponse.emprego.empresa.endereco.pais = values.localizacao.pais
  jsonResponse.emprego.empresa.endereco.estado = values.localizacao.estado
  jsonResponse.emprego.empresa.endereco.cidade = values.localizacao.cidade
  // delete jsonResponse.emprego.empresa.endereco.id

  const status = await egressoStore.atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('localizacao')
  }

  fetchUpdateEgresso()
}
async function handleSubmitCarreira (values: any) {
  if (jsonResponse.emprego === undefined) {
    jsonResponse.emprego = {
      id: {
        egressoId: jsonResponse.id,
        empresaId: 1
      },
      setorAtuacao: {
        id: 1,
        nome: ''
      },
      areaAtuacao: {
        id: 1,
        nome: ''
      },
      faixaSalarial: {
        id: 2

      },
      empresa: {
        id: 1,
        nome: '',
        endereco: {
          id: 6,
          cidade: '',
          estado: '',
          pais: ''
        },
        faixaSalarial: {
          id: 2
        }

      }

    }
  }
  if (values.carreira.area !== 'Desempregado') {
    jsonResponse.emprego.empresa.nome = values.carreira.empresa
    jsonResponse.emprego.setorAtuacao.nome = values.carreira.setor
    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    jsonResponse.emprego.faixaSalarial.id = values.carreira.faixaSalarial

  } else {
    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    jsonResponse.emprego = null
  }

  const status = await egressoStore.atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('carreira')
  }

  fetchUpdateEgresso()
}
async function handleSubmitAdicionais (values: any) {
  jsonResponse.depoimento.descricao = values.adicionais.experiencias
  jsonResponse.contribuicao.descricao = values.adicionais.contribuicoes
  if (values.adicionais.palestras) {
    jsonResponse.palestras.descricao = values.adicionais.assuntosPalestras
  } else {
    jsonResponse.palestras.descricao = ''
  }
  egressoStore.atualizarEgresso(jsonResponse)
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('adicionais')
  }
  fetchUpdateEgresso()
}

let isInputLocal = false
function toggleIsInput (FolderLabel: string) {
  switch (FolderLabel) {
    case 'profileHead':
      dataEgresso.value.profileHead.isInput = !dataEgresso.value.profileHead.isInput

      break
    case 'geral':
      dataEgresso.value.geral.isInput = !dataEgresso.value.geral.isInput

      break
    case 'localizacao':
      dataEgresso.value.localizacao.isInput = !dataEgresso.value.localizacao.isInput

      break
    case 'academico':
      dataEgresso.value.academico.isInput = !dataEgresso.value.academico.isInput

      break
    case 'carreira':
      dataEgresso.value.carreira.isInput = !dataEgresso.value.carreira.isInput

      break
    case 'adicionais':
      dataEgresso.value.adicionais.isInput = !dataEgresso.value.adicionais.isInput
  }

  isInputLocal = !isInputLocal
}

//

const selectOpts = ref({
  genero: ['Masculino', 'Feminino', 'Não-Binário', 'Transsexual'],
  tipoAluno: ['Graduação', 'Pós-graduação'],
  tipoCota: ['Escola', 'Renda', 'Autodeclaração de Raça', 'Quilombola/Indígena'],
  tipoBolsa: ['PIBIC', 'PROAD', 'PROEX', 'Permanência', 'Outros'],
  areaAtuacao: ['Computação', 'Pesquisa', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docencia', 'Outros']
})
function onInvalid (e: any) {
  // updateEgressoDataModel(e)
  // console.log(e)
}

const dataEgresso = ref({
  egressoId: 0,
  generoId: 0,
  bolsaId: 0,
  areaAtuacaoId: 0,
  faixaSalarialId: 0,
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
    isInput: false,
    triggerBackUpload: false,
    image: ''
  }
})
const bools = ref({
  cotista: true,
  bolsista: true,
  posGrad: true,
  palestras: true
})
const placeHolders = ref({
  bolsaNome: dataEgresso.value.academico.bolsista.tipo,
  areaAtuacao: dataEgresso.value.carreira.area,
  setorAtuacao: dataEgresso.value.carreira.setor,
  faixaSalarial: dataEgresso.value.carreira.faixaSalarial
})

const loading = ref(true)
watch(() => dataEgresso.value.egressoId, () => {
  if (dataEgresso.value.egressoId !== 0) {
    loading.value = false
    fetchUpdateEgresso()
  }
})

let jsonResponse: any
let userData: any
let egressoResponseBack: any

let egressoImageResponse : any
let imageEgressoUrl: string
imageEgressoUrl = ''
async function handleEgressoImage (id : string) {
  egressoImageResponse = await egressoStore.fetchImageEgressoUrl(id)
  imageEgressoUrl = egressoImageResponse
  // console.log('URL:')
  // console.log(imageEgressoUrl)
  if (imageEgressoUrl === '') {
    return ''
  } else {
    return imageEgressoUrl
  }
}

async function fetchUpdateEgresso () {
  if (storage.has('loggedUser')) {
    userData = JSON.parse(storage.get('loggedUser'))
    // getEgresso
    if (isPublic.value) {
      egressoResponseBack = fetchPublicEgresso(Number($route.params?.id))
    } else {
      egressoResponseBack = fetchEgresso()
    }
  }

  const ResponseBack = await egressoResponseBack
  
  const json = JSON.parse(ResponseBack)

  jsonResponse = json

  // Cotas
  let cotasEgresso = ''
  imageEgressoUrl = await handleEgressoImage(json.id)

  for (let i = 0; i < json.cotas.length; i++) {
    cotasEgresso += selectOpts.value.tipoCota[json.cotas[i].id - 1] + '\n'
  }

  dataEgresso.value = {
    egressoId: json.id,
    generoId: json.genero.id,
    bolsaId: json.bolsa?.id,
    areaAtuacaoId: json.emprego?.areaAtuacao?.id,
    faixaSalarialId: json.emprego?.faixaSalarial?.id,
    grupos: [''],

    geral:
    {
      email: json.usuario.email,
      genero: json.genero.nome,
      confirmacaoEmail: '',
      nascimento: json.nascimento,
      isInput: false
    },
    localizacao: {
      cep: '',
      pais: json.emprego?.empresa.endereco.pais || '',
      estado: json.emprego?.empresa.endereco.estado || '',
      cidade: json.emprego?.empresa.endereco.cidade || '',
      isInput: false
    },
    academico: {
      matricula: json.matricula || '',
      email: json.usuario.email || '',
      tipoAluno: json.posGraduacao ? selectOpts.value.tipoAluno[1] : selectOpts.value.tipoAluno[0],
      cotista: {
        value: json.cotista,
        tipo: cotasEgresso || '',
        tipos: {
          escola: false,
          renda: false,
          raca: false,
          quilombolaIndigena: false
        }

      },
      bolsista: {
        value: json.bolsista,
        tipo: json.bolsa?.nome || '',
        remuneracao: json.remuneracaoBolsa || ''
      },
      posGrad: {
        value: json.posGraduacao,
        tipo: json.posGraducao || '',
        local: json.titulacao?.empresa?.nome || '',
        curso: json.titulacao?.curso?.nome || '',
        desejaPos: json.interesseEmPos
      },
      isInput: false
    },
    carreira: {
      area: json.emprego?.areaAtuacao?.nome || '',
      setor: json.emprego?.setorAtuacao?.nome || '',
      empresa: json.emprego?.empresa?.nome || '',
      faixaSalarial: json.emprego?.faixaSalarial?.faixa || '',
      remuneracao: '',
      isInput: false
    },
    adicionais: {
      palestras: !!json.palestras?.descricao,
      assuntosPalestras: json.palestras?.descricao || '',
      experiencias: json.depoimento?.descricao || '',
      contribuicoes: json.contribuicao?.descricao || '',
      isInput: false
    },
    profileHead: {
      nome: json.usuario.nome,
      linkedin: json.linkedin || '',
      lattes: json.lattes || '',
      isInput: false,
      triggerBackUpload: false,
      image: imageEgressoUrl
    }
  }
  for (const element of json.cotas) {
    if (element.id === 1) {
      dataEgresso.value.academico.cotista.tipos.escola = true
    }
    if (element.id === 2) {
      dataEgresso.value.academico.cotista.tipos.renda = true
    }
    if (element.id === 3) {
      dataEgresso.value.academico.cotista.tipos.raca = true
    }
    if (element.id === 4) {
      dataEgresso.value.academico.cotista.tipos.quilombolaIndigena = true
    }
  }
  bools.value = {
    cotista: dataEgresso.value.academico.cotista.value,
    bolsista: dataEgresso.value.academico.bolsista.value,
    posGrad: dataEgresso.value.academico.posGrad.value,
    palestras: dataEgresso.value.adicionais.palestras
  }

  placeHolders.value = {
    bolsaNome: dataEgresso.value.academico.bolsista.tipo,
    areaAtuacao: dataEgresso.value.carreira.area,
    setorAtuacao: dataEgresso.value.carreira.setor,
    faixaSalarial: dataEgresso.value.carreira.faixaSalarial
  }
  formHeader.value?.setFieldValue('geral.nome', dataEgresso.value.profileHead.nome)
  formHeader.value?.setValues({
    'geral.nome': dataEgresso.value.profileHead.nome,
    'geral.linkedin': dataEgresso.value.profileHead.linkedin,
    'geral.lattes': dataEgresso.value.profileHead.lattes
  })
  formGeral.value?.setValues({
    'geral.nascimento': dataEgresso.value.geral.nascimento,
    'geral.email': dataEgresso.value.geral.email,
    // passa Id para o select
    'geral.genero': dataEgresso.value.generoId
  })
  // passa o nome para o placeholder
  // dataEgresso.value.geral.genero
  formLocalizacao.value?.setValues({
    'localizacao.pais': dataEgresso.value.localizacao.pais,
    'localizacao.estado': dataEgresso.value.localizacao.estado,
    'localizacao.cidade': dataEgresso.value.localizacao.cidade
  })
  // dataEgresso.value.academico.cotista.value
  formAcademico.value?.setValues({
    'academico.matricula': dataEgresso.value.academico.matricula,
    'academico.cotista.value': dataEgresso.value.academico.cotista.value,
    'academico.cotista.tipos.renda': dataEgresso.value.academico.cotista.tipos.renda,
    'academico.cotista.tipos.escola': dataEgresso.value.academico.cotista.tipos.escola,
    'academico.cotista.tipos.raca': dataEgresso.value.academico.cotista.tipos.raca,
    'academico.cotista.tipos.quilombolaIndigena': dataEgresso.value.academico.cotista.tipos.quilombolaIndigena,
    'academico.bolsista.value': dataEgresso.value.academico.bolsista.value,
    // id
    // nome dataEgresso.value.academico.bolsista.tipo,
    'academico.bolsista.tipo': dataEgresso.value.bolsaId,

    'academico.bolsista.remuneracao': dataEgresso.value.academico.bolsista.remuneracao,
    'academico.posGrad.value': dataEgresso.value.academico.posGrad.value,
    'academico.posGrad.local': dataEgresso.value.academico.posGrad.local,
    'academico.posGrad.curso': dataEgresso.value.academico.posGrad.curso,
    'academico.posGrad.desejaPos': dataEgresso.value.academico.posGrad.desejaPos
  })
  formCarreira.value?.setValues({
    'carreira.area': dataEgresso.value.carreira.area,
    'carreira.setor': dataEgresso.value.carreira.setor,
    'carreira.empresa': dataEgresso.value.carreira.empresa,
    // id
    'carreira.faixaSalarial': dataEgresso.value.faixaSalarialId
  })
  formAdicionais.value?.setValues({
    'adicionais.palestras': dataEgresso.value.adicionais.palestras,
    'adicionais.assuntosPalestras': dataEgresso.value.adicionais.assuntosPalestras,
    'adicionais.experiencias': dataEgresso.value.adicionais.experiencias,
    'adicionais.contribuicoes': dataEgresso.value.adicionais.contribuicoes
  })
  return json;
}
onMounted(() => {
  window.scrollTo(0, 0)
  fetchUpdateEgresso()
})

function fetchEgresso () {
  return egressoStore.fetchEgresso()
}

function fetchPublicEgresso (id: number) {
  return egressoStore.fetchPublicEgresso(id)
}

const schemaHeader = object().shape({
  geral: object({
    nome: string().required('Campo obrigatório').trim().test('Nome', 'Nome inválido', (value) => {
      if (value) {
        return value?.match(/^[A-Za-z]+(?:\s[A-Za-z]+)+\s*$/)
      }

      return (typeof value).constructor(true)
    }),
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
  })

})
const schemaGeral = object().shape({
  geral: object({
    nascimento: string().required('Campo obrigatório').test('Data', 'Data inválida', (value) => {
      if (value) {
        const date = value.split('/').reverse().join('-') // Convert date to ISO format (YYYY-MM-DD)
        const minDate = new Date('1940-01-01')
        const maxDate = new Date('2023-12-31')
        const inputDate = new Date(date)

        // Check if the person is at least 18 years old
        const eighteenYearsAgo = new Date()
        eighteenYearsAgo.setFullYear(eighteenYearsAgo.getFullYear() - 18)

        return inputDate >= minDate && inputDate <= maxDate && inputDate <= eighteenYearsAgo
      }
      return true
    }),
    email: string().email('Email inválido').required('Campo obrigatório').matches(/^([a-zA-Z0-9]+([._][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)*(\.(com|br|org|jus)))$/, 'Email inválido'),
    genero: string().required('Campo obrigatório')
  })
})
const schemaAcademico = object().shape({
  academico: object({
    matricula: string().max(12, 'Valor muito comprido, insira até 12 caracteres').matches(/^(\d{12})?$/),
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
      tipo: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required() : schemaAcademico.notRequired()
      }),
      remuneracao: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required() : schemaAcademico.notRequired()
      })
    }),
    posGrad: object({
      value: boolean(),
      local: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required() : schemaAcademico.notRequired()
      }),
      curso: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required() : schemaAcademico.notRequired()
      })
    }),
    desejaPos: boolean()
  })
})
const schemaCarreira = object().shape({
  carreira: object({
    area: string().required('Campo obrigatório'),
    setor: string().when('area', ([area], schemaCarreira) => {
      return area !== 'Desempregado' ? schemaCarreira.required('Campo obrigatório') : schemaCarreira.notRequired()
    }),
    empresa: string().when('area', ([area], schemaCarreira) => {
      return area !== 'Desempregado' ? schemaCarreira.required('Campo obrigatório') : schemaCarreira.notRequired()
    }),
    faixaSalarial: string().when('area', ([area], schemaCarreira) => {
      return area !== 'Desempregado' ? schemaCarreira.required('Campo obrigatório') : schemaCarreira.notRequired()
    })
  })
})
const schemaLocalizacao = object().shape({
  localizacao: object({
    pais: string().required('Campo obrigatório'),
    estado: string().required('Campo obrigatório'),
    cidade: string().required('Campo obrigatório')
  })
})
const schemaAdicionais = object().shape({
  adicionais: object({
    palestras: boolean(),
    assuntosPalestras: string().when('palestras', ([palestras], schemaAdicionais) => {
      return palestras ? schemaAdicionais.required() : schemaAdicionais.notRequired()
    }),
    experiencias: string().required(),
    contribuicoes: string().required()
  })
})
async function removeImageEgresso () {
  const removeResp = await egressoStore.removeImageEgresso()
  dataEgresso.value.profileHead.image = '0'
  console.log(removeResp)
}

watch(() => dataEgresso.value.profileHead.image, (newValue) => {
  dataEgresso.value.profileHead.image = newValue
})

</script>
