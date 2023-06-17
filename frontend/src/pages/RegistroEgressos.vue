<template>
  <div class="flex flex-col">
    <PageHeader
      back-to="/"
      :icon-path="mdiAccountSearch"
      titulo="Registro de Egressos"
    />

    <div class="flex justify-center">
      <div class="flex flex-col gap-4 sm:gap-6 w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-6 sm:p-8 mx-4 sm:mx-6 items-center">
        <SearchBar
          name="pesquisa"
          v-model="pesquisaValue"
        />

        <div class="flex flex-col sm:flex-row w-full items-start gap-4 sm:gap-8">
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
              v-for="filtro in filtersMock.filter(f => f.selected)"
              :key="filtro.id"
            >
              <FilterChip
                :title="filtro.name"
                :selected="filtro.selected"
                :selectable="filtro.selectable"
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

    <div class="flex justify-center sm:mt-8 mt-6">
      <div class="flex w-[960px] bg-white rounded-t-2xl p-6 sm:p-8 mx-4 sm:mx-6 border-gray-200 border-b-[1px]">
        <h1 class="text-cyan-800 text-lg font-semibold">
          Resultados
        </h1>
      </div>
    </div>

    <div class="flex justify-center">
      <div class="grid grid-cols-4 w-[960px] bg-white px-6 sm:px-8 py-2 sm:py-3 mx-4 sm:mx-6 border-gray-200 border-b-[1px] text-sm text-gray-400 font-normal">
        <h1 class="col-span-2">
          Nome
        </h1>

        <h1>
          Data de cadastro
        </h1>

        <h1>
          Status
        </h1>
      </div>
    </div>

    <div class="flex justify-center">
      <div class="flex flex-col w-[960px] bg-white mx-4 sm:mx-6">
        <div
          v-for="egresso in egressosMock"
          :key="egresso.id"
          class="flex justify-center"
        >
          <ItemEgresso
            :id="egresso.id"
            :nome="egresso.nome"
            :data-cadastro="egresso.dataCadastro"
            :status="egresso.status"
          />
        </div>
      </div>
    </div>
  </div>

  <div class="flex justify-center sm:mb-8 mb-6">
    <div class="flex w-[960px] bg-white rounded-b-2xl p-6 sm:p-8 mx-4 sm:mx-6" />
  </div>

  <ModalFilters
    v-if="loading"
    v-model="isModalFiltersOpen"
    :filters="filtersMock"
    @apply-filters="applyFilters"
  />
</template>

<script setup lang="ts">

import { onMounted, ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAccountSearch, mdiFilterVariant, mdiPlus } from '@mdi/js'

import PageHeader from 'src/components/PageHeader.vue'
import ItemEgresso from 'src/components/ItemEgresso.vue'
import SearchBar from 'src/components/SearchBar.vue'
import FilterChip from 'src/components/FilterChip.vue'
import ModalFilters from 'src/components/ModalFilters.vue'
// import { useAnuncioVagaStore } from 'src/store/AnuncioVagaStore'

// const $store = useAnuncioVagaStore()
const pesquisaValue = ref('')
const loading = ref(false)
const filtersById = ref([])

const isModalFiltersOpen = ref(false)

onMounted(async () => {
  // await $store.fetchAreasEmprego()

  loading.value = true
})

const openModalFilters = () => {
  isModalFiltersOpen.value = true
}

const toggleFilterApplied = (id:number) => {
  // const filtro = $store.areasEmpregoFiltros.find(f => f.id === id)

  const filtro = filtersMock.find(f => f.id === id)

  if (filtro) {
    filtro.selected = !filtro.selected
    applyFilters(filtersById.value.filter(f => f === filtro.id))
  }
}

const applyFilters = (filters:any) => {
  filtersById.value = filters.map((elem: any) => (elem.id))
}

const filtersMock = [
  {
    id: 1,
    name: 'Ativo',
    selected: false,
    selectable: true
  },
  {
    id: 2,
    name: 'Pendente',
    selected: false,
    selectable: true
  },
  {
    id: 3,
    name: 'Incompleto',
    selected: false,
    selectable: true
  }
]

const egressosMock = [
  {
    id: 1,
    nome: 'Victor Hugo Machado da Silva',
    dataCadastro: '2023-06-10',
    status: 'Ativo'
  },
  {
    id: 2,
    nome: 'Marcus Huriel Lira Loureiro',
    dataCadastro: '2023-06-10',
    status: 'Pendente'
  },
  {
    id: 3,
    nome: 'Vitória Nauanda Braz Rodrigues',
    dataCadastro: '2023-06-10',
    status: 'Incompleto'
  }
]

</script>
