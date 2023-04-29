<template>
  <!-- <Form
    @submit="handleSubmit"
    @invalid-submit="onInvalid"
    :validation-schema="schema"
  > -->

  <div class="flex-1 min-h-screen items-center justify-center bg-neutral-100">
    <div
      class="flex place-items-center justify-between flex-wrap relative w-full h-[335px] pin-t bg-gradient-to-b from-sky-200 to-indigo-200 "
    >
      <!-- <ProfileHead /> -->
      <!-- Head Start-->

      <div class="items-center flex relative w-[7000px] flex-col">
        <Form
          ref="myForm"
          @submit="handleSubmitHeader"
          @invalid-submit="onInvalid"
          :validation-schema="schemaHeader"
        >
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
                icon-path2="/src/assets/wcheck.svg"
                color="whitesky"
                color2="emerald"
                @toggle="toggleIsInput('profileHead')"
                :is-input="dataEgresso.profileHead.isInput"
              />
            </h1>
          </div>
          <div class="head">
            <h1 class="grid place-items-center text-cyan-800 text-xl font-bold mt-5 ">
              <!-- name="geral.nome" -->

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
                  label=""
                  placeholder="Ex: Marcelle Mota"

                  :icon-path="mdiAccount"
                />
              </div>
            </h1>
            <!-- helper-text="Números e caracteres especiais não são permitidos" -->

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
      <!-- <ProfileBodyView /> -->
      <!-- Body Start -->
      <div class="container mx-auto p-3 pb-0">
        <!-- <form @submit.prevent="handleSubmit($event)"> -->
        <Form
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
              <div v-if="!dataEgresso.geral.isInput">
                <!-- Talvez problema com v-model -->
                <!-- Add um v-if aq pro botão de ativar edição -->
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
                  label="Email"
                  placeholder="marcele@email.com"
                  :icon-path="mdiEmail"
                />

                <CustomPerfilData
                  type="date"
                  class="mb-1"
                  name="geral.nascimento"
                  :vmodel="dataEgresso.geral.nascimento"
                  label="dataEgresso Nascimento"
                  placeholder="01/01/2001"
                  :icon-path="mdiCake"
                />
              </div>

              <div v-else>
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
                  placeholder="Ex: marcelle.mota.@gov.br"
                  helper-text="Use um email válido: hotmail, outlook, gmail, etc."
                  :icon-path="mdiEmail"
                />

                <CustomInput
                  class="mb-5"
                  name="geral.nascimento"
                  label="Data de Nascimento"
                  type="date"
                />
              </div>
            </template>
          </FolderSection>
        </Form>
        <Form
          @submit="handleSubmitLocalizacao"
          @invalid-submit="onInvalid"
          :validation-schema="schemaLocalizacao"
        >
          <FolderSection class="mt-6">
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
              <div v-if="!dataEgresso.localizacao.isInput">
                <!-- <CustomPerfilData
                  type="text"
                  class="mb-5"
                  :vmodel="dataEgresso.localizacao.cep"
                  name="localizacao.cep"
                  label="CEP"
                  placeholder="00000-000"
                  mask="#####-###"
                  :icon-path="mdiHome"
                /> -->

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
              </div>
              <div v-else>
                <!-- <CustomInput
                  class="mb-5"
                  name="localizacao.cep"
                  label="CEP"
                  placeholder="00000-000"
                  mask="#####-###"
                /> -->

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
        </Form>
        <Form
          @submit="handleSubmitAcademico"
          @invalid-submit="onInvalid"
          :validation-schema="schemaAcademico"
        >
          <FolderSection class="mt-6">
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
              <div v-if="!dataEgresso.academico.isInput">
                <!-- class="mb-1"
            name="localizacao.cidade"
            label="Cidade"
            placeholder="Belém"
            :icon-path="mdiMapMarkerRadius""
          /> -->
                <CustomPerfilData
                  type="number"
                  class="mb-5"
                  :vmodel="dataEgresso.academico.matricula"
                  name="academico.matricula"
                  label="Matrícula"
                  placeholder="205004940001"
                  icon-path=""
                />

                <!-- <CustomPerfilData
            class="mb-5"
            name="academico.email"
            label="Email institucional"
            placeholder="Selecione"
            icon-path=""
          />
          -->
                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  :vmodel="dataEgresso.academico.cotista.tipo"
                  name="academico.cotista.tipo"
                  label="Cota"
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

                <!-- <CustomPerfilData
            class="mb-5"
            name="academico.posGrad.tipo"
            label="Tipo de Aluno"
            placeholder="Tipo"
            icon-path=""
          /> -->

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
                  placeholder="UFPA"
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
              </div>
              <div v-else>
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
        </Form>
        <Form
          @submit="handleSubmitCarreira"
          @invalid-submit="onInvalid"
          :validation-schema="schemaCarreira"
        >
          <FolderSection class="mt-6">
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
              <div v-if="!dataEgresso.carreira.isInput">
                <CustomPerfilData
                  type="text"
                  class="mb-10"
                  :vmodel="dataEgresso.carreira.area"
                  name="carreira.area"
                  label="Area de Atuação"
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
              </div>
              <div v-else>
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
        </Form>
        <Form
          @submit="handleSubmitAdicionais"
          @invalid-submit="onInvalid"
          :validation-schema="schemaAdicionais"
        >
          <FolderSection class="mt-6">
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
              <div v-if="!dataEgresso.adicionais.isInput">
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
              </div>
              <div v-else>
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
          <div class="py-10 flex flex-row justify-center items-center" />
        </Form>
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
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import { Country, State, City } from 'country-state-city'
import { computed, ref } from 'vue'

