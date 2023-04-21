<template>
  <div class="flex-1 h-[3840px] items-center justify-center bg-neutral-100">
    <div
      class="flex place-items-center justify-between flex-wrap relative w-full h-[30rem] pin-t bg-gradient-to-b from-sky-200 to-indigo-200"
    >
      <!-- <ProfileHead /> -->
      <!-- Head Start-->
      <div class="items-center flex relative w-[7000px] flex-col">
        <div class="flex flex-auto justify-center mt-[7.3rem]">
          <img
            class="img-profile ml-[207px]"
            src="/src/assets/profile-pic.png"
            alt="Avatar"
          >
          <h1 class="ml-[100px] sm:max-xl:ml[80px]">
            <CustomButtonLink
              label="Editar"
              icon-path="/src/assets/edit.svg"
              url="/Perfil"
              color="whitesky"
              classimg="filter-sky"
            />
          </h1>
        </div>
        <h1 class="text-sky-900 text-xl font-bold mt-5">
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
            icon-size="30"
          />
          <CustomButtonLink
            label="Lattes"
            icon-path="/src/assets/lattes.svg"
            :url="data.geral.lattes"
            placeholder="https://lattes.cnpq.br/"
            color="whitesky"
            variant="standard"
            icon-size="30"
          />
        </div>
      </div>
      <!-- Head End-->
      <div class="w-full mt-[55px]">
        <!-- <ProfileBodyView /> -->
        <!-- Body Start -->
        <div class="container mx-auto p-3 pb-0">
          <form @submit="handleSubmit($event)">
            <FolderSection>
              <template #EditButton>
                <h1 class="relative">
                  <CustomButtonLink
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    url="/Perfil"
                    color="invisiblesky"
                    classimg="filter-sky"
                    :has-shadow="false"
                    icon-size="20"
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
                <div>
                  <!-- Talvez problema com v-model -->
                  <CustomPerfilData
                    class="mb-5"
                    v-model="data.geral.nome"
                    vmodel="data.geral.nome"
                    placeholder="Masculino"
                    label="Gênero"
                    :icon-path="mdiAccount"
                    :isinput="false"
                  />

                  <CustomPerfilData
                    class="mb-5"
                    v-model="data.geral.email"
                    vmodel="data.geral.email"
                    label="Email"
                    :icon-path="mdiEmail"
                  />

                  <CustomPerfilData
                    class="mb-1"
                    v-model="data.geral.nascimento"
                    vmodel="data.geral.nascimento"
                    label="Data Nascimento"
                    placeholder="mm/dd/yyyy"
                    :icon-path="mdiCake"
                  />
                </div>
              </template>
            </FolderSection>

            <FolderSection class="mt-6">
              <template #EditButton>
                <h1 class="relative">
                  <CustomButtonLink
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    url="/Perfil"
                    color="invisiblesky"
                    classimg="filter-sky"
                    :has-shadow="false"
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
                <div>
                  <CustomPerfilData
                    class="mb-5"
                    vmodel="data.localizacao.cep"
                    v-model="data.localizacao.cep"
                    label="CEP"
                    placeholder="00000-000"
                    mask="#####-###"
                    :icon-path="mdiHome"
                  />

                  <CustomPerfilData
                    class="mb-5"
                    vmodel="data.localizacao.pais"
                    v-model="data.localizacao.pais"
                    placeholder="Brasil"
                    label="País"
                    :icon-path="mdiWeb"
                  />

                  <CustomPerfilData
                    class="mb-5"
                    vmodel="data.localizacao.estado"
                    v-model="data.localizacao.estado"
                    label="Estado"
                    placeholder="Pará"
                    :icon-path="mdiMapOutline"
                  />

                  <CustomPerfilData
                    class="mb-1"
                    vmodel="data.localizacao.cidade"
                    v-model="data.localizacao.cidade"
                    label="Cidade"
                    placeholder="Belém"
                    :icon-path="mdiMapMarkerRadius"
                  />
                </div>
              </template>
            </FolderSection>

            <FolderSection class="mt-6">
              <template #EditButton>
                <h1 class="relative">
                  <CustomButtonLink
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    url="/Perfil"
                    color="invisiblesky"
                    classimg="filter-sky"
                    :has-shadow="false"
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
                <div>
                  <!-- class="mb-1"
            v-model="data.localizacao.cidade"
            label="Cidade"
            placeholder="Belém"
            :icon-path="mdiMapMarkerRadius""
          /> -->
                  <CustomPerfilData
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
                    class="mb-5"
                    vmodel="data.academico.cotista.tipo"
                    v-model="data.academico.cotista.tipo"
                    label="Cota"
                    placeholder="Tipo de cota"
                    icon-path=""
                  />

                  <CustomPerfilData
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
                    class="mb-5"
                    vmodel="data.academico.posGrad.curso"
                    v-model="data.academico.posGrad.curso"
                    label="Curso"
                    placeholder="Curso de pós-graduação"
                    icon-path=""
                  />

                  <CustomPerfilData
                    class="mb-5"
                    vmodel="data.academico.posGrad.local"
                    v-model="data.academico.posGrad.local"
                    label="Local da pós-graduação"
                    placeholder="UFPA"
                    icon-path=""
                  />

                  <CustomPerfilData
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
              </template>
            </FolderSection>

            <FolderSection class="mt-6">
              <template #EditButton>
                <h1 class="relative">
                  <CustomButtonLink
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    url="/Perfil"
                    color="invisiblesky"
                    classimg="filter-sky"
                    :has-shadow="false"
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
                <div>
                  <CustomPerfilData
                    class="mb-10"
                    vmodel="data.carreira.area"
                    v-model="data.carreira.area"
                    label="Area de Atuação"
                    placeholder="Área"
                    icon-path=""
                  />

                  <CustomPerfilData
                    class="mb-10"
                    vmodel="data.carreira.setor"
                    v-model="data.carreira.setor"
                    label="Setor de Atuação"
                    placeholder="Setor"
                    icon-path=""
                  />

                  <CustomPerfilData
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
              </template>
            </FolderSection>

            <FolderSection class="mt-6">
              <template #EditButton>
                <h1 class="relative">
                  <CustomButtonLink
                    label="Editar"
                    icon-path="/src/assets/edit.svg"
                    url="/Perfil"
                    color="invisiblesky"
                    classimg="filter-sky"
                    :has-shadow="false"
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
                <div>
                  <CustomPerfilData
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
              </template>
            </FolderSection>
            <div class="py-10 flex flex-row justify-center items-center" />
          </form>
        </div>
        <!-- Body End-->
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
// import ProfileHead from 'src/components/ProfileHead.vue'
// import ProfileBodyView from 'src/components/ProfileBodyView.vue'
import CustomButtonLink from 'components/CustomButtonLink.vue'

