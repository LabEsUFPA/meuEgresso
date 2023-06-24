<template>
  <div
    v-if="loading"
    class="flex h-[70vh] items-center justify-center text-center"
  >
    <SvgIcon
      type="mdi"
      size="80"
      class="animate-spin text-gray-400"
      :path="mdiLoading"
    />
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
          <h1 class=" absolute flex flex-auto top-[15px] right-[10px] sm:right-[20%]">
            <ButtonEdit
              label="Editar"
              icon-path="/img/edit.svg"
              icon-path2="/img/wcheck.svg"
              color="whitesky"
              color2="emerald"
              @toggle="toggleIsInput('profileHead')"
              :is-input="dataEgresso.profileHead.isInput"
              v-if="!isPublic || isSuperUser"
            />
          </h1>
          <div class="flex flex-auto justify-center mt-[-0.25rem] ">
            <div
              class="mt-[37px] flex flex-col items-center justify-center"
            >
              <ProfileImage
                ref="profileImageRef"
                @image-upload-back="profileImageSave"
                @remove="softRemoveImageEgresso"
                :img-url="dataEgresso.profileHead.image"
                img-default="/img/profile-pic.png"
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
                  :max-length="100"
                />
              </div>
            </h1>
            <div
              v-if="!dataEgresso.profileHead.isInput"
              class="items-start flex justify-center mt-8 relative gap-[10px]"
            >
              <CustomButtonLink
                label="LinkedIn"
                icon-path="/img/linkedin-icon.svg"
                :url="dataEgresso.profileHead.linkedin"
                placeholder="https://br.linkedin.com/"
                color="whitesky"
                variant="standard"
                icon-size="25"
              />

              <CustomButtonLink
                label="Lattes"
                icon-path="/img/lattesP.svg"
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
                label="LinkedIn"
                icon-path="/img/linkedin-icon.svg"
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
                    input-class="w-[155px] h-[34px] "
                    :icon-path="mdiLinkVariant"
                    name="geral.linkedin"
                    :value="dataEgresso.profileHead.linkedin"
                  />
                </template>
              </CustomButtonLink>

              <CustomButtonLink
                label="Lattes"
                icon-path="/img/lattesP.svg"
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
                    input-class="w-[155px] h-[34px]"
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
                  icon-path="/img/edit.svg"
                  icon-path2="/img/wcheck.svg"
                  color="invisiblesky"
                  color2="emerald"
                  classimg="sky-600"
                  :has-shadow="false"
                  icon-size="20"
                  @toggle="toggleIsInput('geral')"
                  :is-input="dataEgresso.geral.isInput"
                  v-if="!isPublic || isSuperUser"
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
                  v-if="!isPublic || isSuperUser"
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
                  :options="$storeCadastro.generos"
                  required
                  :pre-filled="true"
                />

                <CustomInput
                  class="mb-5"
                  name="geral.email"
                  label="E-mail"
                  placeholder="Ex: marcelle.mota.@gov.br"
                  helper-text="Use um email válido: hotmail, outlook, gmail, etc."
                  :icon-path="mdiEmail"
                  :max-length="50"
                  required
                />
                <CustomInput
                  class="mb-5"
                  name="geral.nascimento"
                  :value="dataEgresso.geral.nascimento"
                  label="Data de Nascimento"
                  :max-length="10"
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
          v-slot="{ values }"
        >
          <FolderAcademico
            :is-input="dataEgresso.academico.isInput"
            :bools="bools"
            :bolsa-holder="placeHolders.bolsaNome"
            :instituicao-holder="dataEgresso.academico.posGrad.local"
            :curso-holder="dataEgresso.academico.posGrad.curso"
          >
            <template #EditButton>
              <h1 class="relative">
                <ButtonEdit
                  label="Editar"
                  icon-path="/img/edit.svg"
                  icon-path2="/img/wcheck.svg"
                  color="invisiblesky"
                  color2="emerald"
                  classimg="sky-600"
                  :has-shadow="false"
                  @toggle="toggleIsInput('academico')"
                  :is-input="dataEgresso.academico.isInput"
                  v-if="!isPublic || isSuperUser"
                />
              </h1>
            </template>
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
            <template #Localizacao>
              <LocalizacaoSelect
                :pais-holder="dataEgresso.localizacao.pais"
                :estado-holder="dataEgresso.localizacao.estado"
                :cidade-holder="dataEgresso.localizacao.cidade"
                @pais-change="handleChangeLocal('pais', $event)"
                @estado-change="handleChangeLocal('estado', $event)"
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
            :empresa-nome-holder="dataEgresso.carreira.empresa"
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
                    icon-path="/img/edit.svg"
                    icon-path2="/img/wcheck.svg"
                    color="invisiblesky"
                    color2="emerald"
                    classimg="sky-600"
                    :has-shadow="false"
                    @toggle="toggleIsInput('carreira')"
                    :is-input="dataEgresso.carreira.isInput"
                    v-if="!isPublic || isSuperUser"
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
                <div v-if="dataEgresso.carreira.area === '' ">
                  <div>
                    <div class="text-gray-400 text-center mb-6 mt-12">
                      <SvgIcon
                        type="mdi"
                        size="30"
                        class="inline"
                        :path="mdiAlertCircleOutline"
                      />
                      <div class="mt-4">
                        Sem dados cadastrados
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </template>
<template #Localizacao>
  <div>
    <CustomSelect class="mb-2" name="localizacao.pais" label="País" :options="countries" v-model:value="pais"
      @change="handleChangeLocal('pais', $event)" :is-fetching="pais.isFetching" @typing="fetchCountries($event, true)"
      @infinite-scroll="fetchMoreCounties" infinite required :placeholder="dataEgresso.localizacao.pais"
      :pre-filled="true" />
    <CustomSelect class="mb-2" name="localizacao.estado" label="Estado" :options="states" v-model:value="estado"
      @change="handleChangeLocal('estado', $event)" :is-fetching="pais.isFetching" @typing="fetchStates($event, true)"
      @infinite-scroll="fetchMoreStates" infinite required :placeholder="dataEgresso.localizacao.estado"
      :pre-filled="true" />
    <CustomSelect name="localizacao.cidade" label="Cidade" :options="cities" :is-fetching="pais.isFetching"
      @typing="fetchCities($event, true)" @infinite-scroll="fetchMoreCities" infinite required :pre-filled="true"
      :placeholder="dataEgresso.localizacao.cidade" />
  </div>
