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
            <div class="flex flex-wrap gap-4">
              <div
                v-for="filtro in filtrosStatus"
                :key="filtro.id"
              >
                <FilterChip
                  :title="filtro.name"
                  :selected="filtro.selected"
                  :selectable="filtro.selectable"
                  @click="toggleFilterApplied(filtro.name)"
                />
              </div>
            </div>
          </div>
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

        <div v-if="$store.notificacoes.length > 0">
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
              :nome="notificacao.nome"
              :usuario-id="notificacao.usuarioId"
              :status="notificacao.status"
              :data-modificacao="notificacao.dataModificacao"
            />
          </div>
        </div>

        <div
          v-else
          class="flex justify-center"
        >
          <div class="w-[960px] flex flex-col gap-4 justify-center items-center text-gray-400 bg-white">
            <SvgIcon
              type="mdi"
              size="48"
              :path="mdiEmoticonSadOutline"
            />
            <h1 class="text-xl sm:text-2xl font-medium">
              Parere que não há notificações
            </h1>
          </div>
        </div>
        <div class="flex flex-col gap-4 sm:gap-8 mb-10">
          <div class="flex justify-center">
            <div class="flex flex-col gap-4 sm:gap-6 w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-6 sm:p-8 mx-4 sm:mx-6 items-center">
              <div class="flex flex-col sm:flex-row w-full justify-center gap-4 sm:gap-8">
                <div class="flex gap-4 text-cyan-800 items-center">
                  <PageSelector
                    v-model:current-page="currentPage"
                    :total-pages="$store.totalPages"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

import { ref, onMounted, watch } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBell, mdiFilterVariant, mdiEmoticonSadOutline } from '@mdi/js'
import { useNotificacaoStore } from 'src/store/NotificacaoStore'
import NotificationItem from 'src/components/NotificationItem.vue'
import FilterChip from 'src/components/FilterChip.vue'
import PageSelector from 'src/components/PageSelector.vue'

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

const filtroStatusSelecionado = ref('')

console.log('notficacoes:', $store.notificacoes)

onMounted(async () => {
  await $store.fetchNotificacoes(filtroStatusSelecionado.value, currentPage.value, size.value)
  loading.value = true

  watch(currentPage, () => {
    $store.fetchNotificacoes(filtroStatusSelecionado.value, currentPage.value, size.value)
  })

  watch(filtroStatusSelecionado, () => {
    console.log('novo filtro de status:', filtroStatusSelecionado.value)
    $store.fetchNotificacoes(filtroStatusSelecionado.value, currentPage.value, size.value)
  })
})

const toggleFilterApplied = (name:string) => {
  for (let i = 0; i < filtrosStatus.value.length; i++) {
    filtrosStatus.value[i].selected = false
  }

  if (filtroStatusSelecionado.value === name) {
    filtroStatusSelecionado.value = ''
  } else {
    filtroStatusSelecionado.value = name
    const filtro = filtrosStatus.value.find(f => f.name === name)
    if (filtro) {
      filtro.selected = true
    }
  }
}

</script>
