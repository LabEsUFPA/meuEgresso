<template>
  <div class="flex-1 min-h-screen items-center justify-center bg-neutral-100">
    <div
      class="flex place-items-center justify-between flex-wrap relative w-full h-[335px] pin-t bg-gradient-to-b from-sky-200 to-indigo-200 "
    >
      <!-- <ProfileHead /> -->
      <!-- Head Start-->

      <div class="items-center flex relative w-[7000px] flex-col">
        <Form
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
                  :value="dataEgresso.profileHead.nome"
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
      <!-- <ProfileBodyView /> -->
      <!-- Body Start -->
      <div class="container mx-auto p-3 pb-0">
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
                  label="Email"
                  placeholder="marcele@email.com"
                  :icon-path="mdiEmail"
                />

                <CustomPerfilData
                  type="date"
                  class="mb-1"
                  name="geral.nascimento"
                  :vmodel="dataEgresso.geral.nascimento"
                  label="Data de Nascimento"
                  placeholder="01/01/2001"
                  :icon-path="mdiCake"
                />
              </div>

              <div v-else>
                <CustomSelect
                  class="mb-5"
                  name="geral.genero"
                  :value="dataEgresso.geral.genero"
                  label="Genero"
                  :options="egressoStore.generos"
                  required
                />
                <CustomInput
                  class="mb-5"
                  name="geral.email"
                  :value="dataEgresso.geral.email"
                  label="E-mail"
                  placeholder="Ex: marcelle.mota.@gov.br"
                  helper-text="Use um email válido: hotmail, outlook, gmail, etc."
                  :icon-path="mdiEmail"
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
                  :value="dataEgresso.localizacao.pais"
                  label="País"
                  :options="countries"
                  v-model:value="dataEgresso.localizacao.pais"
                  required
                />

                <CustomSelect
                  class="mb-5"
                  name="localizacao.estado"
                  :value="dataEgresso.localizacao.estado"
                  label="Estado"
                  :options="states"
                  v-model:value="dataEgresso.localizacao.estado"
                  required
                />

                <CustomSelect
                  name="localizacao.cidade"
                  :value="dataEgresso.localizacao.cidade"
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
              <div v-if="!dataEgresso.academico.isInput">
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
              </div>
              <div v-else>
                <CustomInput
                  class="mb-5"
                  name="academico.matricula"
                  :value="dataEgresso.academico.matricula"
                  label="Matrícula"
                  mask="############"
                  placeholder="205004940001"
                  required
                />

                <CustomInput
                  class="mb-5"
                  name="academico.email"
                  :value="dataEgresso.academico.email"
                  label="Email institucional"
                  placeholder="Selecione"
                  required
                />

                <CustomSelect
                  class="mb-5"
                  name="academico.tipoAluno"
                  :value="dataEgresso.academico.tipoAluno"
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
                  :value="dataEgresso.academico.cotista.value"
                  label="Cotista"
                  v-model:value="dataEgresso.academico.cotista.value"
                />

                <CustomSelect
                  class="mb-5"
                  name="academico.cotista.tipo"
                  :value="dataEgresso.academico.cotista.tipo"
                  label="Tipo de Cota"
                  placeholder="Selecione"
                  :options="selectOpts.tipoCota"
                  :required="dataEgresso.academico.cotista.value"
                  :disabled="!dataEgresso.academico.cotista.value"
                />

                <CustomCheckbox
                  class="mb-5"
                  name="academico.bolsista.value"
                  :value="dataEgresso.academico.bolsista.value"
                  label="Bolsista"
                  v-model:value="dataEgresso.academico.bolsista.value"
                />

                <CustomSelect
                  class="mb-5"
                  name="academico.bolsista.tipo"
                  :value="dataEgresso.academico.bolsista.tipo"
                  label="Tipo de Bolsa"
                  placeholder="Selecione"
                  :options="selectOpts.tipoBolsa"
                  :required="dataEgresso.academico.bolsista.value"
                  :disabled="!dataEgresso.academico.bolsista.value"
                />

                <CustomInput
                  class="mb-5"
                  name="academico.bolsista.remuneracao"
                  :value="dataEgresso.academico.bolsista.remuneracao"
                  label="Remuneração da bolsa"
                  placeholder="Selecione"
                  type="number"
                  step="0.01"
                  :required="dataEgresso.academico.bolsista.value"
                  :disabled="!dataEgresso.academico.bolsista.value"
                />

                <CustomCheckbox
                  class="mb-5"
                  name="academico.posGrad.value"
                  :value="dataEgresso.academico.posGrad.value"
                  v-model:value="dataEgresso.academico.posGrad.value"
                  label="Pós-graduação"
                />

                <CustomInput
                  class="mb-5"
                  name="academico.posGrad.local"
                  :value="dataEgresso.academico.posGrad.local"
                  label="Local da pós-graduação"
                  placeholder="Selecione"
                  :required="dataEgresso.academico.posGrad.value"
                  :disabled="!dataEgresso.academico.posGrad.value"
                />

                <CustomInput
                  class="mb-5"
                  name="academico.posGrad.curso"
                  :value="dataEgresso.academico.posGrad.curso"
                  label="Curso de pós-graduação"
                  placeholder="Selecione"
                  :required="dataEgresso.academico.posGrad.value"
                  :disabled="!dataEgresso.academico.posGrad.value"
                />

                <CustomCheckbox
                  name="academico.posGrad.desejaPos"
                  :value="dataEgresso.academico.posGrad.desejaPos"
                  label="Deseja realizar pós graduação?"
                  v-if="!dataEgresso.academico.posGrad.value"
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
                  :value="dataEgresso.carreira.area"
                  label="Area de Atuação"
                  placeholder="Selecione"
                  v-model:value="dataEgresso.carreira.area"
                  :options="selectOpts.areaAtuacao"
                />

                <CustomSelect
                  class="mb-5"
                  name="carreira.setor"
                  :value="dataEgresso.carreira.setor"
                  label="Setor de Atuação"
                  placeholder="Selecione"
                  :options="selectOpts.setorAtuacao"
                  :required="dataEgresso.carreira.area !== 'Desempregado'"
                  :disabled="dataEgresso.carreira.area === 'Desempregado'"
                />

                <CustomInput
                  class="mb-5"
                  name="carreira.empresa"
                  :value="dataEgresso.carreira.empresa"
                  label="Empresa"
                  placeholder="Ex: Google"
                  :required="dataEgresso.carreira.area !== 'Desempregado'"
                  :disabled="dataEgresso.carreira.area === 'Desempregado'"
                />

                <CustomInput
                  class="mb-5"
                  name="carreira.faixaSalarial"
                  :value="dataEgresso.carreira.faixaSalarial"
                  label="Faixa Salarial"
                  type="number"
                  step="0.01"
                  :required="dataEgresso.carreira.area !== 'Desempregado'"
                  :disabled="dataEgresso.carreira.area === 'Desempregado'"
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
              <div v-if="!dataEgresso.adicionais.isInput">
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
              </div>
              <div v-else>
                <CustomCheckbox
                  name="adicionais.palestras"
                  :value="dataEgresso.adicionais.palestras"
                  label="Gostaria de apresentar palestras"
                  class="mb-5"
                  v-model:value="dataEgresso.adicionais.palestras"
                />

                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Use o campo abaixo para listar aqueles assuntos que melhor você se sente para apresentar palestras:
                </div>

                <CustomTextarea
                  class="mb-5"
                  name="adicionais.assuntosPalestras"
                  :value="dataEgresso.adicionais.assuntosPalestras"
                  :required="dataEgresso.adicionais.palestras"
                  :disabled="!dataEgresso.adicionais.palestras"
                />

                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Use o campo abaixo para de forma simples e resumida compartilhar com outras pessoas experiências
                  positivas ao realizar o curso:
                </div>

                <CustomTextarea
                  class="mb-5"
                  name="adicionais.experiencias"
                  :value="dataEgresso.adicionais.experiencias"
                />

                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Use o campo abaixo para que todos possam ter conhecimento sobre suas contribuições para a sociedade seja
                  pequena ou grande, pois tudo tem seu impacto:
                </div>

                <CustomTextarea
                  name="adicionais.contribuicoes"
                  :value="dataEgresso.adicionais.contribuicoes"
                />
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
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import CustomTextarea from 'src/components/CustomTextarea.vue'
import { Form } from 'vee-validate'
import { object, string, date, boolean } from 'yup'
import LocalStorage from 'src/services/localStorage'

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
  mdiLinkVariant
} from '@mdi/js'
// mdiHome CEP,
const dialogSucesso = ref(false)
const dialogFalha = ref(false)
// const camposFaltosos = ref(false)

