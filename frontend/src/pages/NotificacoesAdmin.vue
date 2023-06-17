<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiBell"
          />
          <h1 class="text-2xl sm:text-3xl font-bold">
            Atividades recentes
          </h1>
        </div>
      </div>
    </div>

    <div class="flex flex-col gap-4 sm:gap-8 mb-10">
      <div class="flex justify-center">
        <div class="flex flex-col gap-4 sm:gap-6 w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-6 sm:p-8 mx-4 sm:mx-6 items-center">
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
            <!--
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
          -->
          </div>
        </div>

        <div class="flex flex-col">
          <div class="flex justify-center">
            <div class="flex flex-col gap-4 sm:gap-6 w-[960px] bg-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mx-4 sm:mx-6 items-center">
              <div class="flex flex-col sm:flex-row w-full items-start gap-4 sm:gap-8">
                <div class="flex gap-4 text-cyan-800 items-center">
                  <p class="font-medium text-2xl sm:text-3xl">
                    Resultados
                  </p>
                </div>
              </div>
            </div>
          </div>

          <div v-if="mockNotification.length > 0">
            <div class="flex justify-center">
              <div class="w-[960px] bg-white grid grid-cols-2 border-t-[1px] border-t-gray-200, border-b-[1px] border-b-gray-200 gap-4 px-6 sm:px-8 pt-4 sm:pt-4 pb-4">
                <div class="text-gray-400">
                  <p class="font-medium text-lg">
                    Atividade
                  </p>
                </div>
                <div class="text-right text-gray-400 pr-32">
                  <p class="font-medium text-lg">
                    Data
                  </p>
                </div>
              </div>
            </div>
            <div
              v-for="notificacao in $store.notificacoes"
              :key="notificacao.usuarioId"
              class="flex justify-center"
            >
              <NotificationItem
                :id="notificacao.usuarioId"
                :id-usuario="notificacao.usuarioId"
                :status="notificacao.status"
                :nome-usuario="notificacao.nome"
                :data="notificacao.data"
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
              Parere que não há notificações
            </h1>
          </div>

          <div class="flex flex-col gap-4 sm:gap-8 mb-10">
            <div class="flex justify-center">
              <div class="flex flex-col gap-4 sm:gap-6 w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-6 sm:p-8 mx-4 sm:mx-6 items-center">
                <div class="flex flex-col sm:flex-row w-full items-start gap-4 sm:gap-8">
                  <div class="flex gap-4 text-cyan-800 items-center">
                    <p class="font-medium text-lg">
                      Colocar a paginação
                    </p>
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
                      Próximo
                    </p>
                  </button>
                </div>
              </div>
            </div>

            <!--
            <ModalFilters
              v-if="loading"
              v-model="isModalFiltersOpen"
              :filters="$store.areasEmpregoFiltros"
              @apply-filters="applyFilters"
            />-->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

import { ref, onMounted, watch } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBell, mdiFilterVariant, mdiPlus, mdiEmoticonSadOutline } from '@mdi/js'
import { useNotificacaoStore } from 'src/store/NotificacaoStore'
import NotificationItem from 'src/components/NotificationItem.vue'
// import FilterChip from 'src/components/FilterChip.vue'
// import ModalFilters from 'src/components/ModalFilters.vue'

const $store = useNotificacaoStore()

const loading = ref(false)

const filtersById = ref([])

const currentPage = ref(0)

// const size = ref(3)

onMounted(async () => {
  await $store.fetchNotificacoes()
  // await $store.fetchBusca(currentPage.value, size.value)

  loading.value = true
  watch(currentPage, () => {
    // $store.fetchBusca(currentPage.value, size.value)
  })
  watch(pesquisaValue, () => {
    // $store.fetchBuscaAnuncioTitulo(pesquisaValue.value, currentPage.value, size.value)
  })
  watch(filtersById, () => {
    if (filtersById.value.length > 0) {
    //  $store.fetchBuscaAnuncioAreas(filtersById.value, currentPage.value, size.value)
    } else {
    //  $store.fetchBusca(currentPage.value, size.value)
    }
  })
})

const isModalFiltersOpen = ref(false)

const openModalFilters = () => {
  isModalFiltersOpen.value = true
}

const pesquisaValue = ref('')

/* const toggleFilterApplied = (id:number) => {
   const filtro = $store.areasEmpregoFiltros.find(f => f.id === id)
  if (filtro) {
    filtro.selected = !filtro.selected
    applyFilters(filtersById.value.filter(f => f === filtro.id))
  }
} */

/* const applyFilters = (filters:any) => {
  filtersById.value = filters.map((elem: any) => (elem.id))
} */

const mockNotification =
[
  {
    id: 1,
    idUsuario: 1,
    status: 'concluido',
    nomeUsuario: 'José Roberto Felipe',
    data: '22/05/2023'
  },
  {
    id: 2,
    idUsuario: 2,
    status: 'deletado',
    nomeUsuario: 'José Roberto Felipe',
    data: '22/05/2023'
  },
  {
    id: 3,
    idUsuario: 3,
    status: 'concluido',
    nomeUsuario: 'José Roberto Felipe',
    data: '22/05/2023'
  },
  {
    id: 4,
    idUsuario: 4,
    status: 'deletado',
    nomeUsuario: 'José Roberto Felipe',
    data: '22/05/2023'
  },
  {
    id: 5,
    idUsuario: 5,
    status: 'pendente',
    nomeUsuario: 'José Roberto Felipe',
    data: '22/05/2023'
  },
  {
    id: 6,
    idUsuario: 6,
    status: 'incompleto',
    nomeUsuario: 'José Roberto Felipe',
    data: '22/05/2023'
  }

]

</script>