</template>
          </FolderCarreira>

<Form
            ref="formLocalizacao"
            @submit="handleSubmitLocalizacao"
            @invalid-submit="onInvalid"
            :validation-schema="schemaLocalizacao"
          >
            <FolderSection class="mt-6">
              <template #EditButton>
                <h1 class="relative">
                  <ButtonEdit
                    label="Editar"
                    icon-path="/img/edit.svg"
                    icon-path2="/img/wcheck.svg"
                    color="invisiblesky"
                    color2="emerald"
                    classimg="sky-600"
                    :has-shadow="false"
                    @toggle="toggleIsInput('localizacao')"
                    :is-input="dataEgresso.localizacao.isInput"
                    v-if="!isPublic || isSuperUser"
                  />
                </h1>
              </template>
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
                <div v-if="!dataEgresso.localizacao.isInput">
                  <CustomPerfilData
                    type="text"
                    class="mb-5"
                    :vmodel="dataEgresso.localizacao.pais"
                    name="localizacao.pais"
                    placeholder="Brasil"
                    label="País"
                    :icon-path="mdiWeb"
                  />

                  <CustomPerfilData
                    type="text"
                    class="mb-5"
                    :vmodel="dataEgresso.localizacao.estado"
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
                  <div v-if="dataEgresso.localizacao.pais === '' ">
                    <div>
                      <div class="text-gray-400 text-center mb-6 mt-12">
                        <SvgIcon
                          type="mdi"
                          size="30"
                          class="inline"
                          :path="mdiAlertCircleOutline"
                        />
                        <div class="mt-4">
                          Sem dados cadastrados
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div v-show="dataEgresso.localizacao.isInput">
                  <div>
                    <CustomSelect
                      class="mb-5"
                      name="localizacao.pais"
                      label="País"
                      :options="countries"
                      v-model:value="pais"
                      @change="handleChangeLocal('pais', $event)"
                      :is-fetching="pais.isFetching"
                      @typing="fetchCountries($event, true)"
                      @infinite-scroll="fetchMoreCounties"
                      infinite
                      required
                      :placeholder="dataEgresso.localizacao.pais"
                      :pre-filled="true"
                    />
                    <CustomSelect
                      class="mb-5"
                      name="localizacao.estado"
                      label="Estado"
                      :options="states"
                      v-model:value="estado"
                      @change="handleChangeLocal('estado', $event)"
                      :is-fetching="pais.isFetching"
                      @typing="fetchStates($event, true)"
                      @infinite-scroll="fetchMoreStates"
                      infinite
                      required
                      :placeholder="dataEgresso.localizacao.estado"
                      :pre-filled="true"
                    />
                    <CustomSelect
                      name="localizacao.cidade"
                      label="Cidade"
                      :options="cities"
                      :is-fetching="pais.isFetching"
                      @typing="fetchCities($event, true)"
                      @infinite-scroll="fetchMoreCities"
                      infinite
                      required
                      :pre-filled="true"
                      :placeholder="dataEgresso.localizacao.cidade"
                    />
                    <!-- <LocalizacaoSelect
                      :pais-holder="dataEgresso.localizacao.pais"
                      :estado-holder="dataEgresso.localizacao.estado"
                      :cidade-holder="dataEgresso.localizacao.cidade"
                      @pais-change="handleChangeLocal('pais', $event)"
                      @estado-change="handleChangeLocal('estado', $event)"
                    /> -->
                  </div>
                </div>
              </template>
            </FolderSection>
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
                    icon-path="/img/edit.svg"
                    icon-path2="/img/wcheck.svg"
                    color="invisiblesky"
                    color2="emerald"
                    classimg="sky-600"
                    :has-shadow="false"
                    @toggle="toggleIsInput('adicionais')"
                    :is-input="dataEgresso.adicionais.isInput"
                    v-if="!isPublic || isSuperUser"
                  />
                </h1>
              </template>
              <template #NonInputData>
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

