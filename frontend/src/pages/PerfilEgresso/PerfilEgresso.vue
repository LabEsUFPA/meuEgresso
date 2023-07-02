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
          <h1 class="absolute flex flex-auto top-[15px] right-[10px] sm:right-[20%]">
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

          <div
            class="absolute flex flex-auto justify-center items-center top-[-15px] mb-12 left-[41.5%]"
            v-if="errorLocation === 'header'"
          >
            <div
              class="flex flex-col items-center mx-auto z-10 "
            >
              <InvalidInsert
                :text="errorText"
                :show-alert="error"
              />
            </div>
          </div>
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
          <div class="flex justify-center items-center h-full">
            <div
              class="flex flex-col items-center  mx-auto z-10"
              v-if="errorLocation === 'geral'"
            >
              <InvalidInsert
                :text="errorText"
                :show-alert="error"
              />
            </div>
          </div>
          <FolderSection
            class="mb-5"
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
                  :options="$store.generos"
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
                <CustomDatepicker
                  class="mb-5"
                  name="geral.nascimento"
                  :icon-path="mdiCalendarEdit"
                  :max-date="eighteenYearsAgo"
                  :min-date="minDate"
                  custom-label
                  required
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
          <div class="flex justify-center items-center h-full">
            <div
              class="flex flex-col items-center  mx-auto z-10"
              v-if="errorLocation === 'academico'"
            >
              <InvalidInsert
                :text="errorText"
                :show-alert="error"
              />
            </div>
          </div>

          <FolderSection>
            <template #EditButton>
              <h1 class="relative static">
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
            <template #default>
              <div v-if="!dataEgresso.academico.isInput">
                <CustomPerfilData
                  type="number"
                  class="mb-5"
                  :vmodel="dataEgresso.academico.matricula"
                  name="academico.matricula"
                  label="Matrícula"
                  placeholder="Ex: 205004940001"
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
                  :vmodel="dataEgresso.academico.bolsista.tipo"
                  name="academico.bolsista.tipo"
                  label="Tipo de Bolsa"
                  placeholder="Selecione"
                  icon-path=""
                />
                <CustomPerfilData
                  type="text"
                  class="mb-5"
                  :vmodel="dataEgresso.academico.bolsista.remuneracao"
                  name="academico.bolsista.remuneracao"
                  label="Remuneração da bolsa"
                  placeholder="Selecione"
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
                  class="mb-5"
                  :vmodel="dataEgresso.academico.posGrad.curso"
                  name="academico.posGrad.curso"
                  label="Curso"
                  placeholder="Curso de pós-graduação"
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
                    class="mb-5"
                    name="academico.cotista.tipos.quilombolaIndigena"
                    label="Quilombola/Indigena"
                    :required="bools.cotista"
                    :disabled="!bools.cotista"
                  />
                  <CustomCheckbox
                    class="mb-6"
                    name="academico.cotista.tipos.pcd"
                    label="PCD"
                    :required="bools.cotista"
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
                  :placeholder="placeHolders.bolsaNome"
                  :options="$store.tiposBolsa"
                  :required="bools.bolsista"
                  :disabled="!bools.bolsista"
                  :pre-filled="true"
                />

                <CustomInput
                  class="mb-7"
                  name="academico.bolsista.remuneracao"
                  label="Remuneração da bolsa"
                  type="number"
                  step="0.01"
                  placeholder="R$ 0,00"
                  :max-length="12"
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
                  :pre-filled="true"
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
                  :pre-filled="true"
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
                  label="Desejo realizar pós graduação"
                  v-if="!bools.posGrad"
                />
              </div>
            </template>
          </FolderSection>
          <Form
            ref="formCarreira"
            @submit="handleSubmitCarreira"
            @invalid-submit="onInvalid"
            :validation-schema="schemaCarreira"
          >
            <div class="flex justify-center items-center h-full">
              <div
                class="flex flex-col items-center  mx-auto z-10"
                v-if="errorLocation === 'carreira'"
              >
                <InvalidInsert
                  :text="errorText"
                  :show-alert="error"
                />
              </div>
            </div>
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
                  class="mb-7"
                  :vmodel="dataEgresso.carreira.area"
                  name="carreira.area"
                  label="Área de Atuação"
                  placeholder="Área"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-7"
                  :vmodel="dataEgresso.carreira.setor"
                  name="carreira.setor"
                  label="Setor de Atuação"
                  placeholder="Setor"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-7"
                  :vmodel="dataEgresso.carreira.empresa"
                  name="carreira.empresa"
                  label="Empresa Atual"
                  placeholder="Empresa"
                  icon-path=""
                />

                <CustomPerfilData
                  type="text"
                  class="mb-7"
                  :vmodel="dataEgresso.localizacao.pais"
                  name="carreira.pais"
                  placeholder="Brasil"
                  label="País"
                  :icon-path="mdiWeb"
                />

                <CustomPerfilData
                  type="text"
                  class="mb-7"
                  :vmodel="dataEgresso.localizacao.estado"
                  name="carreira.estado"
                  label="Estado"
                  placeholder="Pará"
                  :icon-path="mdiMapOutline"
                />

                <CustomPerfilData
                  type="text"
                  class="mb-7"
                  :vmodel="dataEgresso.localizacao.cidade"
                  label="Cidade"
                  placeholder="Belém"
                  :icon-path="mdiMapMarkerRadius"
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
              </template>
              <template #local>
                <LocalizacaoSelect
                  :pais-holder="dataEgresso.localizacao.pais"
                  :estado-holder="dataEgresso.localizacao.estado"
                  :cidade-holder="dataEgresso.localizacao.cidade"
                  :pre-filled="true"
                />
              </template>
            </FolderCarreira>
          </Form>
          <Form
            ref="formAdicionais"
            @submit="handleSubmitAdicionais"
            @invalid-submit="onInvalid"
            :validation-schema="schemaAdicionais"
          >
            <div class="flex justify-center items-center h-full">
              <div
                class="flex flex-col items-center  mx-auto z-10"
                v-if="errorLocation === 'adicionais'"
              >
                <InvalidInsert
                  :text="errorText"
                  :show-alert="error"
                />
              </div>
            </div>

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
                  :vmodel="dataEgresso.adicionais.assuntosPalestras"
                  name="adicionais.palestras"
                  label="Assuntos Palestras"
                  placeholder="Lorem ipsum dolor sit amet, consect
                  etur adipiscing elit, sed do eiusmod tempor incididun
                  t ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis n
                  ostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                  icon-path=""
                />
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