const egressoStore = usePerfilEgressoStore()
const storage = new LocalStorage()

egressoStore.fetchAll()

// const form = ref<typeof Form | null>(null)

function handleStatus (status : any) {
  console.log('Staus: ')
  console.log(status)

  if (status !== 201) {
    dialogFalha.value = true
  } else {
    dialogSucesso.value = true
  }
}

async function handleSubmitHeader (values: any) {
  console.log('handleSubmitHeader')
  toggleIsInput('profileHead')
  console.log(values)
  // const valuesJSON = JSON.stringify(values, null, 2)
  // dataEgresso.value.profileHead.nome = values.geral.nome
  // dataEgresso.value.profileHead.linkedin = values.geral.linkedin
  // dataEgresso.value.profileHead.lattes = values.geral.lattes
  dataEgresso.value.profileHead = values.geral
  // egressoStore.atualizarEgresso(dataEgresso.value.profileHead)
  // egressoStore.atualizarEgresso(values.geral)

  // egressoStore.fetchEgresso()
  // futuro add foto
  jsonResponse.usuario.nome = values.geral.nome
  console.log(jsonResponse)
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  handleStatus(status)
  fetchEgresso()
}

async function handleSubmitGeral (values: any) {
  console.log('handleSubmitGeral')
  toggleIsInput('geral')
  console.log(JSON.stringify(values, null, 2))
  // dataEgresso.value.geral = values.geral

  jsonResponse.usuario.email = values.geral.email
  // ID request
  // jsonResponse.genero.nome = values.geral.genero
  jsonResponse.genero.id = values.geral.genero
  jsonResponse.nascimento = values.geral.nascimento
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  console.log(jsonResponse)
  handleStatus(status)
  fetchUpdateEgresso()
}