import CustomSelect from 'src/components/CustomSelect.vue'
import LocalStorage from 'src/services/localStorage'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import { Form } from 'vee-validate'
import { computed, onMounted, ref, watch } from 'vue'
import { boolean, object, string } from 'yup'

import { type models } from 'src/@types'
import apiEnderecos from 'src/services/apiEnderecos'
import { useRoute } from 'vue-router'
import ProfileImage from './components/ProfileImage.vue'

interface ComplexOpts extends models.ComplexOpts { }
const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const $route = useRoute()
const $storeCadastro = useCadastroEgressoStore()
const egressoStore = usePerfilEgressoStore()
const storage = new LocalStorage()
const formHeader = ref<typeof Form | null>(null)
const formGeral = ref<typeof Form | null>(null)
const formAcademico = ref<typeof Form | null>(null)
const formCarreira = ref<typeof Form | null>(null)
const formLocalizacao = ref<typeof Form | null>(null)
const formAdicionais = ref<typeof Form | null>(null)
const paisChange = ref(false)
const estadoChange = ref(false)
const loading = ref(true)

const pais = ref({
  id: 0,
  page: 0,
  isFetching: false,
  query: ''
})

const countries = ref<ComplexOpts[]>([])
async function fetchCountries(query: string, clean: boolean) {
  if (clean) {
    console.log('aqui')
    pais.value.id = 0
    pais.value.page = 0
    countries.value = []
  }

  pais.value.query = query
  pais.value.isFetching = true
  const response = await apiEnderecos.getPaises(query, pais.value.page)
  pais.value.isFetching = false

  if (response.status === 200) {
    countries.value = [...countries.value, ...response.data]
    pais.value.page++
  }
}

