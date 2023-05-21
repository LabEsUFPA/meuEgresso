<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-8 mt-10 mx-6 items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiBullhorn"
          />
          <h1 class="text-3xl font-bold">
            Vagas de emprego
          </h1>
        </div>

        <CustomButton
          tag="router"
          link="/cadastro-anuncio"
          color="emerald"
          text-class="text-white font-medium"
        >
          <div>
            Anuncie uma vaga
          </div>
          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiChevronRight"
          />
        </CustomButton>
      </div>
    </div>

    <div class="flex flex-col gap-8 mb-10">
      <div class="flex justify-center">
        <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-2 mx-6 items-center">
          <div class="flex w-full px-8 py-4">
            <SearchBar :pesquisa-value="pesquisaValue" />
          </div>

          <div class="flex flex-col sm:flex-row w-full items-start gap-4 sm:gap-8 px-8 pt-4 pb-8">
            <div class="flex gap-4 text-cyan-800 items-center">
              <SvgIcon
                type="mdi"
                size="24"
                :path="mdiFilterVariant"
              />
              <p class="font-medium text-lg">
                Filtros
              </p>
            </div>

            <div class="flex flex-wrap gap-4">
              <div
                v-for="filtro in filtrosAreaEmprego.filter(f => f.applied)"
                :key="filtro.id"
              >
                <FilterChip
                  :title="filtro.name"
                  :applied="filtro.applied"
                  @click="toggleFilterApplied(filtro.id)"
                />
              </div>

              <button
                class="flex gap-3 px-4 py-2 rounded-3xl items-center text-cyan-800 bg-gray-200 font-medium"
                @click="openModalFilters()"
              >
                <SvgIcon
                  type="mdi"
                  size="16"
                  :path="mdiPlus"
                />
                <p class="text-sm">
                  Adicionar filtro
                </p>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div
        v-for="anuncio in anuncios"
        :key="anuncio.id"
        class="flex justify-center"
      >
        <ShortPost
          :id="anuncio.id"
          :nome="anuncio.nome"
          :titulo="anuncio.titulo"
          :area="anuncio.area"
          :descricao="anuncio.descricao"
          :salario="anuncio.salario"
        />
      </div>
    </div>
  </div>

  <ModalFilters
    v-model="isModalFiltersOpen"
    :filters="filtrosAreaEmprego"
    :apply-filters="applyFilters"
  />
</template>

<script setup lang="ts">

import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBullhorn, mdiFilterVariant, mdiPlus, mdiChevronRight } from '@mdi/js'

import CustomButton from 'src/components/CustomButton.vue'
import ShortPost from 'src/components/ShortPost.vue'
import SearchBar from 'src/components/SearchBar.vue'
import FilterChip from 'src/components/FilterChip.vue'
import ModalFilters from 'src/components/ModalFilters.vue'

const filtrosAreaEmprego = ref([
  { id: 1, name: 'Engenharia de Software', applied: false },
  { id: 2, name: 'Programação', applied: false },
  { id: 3, name: 'Suporte em TI', applied: false },
  { id: 4, name: 'Analista de Sistemas', applied: false },
  { id: 5, name: 'Analista de QA', applied: false },
  { id: 6, name: 'Outros', applied: false }
])

const anuncios = [
  {
    id: 1,
    nome: 'Victor Silva',
    titulo: 'Vaga Front-end',
    area: 'Programador',
    descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    salario: 1000.0,
    linkContato: 'https://www.google.com.br',
    dataExpiracao: '2023-08-01'
  },
  {
    id: 2,
    nome: 'Marcus Loureiro',
    titulo: 'Vaga Back-end',
    area: 'Programador',
    descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    salario: 1200.0,
    linkContato: 'https://www.google.com.br',
    dataExpiracao: '2023-08-01'
  }
]

const pesquisaValue = ref('')

const isModalFiltersOpen = ref(false)

const openModalFilters = () => {
  isModalFiltersOpen.value = true
}

const toggleFilterApplied = (id:number) => {
  const filtro = filtrosAreaEmprego.value.find(f => f.id === id)
  if (filtro) {
    filtro.applied = !filtro.applied
  }
}

const applyFilters = (filters:any) => {
  filtrosAreaEmprego.value = filters
}

</script>
