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
      <!-- <ProfileHead /> -->
      <!-- Head Start-->

      <div class="items-center flex relative w-[7000px] flex-col">
        <Form
          @submit="handleSubmitHeader"
          @invalid-submit="onInvalid"
          :validation-schema="schemaHeader"
        >
          <div class="flex flex-auto justify-center mt-[-0.25rem] ">
            <div
              class="mt-[37px] flex flex-col items-center justify-center"
              :class="{
                ['ml-[200px]']: !isPublic,
                ['ml-[110px]']: isPublic
              }"
            >
              <img
                class="w-[120px] h-[120px] rounded-full"
                src="/src/assets/profile-pic.png"
                alt="Avatar"
              >
            </div>
            <h1 class="mt-[5px] ml-[100px] ">
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
                  :value="dataEgresso.geral.genero"
                  :value-id="dataEgresso.generoId"
                  label="Gênero"
                  :options="egressoStore.generos"
                  :pre-filled="true"
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

                <!-- <CustomInput
                  class="mb-5"
                  name="academico.email"
                  :value="dataEgresso.academico.email"
                  label="Email institucional"
                  placeholder="Selecione"
                  required
                /> -->

                <!-- <CustomSelect
                  class="mb-5"
                  name="academico.tipoAluno"
                  :value="dataEgresso.academico.tipoAluno"
                  label="Tipo de Aluno"
                  placeholder="Selecione"
                  :options="selectOpts.tipoAluno"
                  v-model:value="dataEgresso.academico.tipoAluno"
                  :pre-filled="true"
                  required
                /> -->

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

                <div class="mb-5 text-sm font-semibold text-cyan-600">
                  Tipos de cota:
                </div>

                <div class="w-fit p-3 pr-5 rounded-xl bg-gray-100 mb-5">
                  <CustomCheckbox
                    class="mb-5"
                    name="academico.cotista.tipos.renda"
                    label="Cota Renda"
                    :disabled="!dataEgresso.academico.cotista.value"
                    :value="dataEgresso.academico.cotista.tipos.renda"
                    v-model:value="dataEgresso.academico.cotista.tipos.renda"
                  />
                  <CustomCheckbox
                    class="mb-5"
                    name="academico.cotista.tipos.raca"
                    label="Autodeclaração de Raça"
                    :disabled="!dataEgresso.academico.cotista.value"
                    :value="dataEgresso.academico.cotista.tipos.raca"
                    v-model:value="dataEgresso.academico.cotista.tipos.raca"
                  />

                  <CustomCheckbox
                    class="mb-5"
                    name="academico.cotista.tipos.escola"
                    label="Cota Escola"
                    :disabled="!dataEgresso.academico.cotista.value"
                    :value="dataEgresso.academico.cotista.tipos.escola"
                    v-model:value="dataEgresso.academico.cotista.tipos.escola"
                  />

                  <CustomCheckbox
                    name="academico.cotista.tipos.quilombolaIndigena"
                    label="Quilombola/Indigena"
                    :disabled="!dataEgresso.academico.cotista.value"
                    :value="dataEgresso.academico.cotista.tipos.quilombolaIndigena"
                    v-model:value="dataEgresso.academico.cotista.tipos.quilombolaIndigena"
                  />
                </div>

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
                  :value-id="dataEgresso.bolsaId"
                  label="Tipo de Bolsa"
                  placeholder="Selecione"
                  :options="egressoStore.tiposBolsa"
                  :required="dataEgresso.academico.bolsista.value"
                  :disabled="!dataEgresso.academico.bolsista.value"
                  :pre-filled="true"
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
                  label="Deseja realizar pós graduação"
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
              </div>
              <div v-else>
                <CustomSelect
                  class="mb-5"
                  name="carreira.area"
                  :value="dataEgresso.carreira.area"
                  label="Área de Atuação"
                  placeholder="Selecione"
                  v-model:value="dataEgresso.carreira.area"
                  :options="selectOpts.areaAtuacao"
                  :pre-filled="true"
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
                  :pre-filled="true"
                />
                <CustomInput
                  class="mb-5"
                  name="carreira.empresa"
                  :value="dataEgresso.carreira.empresa"
                  label="Empresa"
                  placeholder="Ex: Google"
                  :required="dataEgresso.carreira.area !== 'Desempregado'"
                  :disabled="dataEgresso.carreira.area === 'Desempregado'"
                  :pre-filled="true"
                />
                <CustomSelect
                  class="mb-5"
                  name="carreira.faixaSalarial"
                  :value="dataEgresso.carreira.faixaSalarial"
                  :value-id="dataEgresso.faixaSalarialId"
                  label="Faixa Salarial"
                  :options="egressoStore.faixasSalariais"
                  :required="dataEgresso.carreira.area !== 'Desempregado'"
                  :disabled="dataEgresso.carreira.area === 'Desempregado'"
                  :pre-filled="true"
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
                  :pre-filled="true"
                  required
                />

                <CustomSelect
                  class="mb-5"
                  name="localizacao.estado"
                  :value="dataEgresso.localizacao.estado"
                  label="Estado"
                  :options="states"
                  v-model:value="dataEgresso.localizacao.estado"
                  :pre-filled="true"
                  required
                />

                <CustomSelect
                  name="localizacao.cidade"
                  :value="dataEgresso.localizacao.cidade"
                  label="Cidade"
                  :options="cities"
                  :pre-filled="true"
                  required
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
                  label="Gostaria de apresentar palestras"
                  class="mb-5"
                  :value="dataEgresso.adicionais.palestras"
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
import { computed, ref, watch } from 'vue'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import CustomTextarea from 'src/components/CustomTextarea.vue'
import { Form } from 'vee-validate'
import { object, string, date, boolean } from 'yup'
import LocalStorage from 'src/services/localStorage'
import { useLoginStore } from 'src/store/LoginStore'
import CustomDialog from 'src/components/CustomDialog.vue'
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
  mdiCheckCircle,
  mdiAlertCircle
} from '@mdi/js'
import { useRoute } from 'vue-router'
// mdiHome CEP,
const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const $route = useRoute()
// const camposFaltosos = ref(false)