import svgPath from 'src/assets/svgPaths.json'
import CustomTextarea from 'src/components/CustomTextarea.vue'
import { Form } from 'vee-validate'
import { object, string, date, boolean } from 'yup'
import CustomButton from 'src/components/CustomButton.vue'
import egressoModel from 'src/model/egressoModel'
import { updateEgressoDataModel } from 'src/store/ResponseStore.vue'

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
  mdiMapMarkerRadius,
  mdiLinkVariant,
  mdiYoutubeSubscription
} from '@mdi/js'
import { getRandomValues } from 'crypto'
import { userInfo } from 'os'
// mdiHome CEP,

const myForm = ref<HTMLFormElement>()

function Test () {
  console.log('231231234')
}
function callSubmit () {
  // call the submit method of the form element
  console.log('23123123')
  myForm.value?.submit()
}
// defineExpose({

//   callSubmit () {
//     // call the submit method of the form element
//     myForm.value?.submit(Test)
//   }
// })

// Futuro: 1 Autenticar usr ('/auth/register' ? ,), 2 get egresso, 3 update egresso
async function handleSubmitHeader (values: any) {
  console.log('handleSubmitHeader')
  toggleIsInput('profileHead')
  console.log(values)
  // const valuesJSON = JSON.stringify(values, null, 2)
  dataEgresso.value.profileHead.nome = values.geral.nome
  dataEgresso.value.profileHead.linkedin = values.geral.linkedin
  dataEgresso.value.profileHead.lattes = values.geral.lattes
}
async function handleSubmitGeral (values: any) {
  console.log('handleSubmitGeral')
  toggleIsInput('geral')
  console.log(JSON.stringify(values, null, 2))
  dataEgresso.value.geral.genero = values.geral.genero
  dataEgresso.value.geral.genero = values.geral.genero
  dataEgresso.value.geral.genero = values.geral.genero
}

async function handleSubmitAcademico (values: any) {
  console.log('handleSubmitAcademico')
  toggleIsInput('academico')
  console.log(JSON.stringify(values, null, 2))
}
async function handleSubmitLocalizacao (values: any) {
  console.log('handleSubmitLocalizacao')
  toggleIsInput('localizacao')
  console.log(JSON.stringify(values, null, 2))
}
async function handleSubmitCarreira (values: any) {
  console.log('handleSubmitCarreira')
  toggleIsInput('carreira')
  console.log(JSON.stringify(values, null, 2))
}
async function handleSubmitAdicionais (values: any) {
  console.log('handleSubmitAdicionais')
  toggleIsInput('adicionais')
  console.log(JSON.stringify(values, null, 2))
}