async function handleSubmitAcademico (values: any) {
  console.log('handleSubmitAcademico')
  toggleIsInput('academico')
  console.log(JSON.stringify(values, null, 2))
  jsonResponse.matricula = values.academico.matricula
  jsonResponse.posGraduacao = values.academico.posGrad.value
  jsonResponse.cotista = values.academico.cotista.value
  jsonResponse.bolsista = values.academico.bolsista.value
  jsonResponse.bolsa = values.academico.bolsista.tipo
  jsonResponse.remuneracaoBolsa = values.academico.bolsista.remuneracao
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  console.log(jsonResponse)
  handleStatus(status)
}
async function handleSubmitLocalizacao (values: any) {
  console.log('handleSubmitLocalizacao')

  console.log(JSON.stringify(values, null, 2))
  jsonResponse.emprego.empresa.endereco.pais = values.localizacao.pais
  jsonResponse.emprego.empresa.endereco.estado = values.localizacao.estado
  jsonResponse.emprego.empresa.endereco.cidade = values.localizacao.cidade
  console.log('HandleSubmit Response: ')
  console.log(jsonResponse)
  const status = await egressoStore.atualizarEgresso(jsonResponse)
  toggleIsInput('localizacao')
  handleStatus(status)
  fetchUpdateEgresso()
}
async function handleSubmitCarreira (values: any) {
  console.log('handleSubmitCarreira')
  toggleIsInput('carreira')
  console.log(JSON.stringify(values, null, 2))
  dataEgresso.value.carreira = values.carreira
  egressoStore.atualizarEgresso(values.carreira)
}
async function handleSubmitAdicionais (values: any) {
  console.log('handleSubmitAdicionais')
  toggleIsInput('adicionais')
  console.log(JSON.stringify(values, null, 2))
  dataEgresso.value.adicionais = values.adicionais
  egressoStore.atualizarEgresso(values.adicionais)
}

let isInputLocal = false
function toggleIsInput (FolderLabel: string) {
  console.log('EditMode: ' + FolderLabel)

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
  console.log(isInputLocal)
}

//

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
  const states = State.getStatesOfCountry(dataEgresso.value.localizacao.pais)
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
  const cities = City.getCitiesOfState(dataEgresso.value.localizacao.pais, dataEgresso.value.localizacao.estado)
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