async function fetchMoreCounties() {
  fetchCountries(pais.value.query, false)
}

const estado = ref({
  id: 0,
  page: 0,
  isFetching: false,
  query: ''
})

const states = ref<ComplexOpts[]>([])
async function fetchStates(query: string, clean: boolean) {
  if (clean) {
    estado.value.id = 0
    estado.value.page = 0
    states.value = []
  }

  estado.value.query = query
  estado.value.isFetching = true
  const response = await apiEnderecos.getEstados(query, pais.value.id, estado.value.page)
  estado.value.isFetching = false

  if (response.status === 200) {
    states.value = [...states.value, ...response.data]
    estado.value.page++
  }
}

async function fetchMoreStates() {
  fetchStates(estado.value.query, false)
}

const cidade = ref({
  id: 0,
  page: 0,
  isFetching: false,
  query: ''
})

const cities = ref<ComplexOpts[]>([])
async function fetchCities(query: string, clean: boolean) {
  if (clean) {
    cidade.value.id = 0
    cidade.value.page = 0
    cities.value = []
  }

  cidade.value.query = query
  cidade.value.isFetching = true
  const response = await apiEnderecos.getCidades(query, estado.value.id, cidade.value.page)
  cidade.value.isFetching = false

  if (response.status === 200) {
    cities.value = [...cities.value, ...response.data]
    cidade.value.page++
  }
}

async function fetchMoreCities() {
  fetchStates(cidade.value.query, false)
}
const stagedChanges = ref({
  profileHead: {
    removedImage: false
  }
})

if (storage.has('loggedEgresso')) {
  $storeCadastro.fetchAll()
}

const isSuperUser = computed(() => {
  if (storage.has('loggedUser')) {
    const logUser = JSON.parse(storage.get('loggedUser'))
    if (logUser.scope === 'ADMIN' || logUser.scope === 'SECRETARIO') {
      return true
    }
  }
  return false
})
const isPublic = computed(() => {
  console.log('route')
  console.log(Number($route.params.id))
  if (storage.has('loggedUser') && storage.has('loggedEgresso')) {
    const logEgresso = JSON.parse(storage.get('loggedEgresso'))
    return (Object.keys($route.params).length === 1 && logEgresso.id !== Number($route.params.id))
  } else {
    return (Object.keys($route.params).length === 1)
  }
})

watch(() => $route.params, async () => {
  loading.value = true
  await fetchUpdateEgresso()
  loading.value = false
})

function handleStatus(status: any) {
  if (status !== 201) {
    dialogFalha.value = true
    return false
  } else {
    dialogSucesso.value = true
    return true
  }
}

async function handleChangeLocal(name: string, event: any) {
  switch (name) {
    case 'pais':
      paisChange.value = !paisChange.value
      pais.value.id = event
      break
    case 'estado':
      estadoChange.value = !estadoChange.value
      estado.value.id = event
      break
  }
}
async function handleSubmitHeader(values: any) {
  jsonResponse.usuario.nome = values.geral.nome
  if (values.geral.linkedin !== '' && values.geral.linkedin !== undefined) {
    jsonResponse.linkedin = values.geral.linkedin
  } else {
    jsonResponse.linkedin = null
  }
  if (values.geral.lattes !== '' && values.geral.lattes !== undefined) {
    jsonResponse.lattes = values.geral.lattes
  } else {
    jsonResponse.lattes = null
  }

  const status = await atualizarEgresso(jsonResponse)
  let responseImage: any
  if (stagedChanges.value.profileHead.removedImage) {
    responseImage = await removeImageEgresso()
    stagedChanges.value.profileHead.removedImage = false
    console.log('stagedChange')
  } else {
    responseImage = await profileImageSave()
  }

  if (status === 201 && (responseImage === 201 || responseImage === 200 || responseImage === 204)) {
    dialogSucesso.value = true

    toggleIsInput('profileHead')
    await fetchUpdateEgresso()
  } else {
    dialogFalha.value = true
  }
}

