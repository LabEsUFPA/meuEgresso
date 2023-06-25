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
                {{ user.nomeCompleto }}
              </div>

              <div
                class="text-amber-500 border border-amber-500 py-1 px-3 rounded-xl flex items-center"
                :class="{
                  ['hidden']: user.scope !== 'ADMIN'
                }"
              >
                <SvgIcon
                  type="mdi"
                  size="20"
                  class="inline mr-2"
                  :path="mdiCrown"
                />

                Administrador
              </div>

              <div
                class="text-blue-600 border border-blue-600 py-1 px-3 rounded-xl flex items-center"
                :class="{
                  ['hidden']: user.scope !== 'SECRETARIO'
                }"
              >
                <SvgIcon
                  type="mdi"
                  size="20"
                  class="inline mr-2"
                  :path="mdiCrown"
                />

                Secretário
              </div>
            </div>
          </div>
          <div class="flex flex-col items-start sm:flex-row justify-end gap-4 p-4">
            <CustomButton
              tag="router"
              variant="flat"
              link="/notificacoes-admin"
            >
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiBell"
              />

              Ver atividades
            </CustomButton>

            <CustomButton
              tag="router"
              link="/conta"
              variant="flat"
            >
              <SvgIcon
                type="mdi"
                size="20"
                class="inline mr-2"
                :path="mdiCog"
              />

              Editar Conta
            </CustomButton>

            <CustomButton
              @click="logout"
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
              to="/cadastro-admin"
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
          <div
            role="button"
            class="flex items-center border-b text-cyan-600 p-4 font-semibold text-left"
            @click="navigateToEmailSettings"
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
          </div>
          <div class="border-b text-cyan-600 p-4 font-semibold text-left">
            <button @click="$painelStore.getPdf()">
              <SvgIcon
                type="mdi"
                size="20"
                class="inline"
                :path="mdiFileDocument"
              />
              Exportar dados em pdf
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

                Períodos

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
                  info="Egressos cadastrados por período"
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
            v-if="$painelStore.egressos.length === 0"
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
              v-for="(egresso, index) in $painelStore.egressos"
              :key="egresso.id"
              class="px-4 py-3 flex items-center gap-3"
              :class="{
                ['border-b']: index !== $painelStore.egressos.length - 1
              }"
            >
              <div class="w-10 h-10 rounded-full flex items-center overflow-hidden justify-center bg-cyan-900">
                <img
                  v-if="imageFlags.get(egresso.id)"
                  @error="imageFlags.set(egresso.id, false)"
                  :src="egresso.foto"
                >

                <SvgIcon
                  v-else
                  type="mdi"
                  class="inline text-white"
                  :path="mdiAccount"
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
                  :id-egresso="egresso.idEgresso"
                  :nome="egresso.name"
                  :status="egresso.status"
                  :email="egresso.email"
                  @update-data="$painelStore.fetchEgressos()"
                />
              </div>
            </div>
          </div>

          <div class="flex p-4 justify-end">
            <CustomButton
              tag="router"
              link="/registro-egressos"
              variant="flat"
            >
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
  mdiCalendar,
  mdiClock,
  mdiLoading,
  mdiAccount
} from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import eagle from 'src/assets/eagle.svg'
import FilterChip from 'src/components/FilterChip.vue'
import AdminOptionsDropdown from 'src/components/AdminOptionsDropdown.vue'
import { capitalize, ref, watch, computed, onMounted } from 'vue'
import { usePainelStore } from 'src/store/PainelStore'
import CustomBarGraph from 'src/components/CustomBarGraph.vue'
import { useLoginStore } from 'src/store/LoginStore'
import { useRouter } from 'vue-router'
import LocalStorage from 'src/services/localStorage'

const selected = ref({
  ano: true,
  mes: false,
  dia: false
})

type periodos = 'ano' | 'mes' | 'dia'
const selectedString = ref<periodos>('ano')

const $painelStore = usePainelStore()
const $loginStore = useLoginStore()
const $router = useRouter()
const user = ref({
  nomeCompleto: '',
  scope: 'EGRESSO'
})

watch(selectedString, () => {
  $painelStore.fetchGrafico(selectedString.value)
})

const graphData = computed(() => ({
  series: {
    x: Object.keys($painelStore.graficos[selectedString.value]).map((key: any) => {
      if (selectedString.value === 'ano') {
        console.log('aq')
        return key
      } else {
        // key: YYYY-MM-DD
        const meses = [
          'Janeiro',
          'Fevereiro',
          'Março',
          'Abril',
          'Maio',
          'Junho',
          'Julho',
          'Agosto',
          'Setembro',
          'Outubro',
          'Novembro',
          'Dezemmbro'
        ]
        if (selectedString.value === 'mes') {
          const date = new Date(key + 'T00:00:00')
          console.log(key, date.toLocaleDateString(), date.getMonth())
          return `${meses[date.getMonth()]}/${date.getFullYear()}`
        } else {
          const date = new Date(key + 'T00:00:00')
          console.log(key, date.toLocaleDateString(), date.getMonth())
          return `${date.toLocaleDateString()}`
        }
      }
    }),
    y: Object.keys($painelStore.graficos[selectedString.value]).map((key: any) => $painelStore.graficos[selectedString.value][key])
  },
  error: false
}))

watch(selectedString, () => {
  Object.keys($painelStore.graficos[selectedString.value])
})

const imageFlags = ref(new Map())

async function logout () {
  $loginStore.userLogout()
  await $router.push('/entrar')
}

function navigateToEmailSettings () {
  $router.push('/email')
  $painelStore.setEgressoEmail(null)
}

type clickedTypes = keyof typeof selected.value
function handleSelect (clicked: string) {
  Object.keys(selected.value).forEach(key => {
    selected.value[key as clickedTypes] = key === clicked

    if (key === clicked) {
      selectedString.value = key as periodos
    }
  })
}

onMounted(async () => {
  user.value = JSON.parse((new LocalStorage()).get('loggedUser'))
  await $painelStore.fetchEgressos()
  await $painelStore.fetchGrafico(selectedString.value)
  $painelStore.egressos.forEach(egresso => {
    imageFlags.value.set(egresso.id, egresso.foto !== undefined)
  })
})
</script>