import FolderSection from 'src/components/FolderSection.vue'

import CustomPerfilData from 'src/components/CustomPerfilData.vue'
import SvgIcon from '@jamescoyle/vue-icon'
// import SvgIcon from '@jamescoyle/vue-icon'
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool,
  mdiCake,
  mdiHome,
  mdiWeb,
  mdiMapOutline,
  mdiMapMarkerRadius
} from '@mdi/js'
import { ref } from 'vue'

const data = ref({
  geral: {
    nome: '',
    nascimento: '',
    email: '',
    confirmacaoEmail: '',
    linkedin: '',
    lattes: ''
  },
  localizacao: {
    cep: '',
    pais: '',
    estado: '',
    cidade: ''
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
    }
  },
  carreira: {
    area: '',
    setor: '',
    empresa: '',
    faixaSalarial: '',
    remuneracao: ''
  },
  adicionais: {
    palestras: false,
    assuntosPalestras: '',
    experiencias: '',
    contribuicoes: ''
  }
})
// import FolderSection from 'components/FolderSection.vue'
// import CadastroEgresso from 'src/pages/CadrastroEgresso.vue';

// import Profile from 'components/Profile.vue'
</script>
<style>
.img-profile {
  width: 190px;
  height: 190px;
  border-radius: 50%;
}

/* .link-button {
  align-items: flex-start;
  display: flex;
  gap: 10px;
  justify-content: center;
  margin-top: 35px;
  position: relative;
  width: 295px;
} */
</style>