async function handleSubmit (values: any) {
  // $event.preventDefault()
  console.log('HandleSubmit')
  console.log('Values: ' + values)
  toggleIsInput(FolderLabel)
  // const data: egressoModel = {
  //   // String to number >:)

  //   matricula: +dataEgresso.value.academico.matricula,
  //   email: dataEgresso.value.geral.email,
  //   genero: {
  //     nome: dataEgresso.value.geral.genero
  //   },
  //   cotista: dataEgresso.value.academico.cotista.value,
  //   pcd: dataEgresso.value.academico.bolsista.value,
  //   interesseEmPos: dataEgresso.value.academico.posGrad.value,
  //   lattes: dataEgresso.value.geral.lattes,
  //   linkedin: dataEgresso.value.geral.linkedin,
  //   endereco: {
  //     cidade: dataEgresso.value.localizacao.cidade,
  //     estado: dataEgresso.value.localizacao.estado,
  //     pais: dataEgresso.value.localizacao.pais
  //   }
  // }
  // const data: egressoModel = {
  //   matricula: 0,
  //   email: 'string',
  //   genero: {
  //     nome: 'string'
  //   },
  //   cotista: true,
  //   pcd: true,
  //   interesseEmPos: true,
  //   lattes: 'string',
  //   linkedin: 'string',
  //   endereco: {
  //     cidade: 'string',
  //     estado: 'string',
  //     pais: 'string'
  //   }
  // }
  // updateEgressoDataModel(data)
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
}

// function submit () {
//   $emit('submit')
// }

let isInputLocal = false
function toggleIsInput (FolderLabel: string) {
  console.log('EditMode: ' + FolderLabel)

  switch (FolderLabel) {
    case 'profileHead':
      dataEgresso.value.profileHead.isInput = !dataEgresso.value.profileHead.isInput
      if (isInputLocal) {
        // handleSubmitHeader()
        // callSubmit()
      }

      // handleSubmitHeader()

      break
    case 'geral':
      dataEgresso.value.geral.isInput = !dataEgresso.value.geral.isInput
      if (isInputLocal) {
        // handleSubmitGeral()
      }

      break
    case 'localizacao':
      dataEgresso.value.localizacao.isInput = !dataEgresso.value.localizacao.isInput
      if (isInputLocal) {
        // handleSubmitLocalizacao()
      }

      break
    case 'academico':
      dataEgresso.value.academico.isInput = !dataEgresso.value.academico.isInput
      if (isInputLocal) {
        // handleSubmitAcademico()
      }

      break
    case 'carreira':
      dataEgresso.value.carreira.isInput = !dataEgresso.value.carreira.isInput
      if (isInputLocal) {
        // handleSubmitCarreira()
      }

      break
    case 'adicionais':
      dataEgresso.value.adicionais.isInput = !dataEgresso.value.adicionais.isInput
      if (isInputLocal) {
        // handleSubmitAdicionais()
      }
  }

  isInputLocal = !isInputLocal
  console.log(isInputLocal)
}

//

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

function onInvalid (e: any) {
  // updateEgressoDataModel(e)
  console.log('INVALID')
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

// Add email para resquest

const schemaHeader = object().shape({
  geral: object({
    nome: string(),
    linkedin: string(),
    lattes: string()
  })

})

const schemaGeral = object().shape({
  geral: object({
    nascimento: date().required(),
    email: string().email().required(),
    genero: string().required()
  })
})
const schemaLocalizacao = object().shape({
  localizacao: object({
    pais: string().required(),
    estado: string().required(),
    cidade: string().required()
  })
})

const schemaAcademico = object().shape({
  academico: object({
    matricula: string().required(),
    email: string().email().required(),
    tipoAluno: string().required(),
    cotista: object({
      value: boolean(),
      tipo: string().when('value', ([value], schemaAcademico) => {
        return value ? schemaAcademico.required() : schemaAcademico.notRequired()
      })
      // tipo: string().when('value', ([value], schema) => {
      //   return value ? schema.required() : schema.notRequired()
      // })
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
    area: string().required(),
    setor: string().when('area', ([area], schemaCarreira) => {
      return area !== 'Desempregado' ? schemaCarreira.required() : schemaCarreira.notRequired()
    }),
    empresa: string().when('area', ([area], schemaCarreira) => {
      return area !== 'Desempregado' ? schemaCarreira.required() : schemaCarreira.notRequired()
    }),
    faixaSalarial: string().when('area', ([area], schemaCarreira) => {
      return area !== 'Desempregado' ? schemaCarreira.required() : schemaCarreira.notRequired()
    })
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
const dataEgresso = ref({
  geral: {
    email: '',
    genero: '',
    confirmacaoEmail: '',
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
    nome: '',
    email: '',
    linkedin: '',
    lattes: '',
    isInput: false
  }
})

</script>
<style>
</style>
