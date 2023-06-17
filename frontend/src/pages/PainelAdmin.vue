<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiCog"
          />
          <h1 class="text-2xl sm:text-3xl font-bold">
            Gerenciar Sistema
          </h1>
        </div>
      </div>
    </div>

    <div class="flex flex-col gap-4 sm:gap-8 mb-5">
      <div class="flex justify-center">
        <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl overflow-hidden mx-4 sm:mx-6">
          <div class="p-6 sm:p-8 flex flex-row items-start border-b">
            <div class="w-20 h-20 sm:w-24 sm:h-24 rounded-full flex items-center justify-center shrink-0 bg-sky-200 mr-10">
              <img :src="eagle">
            </div>
            <div>
              <div class="text-cyan-800 font-semibold text-lg mb-5">
                Marcelle Mota
              </div>

              <div class="text-amber-500 border border-amber-500 py-1 px-3 rounded-xl flex items-center">
                <SvgIcon
                  type="mdi"
                  size="20"
                  class="inline mr-2"
                  :path="mdiCrown"
                />

                Administrador
              </div>
            </div>
          </div>
          <div class="flex flex-col items-start sm:flex-row justify-end gap-4 p-4">
            <CustomButton variant="flat">
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiBell"
              />

              Ver atividades
            </CustomButton>

            <CustomButton variant="flat">
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiCog"
              />

              Editar Conta
            </CustomButton>

            <CustomButton
              color="red"
              variant="flat"
            >
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiExitToApp"
              />

              Sair
            </CustomButton>
          </div>
        </div>
      </div>
    </div>

    <div class="flex justify-center">
      <div class="flex flex-col md:grid grid-cols-2 grid-rows-6 grid-flow-col gap-5 mb-5 w-[960px] mx-4 sm:mx-6">
        <div class="row-span-2 col-span-1 bg-white rounded-lg">
          <div class="text-xl font-semibold text-cyan-800 border-b p-4">
            Ações
          </div>

          <div class="border-b text-cyan-600 p-4 font-semibold text-left">
            <RouterLink
              to="/"
              class="flex items-center"
            >
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiAccountPlus"
              />

              Criar perfil de usuário

              <div class="flex-1" />

              <SvgIcon
                type="mdi"
                size="20"
                class="inline"
                :path="mdiChevronRight"
              />
            </RouterLink>
          </div>
          <div class="border-b text-cyan-600 p-4 font-semibold text-left">
            <RouterLink
              to="/"
              class="flex items-center"
            >
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiEmail"
              />

              Configurar e-mail de atualização

              <div class="flex-1" />

              <SvgIcon
                type="mdi"
                size="20"
                class="inline"
                :path="mdiChevronRight"
              />
            </RouterLink>
          </div>
          <div class="border-b text-cyan-600 p-4 font-semibold text-left">
            <button>
              <SvgIcon
                type="mdi"
                size="20"
                class="inline"
                :path="mdiFileDocument"
              />

              Exportar dados em pdf
            </button>
          </div>
          <div class="border-b text-cyan-600 p-4 font-semibold text-left">
            <button>
              <SvgIcon
                type="mdi"
                size="20"
                class="inline"
                :path="mdiTrashCan"
              />
              Apagar dados
            </button>
          </div>
        </div>

        <div class="row-span-4 col-span-1 bg-white rounded-lg">
          <div class="text-xl font-semibold text-cyan-800 border-b p-4">
            Análise de Cadastros
          </div>

          <div class="flex flex-col">
            <div class="text-cyan-800 flex justify-center flex-col">
              <div class="flex items-center font-semibold border-b px-4 py-2">
                <SvgIcon
                  type="mdi"
                  class="inline mr-2"
                  :path="mdiCalendar"
                />

                Periodos

                <div class="flex-1" />

                <div class="overflow-x-auto flex flex-row gap-x-1 md:gap-x-3">
                  <FilterChip
                    selectable
                    :selected="selected.ano"
                    @click="handleSelect('ano')"
                    title="Ano"
                  />
                  <FilterChip
                    selectable
                    :selected="selected.mes"
                    @click="handleSelect('mes')"
                    title="Mês"
                  />
                  <FilterChip
                    selectable
                    :selected="selected.dia"
                    @click="handleSelect('dia')"
                    title="Dia"
                  />
                </div>
              </div>

              <div>
                <CustomBarGraph
                  legend="Cadastros"
                  info="Egressos cadastrados por periodo"
                  :loading="graphData.series.x.length === 0"
                  :data="graphData"
                  shadowless
                />
              </div>
            </div>
          </div>
        </div>

        <div class="col-span-1 row-span-6 bg-white rounded-lg flex flex-col">
          <div class="text-xl font-semibold text-cyan-800 border-b p-4">
            Registro de egressos
          </div>

          <div class="text-gray-400 px-4 py-2 flex items-center gap-2 border-b">
            <SvgIcon
              type="mdi"
              size="20"
              class="inline"
              :path="mdiClock"
            />

            Mais Recentes
          </div>

          <div
            class="flex-1 border-b flex items-center justify-center"
            v-if="$store.egressos.length === 0"
          >
            <div class="animate-spin">
              <SvgIcon
                type="mdi"
                size="120"
                class="text-cyan-800"
                :path="mdiLoading"
              />
            </div>
          </div>

          <div
            class="flex-1 border-b"
            v-else
          >
            <div
              v-for="(egresso, index) in $store.egressos"
              :key="egresso.id"
              class="px-4 py-3 flex items-center gap-3"
              :class="{
                ['border-b']: index !== $store.egressos.length - 1
              }"
            >
              <div class="w-10 h-10 rounded-full flex items-center justify-center bg-cyan-900">
                <SvgIcon
                  type="mdi"
                  :path="mdiAccount"
                  class="text-white"
                />
              </div>

              <div flex="flex items-center">
                <div class="font-semibold text-cyan-800">
                  {{ egresso.name }}
                </div>

                <div
                  class="text-xs text-white font-semibold text-center rounded-xl w-20 py-[1px]"
                  :class="{
                    ['bg-emerald-500']: egresso.status === 'completo',
                    ['bg-amber-500']: egresso.status === 'pendente',
                    ['bg-indigo-800']: egresso.status === 'incompleto'
                  }"
                >
                  {{ capitalize(egresso.status) }}
                </div>
              </div>

              <div class="flex-1" />

              <div>
                <AdminOptionsDropdown
                  :id="egresso.id"
                  :status="egresso.status"
                />
              </div>
            </div>
          </div>

          <div class="flex p-4 justify-end">
            <CustomButton variant="flat">
              Ver lista completa

              <SvgIcon
                type="mdi"
                size="20"
                class="inline"
                :path="mdiChevronRight"
              />
            </CustomButton>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import {
  mdiAccountPlus,
  mdiBell,
  mdiChevronRight,
  mdiCog,
  mdiCrown,
  mdiExitToApp,
  mdiEmail,
  mdiFileDocument,
  mdiTrashCan,
  mdiCalendar,
  mdiClock,
  mdiAccount,
  mdiLoading
} from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import eagle from 'src/assets/eagle.svg'
import FilterChip from 'src/components/FilterChip.vue'
import AdminOptionsDropdown from 'src/components/AdminOptionsDropdown.vue'
import { capitalize, ref, watch, computed } from 'vue'
import { usePainelStore } from 'src/store/PainelStore'
import CustomBarGraph from 'src/components/CustomBarGraph.vue'

const selected = ref({
  ano: true,
  mes: false,
  dia: false
})

type periodos = 'ano' | 'mes' | 'dia'
const selectedString = ref<periodos>('ano')

const $store = usePainelStore()
$store.fetchEgressos()
$store.fetchGrafico(selectedString.value)

watch(selectedString, () => {
  $store.fetchGrafico(selectedString.value)
})

const graphData = computed(() => ({
  series: {
    x: Object.keys($store.graficos[selectedString.value]),
    y: Object.keys($store.graficos[selectedString.value]).map((key: any) => $store.graficos[selectedString.value][key])
  },
  error: false
}))

type clickedTypes = keyof typeof selected.value
function handleSelect (clicked: string) {
  Object.keys(selected.value).forEach(key => {
    selected.value[key as clickedTypes] = key === clicked

    if (key === clicked) {
      selectedString.value = key as periodos
    }
  })
}

</script>
