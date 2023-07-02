<template>
  <div class="flex flex-col">
    <PageHeader
      back-to="/painel-admin"
      :icon-path="mdiBell"
      titulo="Atividades Recentes"
    />
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
      v-if="$store.notificacoes.length > 0"
    >
      <div class="hidden sm:flex justify-center">
        <div class="grid grid-cols-4 w-[960px] bg-white px-6 sm:px-8 py-2 sm:py-3 mx-4 sm:mx-6 border-gray-200 border-b-[1px] text-sm text-gray-400 font-normal">
          <h1 class="col-span-3">
            Atividade
          </h1>

          <h1>
            Data de cadastro
          </h1>
        </div>
      </div>

      <div class="flex justify-center">
        <div class="flex flex-col w-[960px] bg-white mx-4 sm:mx-6">
          <div
            v-for="(notificacao,index) in $store.notificacoes"
            :key="index"
            class="flex justify-center"
          >
            <NotificationItem
              :nome="notificacao.nome"
              :usuario-id="notificacao.usuarioId"
              :status="notificacao.status"
              :data-modificacao="formatarDataHora(notificacao.dataModificacao)"
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
            Nenhuma atividade encontrada.
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

import { ref, onMounted, watch, capitalize } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBell, mdiFilterVariant, mdiEmoticonSadOutline, mdiPlus } from '@mdi/js'
import { useNotificacaoStore } from 'src/store/NotificacaoStore'
import NotificationItem from './components/NotificationItem.vue'
import FilterChip from 'src/components/FilterChip.vue'
import PageSelector from 'src/components/PageSelector.vue'
import PageHeader from 'src/components/PageHeader.vue'
import ModalFilters from 'src/components/ModalFilters.vue'

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
  },
  {
    id: 4,
    name: 'Excluído',
    selected: false,
    selectable: true
  }
])

const $store = useNotificacaoStore()

const loading = ref(false)

const currentPage = ref(0)

const size = ref(10)

const isModalFiltersOpen = ref(false)

const filtersByName = ref(['INCOMPLETO', 'COMPLETO', 'PENDENTE', 'EXCLUIDO'])

onMounted(async () => {
  await $store.fetchNotificacoes([], currentPage.value, size.value)
  loading.value = true

  watch(currentPage, () => {
    $store.fetchNotificacoes(filtersByName.value, currentPage.value, size.value)
  })

  watch(filtersByName, () => {
    currentPage.value = 0
    $store.fetchNotificacoes(filtersByName.value, currentPage.value, size.value)
  })
})
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

  filtersByName.value = filters.map((elem: any) => elem.name.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toUpperCase())
}

function formatarDataHora (dataHora: string): string {
  const data = new Date(dataHora)
  const dia = String(data.getDate()).padStart(2, '0')
  const mes = String(data.getMonth() + 1).padStart(2, '0')
  const ano = String(data.getFullYear())
  const hora = String(data.getHours()).padStart(2, '0')
  const minuto = String(data.getMinutes()).padStart(2, '0')
  const segundo = String(data.getSeconds()).padStart(2, '0')
  const dataFormatada = `${dia}/${mes}/${ano}`
  const timeFormatado = `${hora}:${minuto}:${segundo}h`
  return `${dataFormatada} ${timeFormatado}`
}

</script>
