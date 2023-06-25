<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiBullhorn"
          />
          <h1 class="text-2xl sm:text-3xl font-bold">
            Vagas de emprego
          </h1>
        </div>

        <CustomButton
          v-show="logado"
          tag="router"
          link="/cadastro/anuncio"
          color="emerald"
          text-class="text-white font-medium"
          class="w-full sm:w-fit sm:self-end"
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

    <div class="flex flex-col gap-4 sm:gap-8 mb-10">
      <div class="flex justify-center">
        <div class="flex flex-col gap-4 sm:gap-6 w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-6 sm:p-8 mx-4 sm:mx-6 items-center">
          <SearchBar
            name="pesquisa"
            v-model="pesquisaValue"
            :placeholder="'Pesquisar vaga'"
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
                v-for="filtro in $store.areasEmpregoFiltros.filter(f => f.selected)"
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

      <div v-if="$store.anuncios.length > 0">
        <div
          v-for="anuncio in $store.anuncios"
          :key="anuncio.id"
          class="flex justify-center mb-8"
        >
          <ShortPost
            :id="anuncio.id"
            :nome="anuncio.createdBy.nome"
            :titulo="anuncio.titulo"
            :area="anuncio.areaEmprego.nome"
            :descricao="anuncio.descricao"
            :salario="anuncio.salario"
          />
        </div>
      </div>

      <div
        v-else
        class="flex flex-col gap-4 justify-center items-center text-gray-400"
      >
        <SvgIcon
          type="mdi"
          size="48"
          :path="mdiEmoticonSadOutline"
        />
        <h1 class="text-xl sm:text-2xl font-medium">
          Nenhuma vaga encontrada
        </h1>
      </div>

      <PageSelector
        v-model:current-page="currentPage"
        :total-pages="$store.totalPages"
      />
    </div>
  </div>

  <ModalFilters
    v-if="loading"
    v-model="isModalFiltersOpen"
    :filters="$store.areasEmpregoFiltros"
    @apply-filters="applyFilters"
  />
</template>

<script setup lang="ts">

import { ref, onMounted, watch } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBullhorn, mdiFilterVariant, mdiPlus, mdiChevronRight, mdiEmoticonSadOutline } from '@mdi/js'
import { useAnuncioVagaStore } from 'src/store/AnuncioVagaStore'
import { useLoginStore } from 'src/store/LoginStore'
import CustomButton from 'src/components/CustomButton.vue'
import ShortPost from 'src/pages/FeedVagas/components/ShortPost.vue'
import SearchBar from 'src/components/SearchBar.vue'
import FilterChip from 'src/components/FilterChip.vue'
import ModalFilters from 'src/components/ModalFilters.vue'
import PageSelector from 'src/components/PageSelector.vue'

const logado = ref(useLoginStore().loggedIn)

const $store = useAnuncioVagaStore()

const loading = ref(false)

const filtersById = ref([])

const currentPage = ref(0)

const size = ref(3)

onMounted(async () => {
  await $store.fetchAreasEmprego()
  await $store.fetchBusca(currentPage.value, size.value)

  loading.value = true
  watch(currentPage, () => {
    $store.fetchBuscaAnuncio(pesquisaValue.value, filtersById.value, currentPage.value, size.value)
    window.scrollTo(0, 0)
  })
  watch(pesquisaValue, () => {
    currentPage.value = 0
    $store.fetchBuscaAnuncio(pesquisaValue.value, filtersById.value, currentPage.value, size.value)
  })
  watch(filtersById, () => {
    currentPage.value = 0
    $store.fetchBuscaAnuncio(pesquisaValue.value, filtersById.value, currentPage.value, size.value)
  })
})

const isModalFiltersOpen = ref(false)

const openModalFilters = () => {
  isModalFiltersOpen.value = true
}

const pesquisaValue = ref('')

const toggleFilterApplied = (id:number) => {
  const filtro = $store.areasEmpregoFiltros.find(f => f.id === id)
  if (filtro) {
    filtro.selected = !filtro.selected
    applyFilters($store.areasEmpregoFiltros.filter(f => f.selected))
  }
}

const applyFilters = (filters:any) => {
  filtersById.value = filters.map((elem: any) => (elem.id))
}

</script>