const egressoStore = usePerfilEgressoStore()
const storage = new LocalStorage()

const isPublic = computed(() => {
  return Object.keys($route.params).length === 1
})

function handleStatus (status : any) {
  if (status !== 201) {
    dialogFalha.value = true
    return false
  } else {
    dialogSucesso.value = true
    return true
  }
}

async function handleSubmitHeader (values: any) {
  // futuro add foto
  jsonResponse.usuario.nome = values.geral.nome
  jsonResponse.linkedin = values.geral.linkedin
  jsonResponse.lattes = values.geral.lattes
  // jsonResponse.emprego = null

  const status = await egressoStore.atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    await useLoginStore().saveUser()

    toggleIsInput('profileHead')
  }

  fetchUpdateEgresso()
}

async function handleSubmitGeral (values: any) {
  // dataEgresso.value.geral = values.geral

  jsonResponse.usuario.email = values.geral.email
  // ID request
  // jsonResponse.genero.nome = values.geral.genero
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
    // jsonResponse.titulacao.empresa = null
    // jsonResponse.titulacao.curso = null
  } else {
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
      // jsonResponse.titulacao.empresa.nome = values.academico.posGrad.local
      // jsonResponse.titulacao.curso.nome = values.academico.posGrad.curso
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
  if (values.carreira.area !== 'Desempregado') {
    jsonResponse.emprego.empresa.nome = values.carreira.empresa
    // setor.push(values.carreira.setor)
    jsonResponse.emprego.setorAtuacao.nome = values.carreira.setor
    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    // jsonResponse.emprego.faixaSalarial.faixa = values.carreira.faixaSalarial
    jsonResponse.emprego.faixaSalarial.id = values.carreira.faixaSalarial
    for (let i = 0; i < selectOpts.value.areaAtuacao.length; i++) {
      if (selectOpts.value.areaAtuacao[i] === values.carreira.area) {
      // jsonResponse.emprego.areaAtuacao.id = i + 1
      }
    }
  }

  const status = await egressoStore.atualizarEgresso(jsonResponse)
  if (handleStatus(status)) {
    toggleIsInput('carreira')
  }

  fetchUpdateEgresso()
}
async function handleSubmitAdicionais (values: any) {
  // dataEgresso.value.adicionais = values.adicionais
  jsonResponse.depoimento.descricao = values.adicionais.experiencias
  jsonResponse.contribuicao.descricao = values.adicionais.contribuicoes
  if (values.adicionais.palestras) {
    jsonResponse.palestras.descricao = values.adicionais.assuntosPalestras
  }
  // jsonResponse.depoimento.descricao = values.adicionais.descricao
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
    matricula: string().required().min(12).max(12),
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
  bolsaId: 0,
  areaAtuacaoId: 0,
  faixaSalarialId: 0,
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

  // areaAtuacaoId: 0,
  // depoimentoId: 0,

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
    isInput: false
  }
})