async function handleSubmitGeral(values: any) {
  jsonResponse.usuario.email = values.geral.email
  // ID request
  jsonResponse.genero.id = values.geral.genero
  jsonResponse.nascimento = values.geral.nascimento
  const status = await atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('geral')
  }

  fetchUpdateEgresso()
}

async function handleSubmitAcademico(values: any) {
  console.log(values)
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
    if (values.academico.cotista.tipos.pcd) {
      cotas.push({
        id: 5
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
          id: values.academico.posGrad.curso
        },
        empresa: {
          id: values.academico.posGrad.local

        },
        titulacao: {
          id: 2
        }
      }
      jsonResponse.titulacao = titulacao
    } else {
      const curso = {
        id: values.academico.posGrad.curso
      }
      const empresa = {
        id: values.academico.posGrad.local

      }
      jsonResponse.titulacao.empresa = empresa

      jsonResponse.titulacao.curso = curso
    }
  }

  jsonResponse.matricula = values.academico.matricula === '' ? null : values.academico.matricula

  jsonResponse.cotista = values.academico.cotista.value

  jsonResponse.bolsista = values.academico.bolsista.value

  jsonResponse.cotas = cotas

  const bolsa = {
    id: values.academico.bolsista.tipo
  }
  if (values.academico.bolsista.value) {
    jsonResponse.bolsa = bolsa
    jsonResponse.remuneracaoBolsa = values.academico.bolsista.remuneracao
  } else {
    jsonResponse.bolsa = null
    jsonResponse.remuneracaoBolsa = 0
  }

  const status = await atualizarEgresso(jsonResponse)

  if (handleStatus(status)) {
    toggleIsInput('academico')
  }

  fetchUpdateEgresso()
}
async function handleSubmitLocalizacao(values: any) {
  console.log(values)
  // !Mantem o mesmo id por enquanto!
  const id = jsonResponse.emprego.empresa.endereco.id
  jsonResponse.emprego.empresa.endereco = values.localizacao
  jsonResponse.emprego.empresa.endereco.id = id

  const status = await atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('localizacao')
  }

  fetchUpdateEgresso()
}
async function handleSubmitCarreira(values: any) {
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
      endereco: {
        id: 6,
        cidade: '',
        estado: '',
        pais: ''
      },
      empresa: {
        nome: '',
        faixaSalarial: {
          id: 2
        }

      }

    }
  }
  if (values.carreira.area !== 'Desempregado') {
    // jsonResponse.emprego.empresa.nome = values.carreira.empresa
    jsonResponse.emprego.empresa.id = values.carreira.empresa
    jsonResponse.emprego.id.empresaId = values.carreira.empresa

    jsonResponse.emprego.setorAtuacao.nome = values.carreira.setor
    // let areaNome = ''
    // $store.areasAtuacao.forEach(option => {
    //   if (option.value === values.carreira.area) {
    //     areaNome = option.label
    //     console.log(areaNome)
    //   }
    // })
    // jsonResponse.emprego.areaAtuacao.nome = areaNome
    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    jsonResponse.emprego.faixaSalarial.id = values.carreira.faixaSalarial
  } else {
    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    jsonResponse.emprego = null
  }

  const status = await atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('carreira')
  }

  fetchUpdateEgresso()
}
async function handleSubmitAdicionais(values: any) {
  jsonResponse.depoimento.descricao = values.adicionais.experiencias
  jsonResponse.contribuicao.descricao = values.adicionais.contribuicoes
  if (values.adicionais.palestras) {
    if (jsonResponse.palestras) {
      jsonResponse.palestras.descricao = values.adicionais.assuntosPalestras
    } else {
      const palestras = {
        descricao: values.adicionais.assuntosPalestras
      }
      jsonResponse.palestras = palestras
    }
  } else {
    jsonResponse.palestras = null
  }
  const status = await atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('adicionais')
  }
  fetchUpdateEgresso()
}