<script setup lang="ts">
import CustomButtonLink from './components/CustomButtonLink.vue'
import ButtonEdit from './components/ButtonEdit.vue'
import FolderSection from 'src/components/FolderSection.vue'
import CustomInput from 'src/components/CustomInput.vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import CustomDatepicker from 'src/components/CustomDatepicker.vue'
import LocalizacaoSelect from 'src/components/LocalizacaoSelect.vue'
import CustomButton from 'src/components/CustomButton.vue'

import CustomPerfilData from './components/CustomPerfilData.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomSelect from 'src/components/CustomSelect.vue'

import { computed, ref, watch, onMounted } from 'vue'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'

import { Form } from 'vee-validate'
import { object, string, boolean } from 'yup'
import LocalStorage from 'src/services/localStorage'
import CustomDialog from 'src/components/CustomDialog.vue'
import InvalidInsert from 'src/components/InvalidInsert.vue'

import FolderCarreira from './components/FolderCarreira.vue'
import FolderAdicionais from './components/FolderAdicionais.vue'
import ProfileImage from './components/ProfileImage.vue'
import {
  mdiAccount,
  mdiEmail,
  mdiCake,
  mdiWeb,
  mdiMapOutline,
  mdiMapMarkerRadius,
  mdiLinkVariant,
  mdiCheckCircle,
  mdiAlertCircle,
  mdiAlertCircleOutline,
  mdiSchool,
  mdiLoading,
  mdiCalendarEdit
} from '@mdi/js'
import { useRoute } from 'vue-router'
const dialogSucesso = ref(false)
const dialogFalha = ref(false)
const $route = useRoute()
const $storeCadastro = useCadastroEgressoStore()
const $store = usePerfilEgressoStore()
const egressoStore = usePerfilEgressoStore()

const dialogInstituicao = ref(false)
const dialogCurso = ref(false)

const storage = new LocalStorage()
const formHeader = ref<typeof Form | null>(null)
const formGeral = ref<typeof Form | null>(null)
const formAcademico = ref<typeof Form | null>(null)
const formCarreira = ref<typeof Form | null>(null)
const formAdicionais = ref<typeof Form | null>(null)
const missingDigits = ref(0)
const loading = ref(true)

const error = ref(false)
const errorLocation = ref('')
const errorText = ref('')