const loading = ref(true)
watch(() => dataEgresso.value.egressoId, () => {
  if (dataEgresso.value.egressoId !== 0) {
    loading.value = false
  }
})

let jsonResponse : any
let userData : any
let egressoResponseBack: any
// fetchEgressoIfLoggedUser()
fetchUpdateEgresso()
async function fetchUpdateEgresso () {
  if (storage.has('loggedUser')) {
    userData = JSON.parse(storage.get('loggedUser'))
    // dataEgresso.value.profileHead.nome = userData.nome
    // dataEgresso.value.geral.email = userData.email

    // getEgresso
    if (isPublic.value) {
      egressoResponseBack = fetchPublicEgresso(Number($route.params?.id))
    } else {
      egressoResponseBack = fetchEgresso()
    }
  }

  // console.log(egressoStore.generos)
  // const generosArray = []

  // generos.forEach(option => generosArray.push(option))

  // console.log(generosArray[0].label)

  let json = JSON.parse(storage.get('loggedEgresso'))
  const ResponseBack = await egressoResponseBack

  json = JSON.parse(ResponseBack)

  jsonResponse = json

  // Cotas

  // Considerando que json.cotas retorna os ids já que acentos retornam quebrado
  // Caso contrario: cotasEgresso += json.cotas[i].nome

  let cotasEgresso = ''
  // let cotasEgressoArr = []

  for (let i = 0; i < json.cotas.length; i++) {
    cotasEgresso += selectOpts.value.tipoCota[json.cotas[i].id - 1] + '\n'
  }

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

  dataEgresso.value = {
    egressoId: json.id,
    generoId: json.genero.id,
    bolsaId: json.bolsa?.id,
    areaAtuacaoId: json.emprego?.areaAtuacao?.id,
    faixaSalarialId: json.emprego?.faixaSalarial?.id,

    geral:
      {
        email: isPublic.value ? json.usuario.email : userData.email,
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
      nome: isPublic.value ? json.usuario.nome : userData.nome,
      linkedin: json.linkedin || '',
      lattes: json.lattes || '',
      isInput: false
    }
  }

  for (let i = 0; i < json.cotas.length; i++) {
    if (json.cotas[i].id === 1) {
      dataEgresso.value.academico.cotista.tipos.escola = true
    }
    if (json.cotas[i].id === 2) {
      dataEgresso.value.academico.cotista.tipos.renda = true
    }
    if (json.cotas[i].id === 3) {
      dataEgresso.value.academico.cotista.tipos.raca = true
    }
    if (json.cotas[i].id === 4) {
      dataEgresso.value.academico.cotista.tipos.quilombolaIndigena = true
    }
  }

  return egressoStore.fetchEgresso()
}

function fetchEgresso () {
  return egressoStore.fetchEgresso()
}

function fetchPublicEgresso (id: number) {
  return egressoStore.fetchPublicEgresso(id)
}

// watch(pais, () => {
//   form.value?.setFieldValue('localizacao.cidade', '')
//   form.value?.setFieldValue('localizacao.estado', '')
// })

// watch(estado, () => {
//   form.value?.setFieldValue('localizacao.cidade', '')
// })

</script>
