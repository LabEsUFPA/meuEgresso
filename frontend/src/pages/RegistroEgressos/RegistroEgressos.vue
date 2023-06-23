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
          :placeholder="'Pesquisar egresso'"
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
              v-for="filtro in filtrosStatus.filter(f => f.selected)"
              :key="filtro.id"
            >
              <FilterChip
                :title="capitalize(filtro.name)"
                :selected="filtro.selected"
                selectable
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

    <div
      v-if="$store.egressos.length > 0"
    >
      <div class="hidden sm:flex justify-center">
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
            v-for="egresso in $store.egressos"
            :key="egresso.id"
            class="flex justify-center"
          >
            <ItemEgresso
              :id="egresso.id"
              :id-egresso="egresso.idEgresso"
              :nome="egresso.name"
              :data-cadastro="egresso.cadastro"
              :status="egresso.status"
              :foto="egresso.foto"
              :email="egresso.email"
              @update-data="() => updateData()"
            />
          </div>
        </div>
      </div>
    </div>

    <div
      v-else
      class="flex justify-center"
    >
      <div class="flex flex-col w-[960px] bg-white mx-4 sm:mx-6">
        <div
          class="flex flex-col gap-4 py-8 justify-center items-center text-gray-400"
        >
          <SvgIcon
            type="mdi"
            size="48"
            :path="mdiEmoticonSadOutline"
          />
          <h1 class="text-xl sm:text-2xl font-medium">
            Nenhum egresso encontrado
          </h1>
        </div>
      </div>
    </div>

    <div class="flex justify-center sm:mb-8 mb-6">
      <div class="flex w-[960px] bg-white rounded-b-2xl p-6 sm:p-8 mx-4 sm:mx-6 justify-center">
        <PageSelector
          v-model:current-page="currentPage"
          :total-pages="$store.totalPages"
        />
      </div>
    </div>

    <ModalFilters
      v-if="loading"
      v-model="isModalFiltersOpen"
      :filters="filtrosStatus"
      @apply-filters="applyFilters"
    />
  </div>
</template>

<script setup lang="ts">

import { onMounted, ref, watch, capitalize } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAccountSearch, mdiFilterVariant, mdiEmoticonSadOutline, mdiPlus } from '@mdi/js'

import PageHeader from 'src/components/PageHeader.vue'
import ItemEgresso from './components/ItemEgresso.vue'
import SearchBar from 'src/components/SearchBar.vue'
import FilterChip from 'src/components/FilterChip.vue'
import PageSelector from 'src/components/PageSelector.vue'
import { usePainelStore } from 'src/store/PainelStore'
import ModalFilters from 'src/components/ModalFilters.vue'

const pesquisaValue = ref('')
const currentPage = ref(0)

const filtersByName = ref(['incompleto', 'completo', 'pendente'])

const isModalFiltersOpen = ref(false)
const loading = ref(false)

const $store = usePainelStore()

onMounted(async () => {
  loading.value = true
  $store.fetchEgressos()

  watch(currentPage, () => {
    $store.fetchEgressos(pesquisaValue.value, filtersByName.value, currentPage.value)
    window.scrollTo(0, 0)
  })
  watch(pesquisaValue, () => {
    currentPage.value = 0
    $store.fetchEgressos(pesquisaValue.value, filtersByName.value, currentPage.value)
  })
  watch(filtersByName, () => {
    currentPage.value = 0
    $store.fetchEgressos(pesquisaValue.value, filtersByName.value, currentPage.value)
  })
})

const updateData = () => {
  $store.fetchEgressos(pesquisaValue.value, filtersByName.value, currentPage.value)
}

const openModalFilters = () => {
  isModalFiltersOpen.value = true
}

const toggleFilterApplied = (id:number) => {
  const filtro = filtrosStatus.value.find(f => f.id === id)
  if (filtro) {
    filtro.selected = !filtro.selected
    applyFilters(filtrosStatus.value.filter(f => f.selected))
  }
}

const applyFilters = (filters:any) => {
  if (filters.length === 0) {
    filters = [...filtrosStatus.value]
  }

  filtersByName.value = filters.map((elem: any) => elem.name.toLowerCase())
}

const filtrosStatus = ref([
  {
    id: 1,
    name: 'Completo',
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
])

</script>