const minDate = ref(new Date(-8640000000000000))
const eighteenYearsAgo = ref(new Date())
eighteenYearsAgo.value.setFullYear(eighteenYearsAgo.value.getFullYear() - 18)

const checkRegistrationLength = ($event: Event) => {
  missingDigits.value = 12 - String($event).length
}

//
const stagedChanges = ref({
  profileHead: {
    removedImage: false
  }
})

// if (storage.has('loggedEgresso')) {
$store.fetchAll()

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

function handleStatus (response: any, folderLocation: string) {
  if (response.status !== 201) {
    dialogFalha.value = true
    errorText.value = response.data?.message ? response.data.message : 'Ocorreu um problema na requisição'
    error.value = true
    errorLocation.value = folderLocation
    return false
  } else {
    dialogSucesso.value = true
    return true
  }
}
async function handleSubmitHeader (values: any) {
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

  const response = await atualizarEgresso(jsonResponse)
  let responseImage: any
  if (stagedChanges.value.profileHead.removedImage) {
    responseImage = await removeImageEgresso()
    stagedChanges.value.profileHead.removedImage = false
  } else {
    responseImage = await profileImageSave()
  }

  if (response.status === 201 && (responseImage === 201 || responseImage === 200 || responseImage === 204)) {
    dialogSucesso.value = true

    toggleIsInput('profileHead')
    await fetchUpdateEgresso()
  } else {
    errorText.value = response.data?.message ? response.data?.message : 'Ocorreu um problema na requisição'
    error.value = true
    errorLocation.value = 'header'
    dialogFalha.value = true
  }
}

async function handleSubmitGeral (values: any) {
  jsonResponse.usuario.email = values.geral.email
  // ID request
  jsonResponse.genero.id = values.geral.genero
  jsonResponse.nascimento = values.geral.nascimento
  const status = await atualizarEgresso(jsonResponse)
  if (handleStatus(status, 'geral')) {
    toggleIsInput('geral')
    await fetchUpdateEgresso()
  }
}

async function handleSubmitAcademico (values: any) {
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
          id: values.academico.posGrad.local

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

  if (handleStatus(status, 'academico')) {
    toggleIsInput('academico')
    await fetchUpdateEgresso()
  }
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
      endereco: {
        cidade: jsonResponse.emprego.empresa.cidade,
        estado: jsonResponse.emprego.empresa.estado,
        pais: jsonResponse.emprego.empresa.pais
      },
      empresa: {
        id: 1,
        nome: '',
        faixaSalarial: {
          id: 2
        },

        isEmprego: true
      }

    }
  }
  if (values.carreira.area !== 'Desempregado') {
    jsonResponse.emprego.empresa.nome = values.carreira.empresa
    jsonResponse.emprego.setorAtuacao.nome = values.carreira.setor

    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    jsonResponse.emprego.faixaSalarial.id = values.carreira.faixaSalarial
    const endereco = {
      pais: values.carreira.pais,
      estado: values.carreira.estado,
      cidade: values.carreira.cidade
    }
    jsonResponse.emprego.endereco = endereco
  } else {
    jsonResponse.emprego.areaAtuacao.nome = values.carreira.area
    jsonResponse.emprego = null
  }

  const status = await atualizarEgresso(jsonResponse)
  if (handleStatus(status, 'carreira')) {
    toggleIsInput('carreira')
    await fetchUpdateEgresso()
  }
}
async function handleSubmitAdicionais (values: any) {
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
  if (handleStatus(status, 'adicionais')) {
    toggleIsInput('adicionais')
    await fetchUpdateEgresso()
  }
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
  errorLocation.value = ''
  isInputLocal = !isInputLocal
}

//

const selectOpts = ref({
  tipoAluno: ['Graduação', 'Pós-graduação'],
  areaAtuacao: ['Desempregado', 'Computação', 'Pesquisa', 'Programador', 'Analista', 'Outros'],
  setorAtuacao: ['Empresarial', 'Público', 'Terceiro Setor', 'Magistério/Docência', 'Outros']
})
function onInvalid (e: any) {
  // updateEgressoDataModel(e)
  console.log(e)
}

