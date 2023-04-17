<template>
  <div class="container mx-auto p-3 pb-0">
    <form @submit="handleSubmit($event)">
      <h1 class="text-cyan-800 text-2xl font-semibold">Cadastro de egresso</h1>
      <FolderSection>
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

            <CustomInput v-model="data.geral.lattes" label="Curriculo Lattes" />
          </div>
        </template>
      </FolderSection>

      <FolderSection class="mt-6">
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
            <CustomInput
              class="mb-5"
              v-model="data.localizacao.cep"
              label="CEP"
              placeholder="00000-000"
              mask="#####-###"
            />

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

            <CustomInput
              class="mb-5"
              v-model="data.carreira.faixaSalarial"
              label="Faixa Salarial"
              placeholder="Selecione"
            />

            <CustomInput
              v-model="data.carreira.remuneracao"
              label="Valor da remuneração mensal"
              placeholder="Selecione"
            />
          </div>
        </template>
      </FolderSection>

      <FolderSection class="mt-6">
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
            <CustomCheckbox
              v-model="data.adicionais.palestras"
              label="Gostaria de apresentar palestras"
              class="mb-5"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para listar aqueles assuntos que melhor você se
              sente para apresentar palestras:
            </div>

            <textarea
              class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
              v-model="data.adicionais.assuntosPalestras"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para de forma simples e resumida compartilhar
              com outras pessoas experiências positivas ao realizar o curso:
            </div>

            <textarea
              class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
              v-model="data.adicionais.experiencias"
            />

            <div class="mb-5 text-sm font-semibold text-cyan-600">
              Use o campo abaixo para que todos possam ter conhecimento sobre
              suas contribuições para a sociedade seja pequena ou grande, pois
              tudo tem seu impacto:
            </div>

            <textarea
              class="px-2 py-0.5 mb-5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block"
              v-model="data.adicionais.contribuicoes"
            />
          </div>
        </template>
      </FolderSection>
      <div class="py-10 flex flex-row justify-center items-center">
        <CustomButton color="emerald" type="submit"> Salvar </CustomButton>
      </div>
    </form>
  </div>
</template>

<script lang="ts" setup>
import FolderSection from "src/components/FolderSection.vue";
import CustomInput from "src/components/CustomInput.vue";
import CustomCheckbox from "src/components/CustomCheckbox.vue";
import CustomButton from "src/components/CustomButton.vue";
import CustomSelect from "src/components/CustomSelect.vue";
import SvgIcon from "@jamescoyle/vue-icon";
import {
  mdiAccount,
  mdiBriefcase,
  mdiEmail,
  mdiMapMarker,
  mdiMessage,
  mdiSchool,
} from "@mdi/js";
import { ref } from "vue";

const data = ref({
  geral: {
    nome: "",
    nascimento: "",
    email: "",
    confirmacaoEmail: "",
    linkedin: "",
    lattes: "",
  },
  localizacao: {
    cep: "",
    pais: "",
    estado: "",
    cidade: "",
  },
  academico: {
    matricula: "",
    email: "",
    tipoAluno: "",
    cotista: {
      value: false,
      tipo: "",
    },
    bolsista: {
      value: false,
      tipo: "",
      remuneracao: "",
    },
    posGrad: {
      value: false,
      tipo: "",
      local: "",
      curso: "",
    },
  },
  carreira: {
    area: "",
    setor: "",
    empresa: "",
    faixaSalarial: "",
    remuneracao: "",
  },
  adicionais: {
    palestras: false,
    assuntosPalestras: "",
    experiencias: "",
    contribuicoes: "",
  },
});

const selectOpts = ref({
  pais: ["Brasil", "Espanha", "Reino Unido", "China"],
  estado: ["Pará", "Rio Grande do Norte", "São Paulo", "Ceara"],
  cidade: ["Belém", "Ananideua", "Natal", "Fortaleza"],
});

function handleSubmit($event: Event) {
  $event.preventDefault();
  console.log(data.value);
}
</script>