let isInputLocal = false
function toggleIsInput(FolderLabel: string) {
  switch (FolderLabel) {
    case 'profileHead':
      dataEgresso.value.profileHead.isInput = !dataEgresso.value.profileHead.isInput
      break
    case 'geral':
      dataEgresso.value.geral.isInput = !dataEgresso.value.geral.isInput

      break
    case 'localizacao':
      dataEgresso.value.localizacao.isInput = !dataEgresso.value.localizacao.isInput
      setTimeout(() => {
        estadoInput = document.querySelector('.localizacao-estado') as HTMLInputElement
        cidadeInput = document.querySelector('.localizacao-cidade') as HTMLInputElement
      }, 10)

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
  tipoAluno: ['Graduação', 'Pós-graduação'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Programador', 'Analísta', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docencia', 'Outros']
})
function onInvalid(e: any) {
  // updateEgressoDataModel(e)
  console.log('invalid')
  console.log(e)
}

const dataEgresso = ref({
  egressoId: 0,
  generoId: 0,
  bolsaId: 0,
  areaAtuacaoId: 0,
  faixaSalarialId: 0,
  cursoId: 0,
  localPosId: 0,
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
        quilombolaIndigena: false,
        pcd: false
      }
    },
    bolsista: {
      value: false,
      tipo: '',
      remuneracao: '0'
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

watch(() => dataEgresso.value.egressoId, () => {
  if (dataEgresso.value.egressoId !== 0) {
    loading.value = false
    fetchUpdateEgresso()
  }
})

let jsonResponse: any
let egressoResponseBack: any

let egressoImageResponse: any
let imageEgressoUrl: string
imageEgressoUrl = ''
async function handleEgressoImage(id: string) {
  egressoImageResponse = await egressoStore.fetchImageEgressoUrl(id)
  imageEgressoUrl = egressoImageResponse
  if (imageEgressoUrl === '') {
    return ''
  } else {
    return imageEgressoUrl
  }
}

onMounted(async () => {
  window.scrollTo(0, 0)
  await fetchUpdateEgresso()
  loading.value = false
})

async function fetchUpdateEgresso() {
  // getEgresso
  if (isPublic.value) {
    egressoResponseBack = await fetchPublicEgresso(Number($route.params?.id))
  } else {
    if (storage.has('loggedUser') && storage.getLoggedUser()?.scope !== 'EGRESSO') return
    egressoResponseBack = await egressoStore.fetchEgresso()
  }

  const ResponseBack = egressoResponseBack

  const json = JSON.parse(ResponseBack)

  jsonResponse = json

  // Cotas
  let cotasEgresso = ''
  if (json.id === 0) {
    console.log('wttffff')
  }
  imageEgressoUrl = await handleEgressoImage(json.id)
  for (const element of json.cotas) {
    $store.tiposCota.forEach(option => {
      if (option.value === element.id) {
        cotasEgresso += option.label + '\n'
      }
    })
  }
  console.log(json)
  dataEgresso.value = {
    egressoId: json.id,
    generoId: json.genero.id,
    bolsaId: json.bolsa?.id,
    areaAtuacaoId: json.emprego?.areaAtuacao?.id,
    faixaSalarialId: json.emprego?.faixaSalarial?.id,
    localPosId: json.titulacao?.empresa?.id,
    cursoId: json.titulacao?.curso?.id,
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
      pais: json.emprego?.endereco.pais || '',
      estado: json.emprego?.endereco.estado || '',
      cidade: json.emprego?.endereco.cidade || '',
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
          quilombolaIndigena: false,
          pcd: false
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
    if (element.id === 5) {
      dataEgresso.value.academico.cotista.tipos.pcd = true
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
    localizacao: dataEgresso.value.localizacao
  })
  formAcademico.value?.setValues({
    academico: dataEgresso.value.academico,
    'academico.bolsista.tipo': dataEgresso.value.bolsaId,
    'academico.posGrad.curso': dataEgresso.value.cursoId,
    'academico.posGrad.local': dataEgresso.value.localPosId
  })
  formCarreira.value?.setValues({
    carreira: dataEgresso.value.carreira,
    'carreira.faixaSalarial': dataEgresso.value.faixaSalarialId
  })
  formAdicionais.value?.setValues({
    adicionais: dataEgresso.value.adicionais
  })
  return json
}
let estadoInput = document.querySelector('.localizacao-estado') as HTMLInputElement
let cidadeInput = document.querySelector('.localizacao-cidade') as HTMLInputElement

onMounted(() => {
  estadoInput = document.querySelector('.localizacao-estado') as HTMLInputElement

  cidadeInput = document.querySelector('.localizacao-cidade') as HTMLInputElement
  watch(paisChange, () => {
    console.log('pais')
    formLocalizacao.value?.setFieldValue('localizacao.cidade', '')
    formLocalizacao.value?.setFieldValue('localizacao.estado', '')
    if (formLocalizacao.value) {
      dataEgresso.value.localizacao.cidade = ''
      dataEgresso.value.localizacao.estado = ''
    }
    setTimeout(() => {
      if (cidadeInput?.value) {
        cidadeInput.value = ''
        estadoInput.value = ''
      }
    }, 10)
  })

  watch(estadoChange, () => {
    console.log('estado')
    console.log(formLocalizacao.value)
    formLocalizacao.value?.setFieldValue('localizacao.cidade', '')
    if (formLocalizacao.value) {
      dataEgresso.value.localizacao.cidade = ''
    }
    setTimeout(() => {
      if (cidadeInput?.value) {
        cidadeInput.value = ''
      }
    }, 10)
  })
})


const schemaHeader = object().shape({
  geral: object({
    nome: string().required('Campo obrigatório').trim().test('Nome', 'Nome inválido', (value) => {
      if (value) {
        return value?.match(/^[A-Za-zÀ-ÿ]+(?:\s[A-Za-zÀ-ÿ]+)+$/)
      }

      return (typeof value).constructor(true)
    }),
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
      tipo: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required('Campo obrigatório') : schemaAcademico.notRequired()
      }),
      remuneracao: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required('Campo obrigatório') : schemaAcademico.notRequired()
      })
    }),
    posGrad: object({
      value: boolean(),
      local: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required('Campo obrigatório') : schemaAcademico.notRequired()
      }),
      curso: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required('Campo obrigatório') : schemaAcademico.notRequired()
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
      return palestras ? schemaAdicionais.required('Campo obrigatório') : schemaAdicionais.notRequired()
    }),
    experiencias: string().required('Campo obrigatório'),
    contribuicoes: string().required('Campo obrigatório')
  })
})
const profileImageRef = ref<typeof ProfileImage | null>(null)
const profileImageSave = () => {
  if (isSuperUser.value) {
    return profileImageRef?.value?.imageUploadBackAdmin(Number($route.params?.id))
  }
  return profileImageRef?.value?.imageUploadBack()
}
function fetchPublicEgresso(id: number) {
  if (isSuperUser.value) {
    return egressoStore.fetchAdminEgresso(id)
  }
  return egressoStore.fetchPublicEgresso(id)
}
async function atualizarEgresso(data: any) {
  if (isSuperUser.value) {
    return egressoStore.atualizarEgressoAdmin(data, Number($route.params?.id))
  }
  return await egressoStore.atualizarEgresso(data)
}
async function removeImageEgresso() {
  let response = 100
  if (isSuperUser.value) {
    response = await egressoStore.removeImageEgressoAdmin(Number($route.params?.id))
    dataEgresso.value.profileHead.image = ' '
    return response
  }
  response = await egressoStore.removeImageEgresso()
  dataEgresso.value.profileHead.image = ' '
  return response
}
async function softRemoveImageEgresso() {
  stagedChanges.value.profileHead.removedImage = true
  dataEgresso.value.profileHead.image = ' '
}

watch(() => dataEgresso.value.profileHead.image, (newValue) => {
  dataEgresso.value.profileHead.image = newValue
})

</script>
