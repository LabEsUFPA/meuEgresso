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

                Secretario
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
              link="/conta-admin"
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
          <div class="border-b text-cyan-600 p-4 font-semibold text-left">
            <RouterLink
              to="/email"
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
          <div
            v-if="user.scope !== 'SECRETARIO'"
            class="border-b text-red-700 p-4 font-semibold text-left"
          >
            <button @click="deleteDialog">
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

    <CustomDialog
      @close="deleting = null"
      v-model="modalOpen"
    >
      <div class="h-full pt-9 pb-5">
        <div
          class="flex flex-col justify-center items-center"
          v-if="deleting === null"
        >
          <div class="block md:hidden">
            <SvgIcon
              type="mdi"
              :path="mdiDeleteForever"
              class="text-red-500 inline mb-2"
              size="50"
            />
          </div>

          <div class="hidden md:block">
            <SvgIcon
              type="mdi"
              :path="mdiDeleteForever"
              class="text-red-500 inline mb-2"
              size="100"
            />
          </div>

          <div class="text-center text-cyan-800 text-lg md:text-xl font-semibold mb-8">
            Excluir todos os dados do sistema permanentemente?
          </div>

          <Form
            :validation-schema="schema"
            @submit="deleteAll"
            v-slot="values"
          >
            <div class="text-center select-none">
              {{ passPhrase }}
            </div>

            <CustomInput
              name="passPhrase"
              label="Insira a frase acima para confirmar"
              placeholder="lorem ipsum dolor sit amet"
              class="mb-3"
            />

            <div class="flex justify-center gap-5 md:gap-10">
              <CustomButton
                type="submit"
                color="red"
                :disabled="values.values?.passPhrase !== passPhrase"
              >
                Confirmar
              </CustomButton>

              <CustomButton
                @click="modalOpen = false"
                type="reset"
                variant="flat"
                color="red"
              >
                Cancelar
              </CustomButton>
            </div>
          </Form>
        </div>

        <div
          class="flex flex-col justify-around items-center h-full"
          v-else-if="deleting === true"
        >
          <div class="text-red-700 text-2xl md:text-3xl font-semibold mb-10 md:mb-0">
            Deletando
          </div>

          <SvgIcon
            type="mdi"
            size="100"
            :path="mdiLoading"
            class="inline text-cyan-800 animate-spin md:hidden"
          />

          <SvgIcon
            type="mdi"
            size="150"
            :path="mdiLoading"
            class="hidden text-cyan-800 animate-spin md:inline"
          />
        </div>

        <div
          class="flex flex-col justify-around items-center h-full"
          v-else
        >
          <div class="text-cyan-800 text-2xl md:text-3xl font-semibold mb-10 md:mb-0">
            Dados deletados
          </div>

          <SvgIcon
            type="mdi"
            size="100"
            :path="mdiCheckCircle"
            class="inline text-green-500 md:hidden"
          />

          <SvgIcon
            type="mdi"
            size="150"
            :path="mdiCheckCircle"
            class="hidden text-green-500 md:inline"
          />
        </div>
      </div>
    </CustomDialog>
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
  mdiLoading,
  mdiDeleteForever,
  mdiCheckCircle,
  mdiAccount
} from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import eagle from 'src/assets/eagle.svg'
import FilterChip from 'src/components/FilterChip.vue'
import AdminOptionsDropdown from 'src/components/AdminOptionsDropdown.vue'
import { capitalize, ref, watch, computed, onMounted } from 'vue'
import { usePainelStore } from 'src/store/PainelStore'
import CustomBarGraph from 'src/components/CustomBarGraph.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import { object, string } from 'yup'
import { Form } from 'vee-validate'
import CustomInput from 'src/components/CustomInput.vue'
import { faker } from '@faker-js/faker'
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
const modalOpen = ref(false)
const passPhrase = ref('')
const deleting = ref<true | false | null>(null)

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
    x: Object.keys($painelStore.graficos[selectedString.value]),
    y: Object.keys($painelStore.graficos[selectedString.value]).map((key: any) => $painelStore.graficos[selectedString.value][key])
  },
  error: false
}))

const imageFlags = ref(new Map())

function deleteDialog () {
  modalOpen.value = true
  passPhrase.value = capitalize(faker.lorem.words(4))
}

async function logout () {
  $loginStore.userLogout()
  await $router.push('/entrar')
}

async function deleteAll () {
  deleting.value = true
  const code = await $painelStore.deleteAll()
  if (code === 200) {
    deleting.value = false
  }
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

const schema = object().shape({
  passphrase: string()
})

onMounted(async () => {
  user.value = JSON.parse((new LocalStorage()).get('loggedUser'))
  await $painelStore.fetchEgressos()
  await $painelStore.fetchGrafico(selectedString.value)
  $painelStore.egressos.forEach(egresso => {
    imageFlags.value.set(egresso.id, egresso.foto !== undefined)
  })
})
</script>