const schemaHeader = object().shape({
  geral: object({
    nome: string().required(),
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
  egressoId: 0,
  generoId: 0,
  // cotasIds: [0, 0],

  // usuarioId: 0,
  // usuarioGruposId: [0],

  // palestrasId: 0,
  // contribuicaoId: 0,
  // titulacaoId: 0,
  // empregoId: 0,
  // empresaId: 0,
  // setorAtuacaoId: 0,
  // endereçoId: 0,
  // faixaSalarialId: 0,
  // areaAtuacaoId: 0,
  // depoimentoId: 0,
  // bolsaId: 0,

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
    isInput: false
  }
})

const dataResquestFront: EgressoModelUpdate = {
  id: dataEgresso.value.egressoId,
  nascimento: '',
  genero: {
    id: 0,
    nome: ''
  },
  matricula: '',
  cotista: false,
  bolsista: false,
  interesseEmPos: false,
  lattes: '',
  linkedin: '',
  posGraduacao: false,
  cotas: [{
    id: 0,
    tipo: ''
  }

  ],
  usuario: {
    id: 0,
    username: '',
    email: '',
    nome: '',
    grupos: ['']
  },
  palestras: {
    id: 0,
    descricao: ''
  },
  contribuicao: {
    id: 0,
    descricao: ''
  },
  titulacao: {
    id: {
      egressoId: 0,
      titulacaoId: 0
    },
    curso: {
      id: 0,
      nome: ''
    },
    titulacao: {
      id: 0,
      nome: ''
    }
  },
  emprego: {
    id: {
      egressoId: 0,
      empresaId: 0
    },
    empresa: {
      id: 0,
      nome: '',
      setorAtuacoes: [''],
      endereco: {
        id: 0,
        cidade: '',
        estado: '',
        pais: ''
      }
    },
    faixaSalarial: {
      id: 0,
      faixa: ''
    },
    areaAtuacao: {
      id: 0,
      nome: ''
    }
  },
  depoimento: {
    id: 0,
    descricao: ''
  },
  bolsa: {
    id: 0,
    nome: ''
  },
  remuneracaoBolsa: 0
}
console.log(dataEgresso)

// const stateFolders = ref({
//   geral: {
//     isInput: false
//   },
//   localizacao: {
//     isInput: false
//   },
//   academico: {
//     isInput: false
//   },
//   carreira: {
//     isInput: false
//   },
//   adicionais: {
//     isInput: false
//   },
//   profileHead: {
//     isInput: false
//   }
// })

let jsonResponse : any
let userData : any
let egressoResponseBack: any
// fetchEgressoIfLoggedUser()
fetchUpdateEgresso()
async function fetchUpdateEgresso () {
  if (storage.has('loggedUser')) {
    userData = JSON.parse(storage.get('loggedUser'))
    console.log('Logged in')
    // dataEgresso.value.profileHead.nome = userData.nome
    // dataEgresso.value.geral.email = userData.email
    console.log('DATA')
    console.log(userData)

    // getEgresso
    egressoResponseBack = fetchEgresso()
  }

  console.log('MOUNTED async')
  console.log('Back Response:')

  let json = JSON.parse(storage.get('loggedEgresso'))
  const ResponseBack = await egressoResponseBack

  json = JSON.parse(ResponseBack)

  jsonResponse = json

  dataResquestFront.values = jsonResponse
  console.log(dataResquestFront.values)

  console.log('grupo:')
  console.log(json.usuario.grupos[0].nomeGrupo)
  console.log(json.id)
  // Cotas

  // Considerando que json.cotas retorna os ids já que acentos retornam quebrado
  // Caso contrario: cotasEgresso += json.cotas[i].nome

  let cotasEgresso = ''
  for (let i = 0; i < json.cotas.length; i++) {
    cotasEgresso += selectOpts.value.tipoCota[json.cotas[i].id - 1] + '\n'
  }
  // Email e nome vem do usuario loggado

  dataEgresso.value = {
    egressoId: json.id,
    geral:
      {
        email: userData.email,
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
        tipo: cotasEgresso || ''
      },
      bolsista: {
        value: json.bolsista,
        tipo: json.bolsa?.nome || '',
        remuneracao: json.remuneracaoBolsa || ''
      },
      posGrad: {
        value: json.posGraduacao,
        tipo: json.posGraducao || '',
        local: json.titulacao?.titulacao?.nome || '',
        curso: json.titulacao?.curso?.nome || '',
        desejaPos: json.interesseEmPos
      },
      isInput: false
    },
    carreira: {
      area: json.emprego?.areaAtuacao?.nome || '',
      setor: json.emprego?.empresa?.setorAtuacoes[0].nome || '',
      empresa: json.emprego?.empresa.nome || '',
      faixaSalarial: json.emprego?.faixaSalarial.faixa || '',
      remuneracao: '',
      isInput: false
    },
    adicionais: {
      palestras: json.palestras?.descricao,
      assuntosPalestras: json.palestras?.descricao || '',
      experiencias: json.depoimento?.descricao || '',
      contribuicoes: json.contribuicao?.descricao || '',
      isInput: false
    },
    profileHead: {
      nome: userData.nome,
      linkedin: json.linkedin || '',
      lattes: json.lattes || '',
      isInput: false
    }
  }

  return egressoStore.fetchEgresso()
}

function fetchEgresso () {
  return egressoStore.fetchEgresso()
}
</script>
