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
      <div class="flex flex-col md:grid grid-cols-2 grid-rows-5 gap-5 mb-5 w-[960px] mx-4 sm:mx-6">
        <div class="row-start-1 row-end-3 col-start-1 col-end-2 bg-white rounded-lg">
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

        <div class="row-start-3 row-end-6 col-start-1 col-end-2 bg-white rounded-lg">
          <div class="text-xl font-semibold text-cyan-800 border-b p-4">
            Análise de Cadastros
          </div>

          <div class="flex flex-col p-4">
            <div class="text-cyan-800 flex flex-col sm:flex-row md:flex-col lg:flex-row justify-between gap-2">
              <div class="flex items-center font-semibold">
                <SvgIcon
                  type="mdi"
                  class="inline mr-2"
                  :path="mdiCalendar"
                />

                Periodos
              </div>

              <div class="overflow-x-auto flex flex-row gap-x-1 md:gap-x-3">
                <FilterChip
                  selectable
                  :selected="selected.anos"
                  @click="handleSelect('anos')"
                  title="Anos"
                />
                <FilterChip
                  selectable
                  :selected="selected.meses"
                  @click="handleSelect('meses')"
                  title="Meses"
                />
                <FilterChip
                  selectable
                  :selected="selected.semanas"
                  @click="handleSelect('semanas')"
                  title="Semanas"
                />
                <FilterChip
                  selectable
                  :selected="selected.dias"
                  @click="handleSelect('dias')"
                  title="Dias"
                />
              </div>
            </div>
          </div>
        </div>

        <div class="row-start-1 row-end-6 col-start-2 col-end-3 bg-white rounded-lg">
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
            v-for="egresso in egressos"
            :key="egresso.id"
            class="px-4 py-3 border-b flex items-center gap-3"
          >
            <div class="w-10 h-10 rounded-full bg-cyan-900">
              foto
            </div>

            <div flex="flex items-center">
              <div class="font-semibold text-cyan-800">
                {{ egresso.name }}
              </div>

              <div
                class="text-xs text-white font-semibold text-center rounded-xl w-20 py-[1px]"
                :class="{
                  ['bg-emerald-500']: egresso.status === 'Ativo',
                  ['bg-amber-500']: egresso.status === 'Pendente',
                  ['bg-indigo-800']: egresso.status === 'Incompleto'
                }"
              >
                {{ egresso.status }}
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
  mdiClock
} from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import eagle from 'src/assets/eagle.svg'
import FilterChip from 'src/components/FilterChip.vue'
import { getRandomEgressoList } from 'src/mock/EgressosPainel'
import AdminOptionsDropdown from 'src/components/AdminOptionsDropdown.vue'
import { ref } from 'vue'

const selected = ref({
  anos: true,
  meses: false,
  semanas: false,
  dias: false
})

const egressos = ref(getRandomEgressoList(10))

type clickedTypes = keyof typeof selected.value
function handleSelect (clicked: string) {
  Object.keys(selected.value).forEach(key => {
    selected.value[key as clickedTypes] = key === clicked
  })
}
</script>