const dataEgresso = ref({
  egressoId: 0,
  generoId: 0,
  bolsaId: 0,
  areaAtuacaoId: 0,
  faixaSalarialId: 0,
  localPosId: 0,
  cursoId: 0,
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

watch(() => dataEgresso.value.egressoId, () => {
  if (dataEgresso.value.egressoId !== 0) {
    loading.value = false
    fetchUpdateEgresso()
  }
})

let jsonResponse: any
let egressoResponseBack: any

let egressoImageResponse : any
let imageEgressoUrl: string
imageEgressoUrl = ''
async function handleEgressoImage (id : string) {
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

async function fetchUpdateEgresso () {
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
  imageEgressoUrl = await handleEgressoImage(json.id)
  for (const element of json.cotas) {
    $store.tiposCota.forEach(option => {
      if (option.value === element.id) {
        cotasEgresso += option.label + '\n'
      }
    })
  }
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
      pais: json.emprego?.empresa?.endereco?.pais || json.emprego?.endereco?.pais || '',
      estado: json.emprego?.empresa?.endereco?.estado || json.emprego?.endereco?.estado || '',
      cidade: json.emprego?.empresa?.endereco?.cidade || json.emprego?.endereco?.cidade || '',
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
        remuneracao: json.remuneracaoBolsa ? 'R$ ' + json.remuneracaoBolsa : ''
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
  const dateParts = dataEgresso.value.geral.nascimento.split('-')
  const year = parseInt(dateParts[0])
  const month = parseInt(dateParts[1]) - 1
  const day = parseInt(dateParts[2])

  formGeral.value?.setValues({

    'geral.nascimento': new Date(year, month, day),
    'geral.email': dataEgresso.value.geral.email,
    // passa Id para o select
    'geral.genero': dataEgresso.value.generoId
  })

  formAcademico.value?.setValues({
    academico: dataEgresso.value.academico,
    'academico.bolsista.tipo': dataEgresso.value.bolsaId,
    'academico.posGrad.curso': dataEgresso.value.cursoId,
    'academico.posGrad.local': dataEgresso.value.localPosId
  })
  formCarreira.value?.setValues({
    carreira: dataEgresso.value.carreira,
    'carreira.faixaSalarial': dataEgresso.value.faixaSalarialId,
    'carreira.pais': dataEgresso.value.localizacao.pais,
    'carreira.estado': dataEgresso.value.localizacao.estado,
    'carreira.cidade': dataEgresso.value.localizacao.cidade
  })

  formAdicionais.value?.setValues({
    adicionais: dataEgresso.value.adicionais
  })
  return json
}
let estadoInput = document.querySelector('.carreira-estado') as HTMLInputElement
let cidadeInput = document.querySelector('.carreira-cidade') as HTMLInputElement

onMounted(() => {
  estadoInput = document.querySelector('.carreira-estado') as HTMLInputElement

  cidadeInput = document.querySelector('.carreira-cidade') as HTMLInputElement
  watch(() => dataEgresso.value.localizacao.pais, (newValue) => {
    formCarreira.value?.setFieldValue('carreira.cidade', '')
    formCarreira.value?.setFieldValue('carreira.estado', '')
    if (formCarreira.value) {
      dataEgresso.value.localizacao.cidade = ''
    }
    setTimeout(() => {
      if (cidadeInput?.value) {
        cidadeInput.value = ''
        estadoInput.value = ''
      }
    }, 10)
  })

  watch(() => dataEgresso.value.localizacao.estado, (newValue) => {
    formCarreira.value?.setFieldValue('carreira.cidade', '')
    if (formCarreira.value) {
      dataEgresso.value.localizacao.cidade = ''
    }
    setTimeout(() => {
      if (cidadeInput?.value) {
        cidadeInput.value = ''
      }
    }, 10)
  })
})

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
        const date = value.split('/').reverse().join('-')
        const inputDate = new Date(date)

        return inputDate >= minDate.value && inputDate <= eighteenYearsAgo.value
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
function fetchPublicEgresso (id: number) {
  if (isSuperUser.value) {
    return egressoStore.fetchAdminEgresso(id)
  }
  return egressoStore.fetchPublicEgresso(id)
}
async function atualizarEgresso (data : any) {
  if (isSuperUser.value) {
    return egressoStore.atualizarEgressoAdmin(data, Number($route.params?.id))
  }
  return await egressoStore.atualizarEgresso(data)
}
async function removeImageEgresso () {
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
async function softRemoveImageEgresso () {
  stagedChanges.value.profileHead.removedImage = true
  dataEgresso.value.profileHead.image = ' '
}

watch(() => dataEgresso.value.profileHead.image, (newValue) => {
  dataEgresso.value.profileHead.image = newValue
})

</script>
