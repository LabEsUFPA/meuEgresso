<template>
  <div class="flex sm:grid flex-col gap-2 sm:gap-0  sm:grid-cols-2 w-full px-6 sm:px-8 py-8 border-gray-200 border-b-[1px] items-start sm:items-center">
    <div class="flex gap-4 col-span-2 items-center">
      <div :class="['shrink-0', 'p-2', 'rounded-3xl', 'text-white', getStatusColor(status)]">
        <SvgIcon
          type="mdi"
          size="21"
          :path="defineStatus(status)"
        />
      </div>

      <div class="flex flex-row flex-grow text-cyan-800">
        <div class="flex items-center">
          <p class="text-sm sm:text-lg font-medium leading-tight">
            {{ nome }}
          </p>
          <p class="text-sm sm:text-lg px-2 font-medium-light leading-tight">
            {{ defineDescricao(status) }}
          </p>
        </div>
      </div>

      <div class="w-200 flex text-gray-400">
        <p class="text-sm sm:text-lg px-20 font-medium-light leading-tight">
          {{ dataModificacao.split('-').reverse().join('/') }}
        </p>
        <!--
        <SvgIcon
          type="mdi"
          size="21"
          :path="mdiChevronRight"
          class="text-cyan-600"
        />
        -->
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheck, mdiClock, mdiAlertCircle, mdiClose } from '@mdi/js'

defineProps<
{
  nome: String,
  usuarioId: Number,
  status: String,
  dataModificacao: String,
}>()

const defineStatus = (status: String) => {
  if (status === 'completo') return mdiCheck
  if (status === 'pendente') return mdiClock
  if (status === 'incompleto') return mdiAlertCircle
  if (status === 'excluido') return mdiClose
}

const defineDescricao = (status: String) => {
  if (status === 'completo') return 'completou seu cadastro'
  if (status === 'pendente') return 'está com o cadastro pendente'
  if (status === 'incompleto') return 'não completou o cadastro'
  if (status === 'excluido') return 'teve seu cadastro excluído'
}

const getStatusColor = (status: String) => {
  if (status === 'completo') return 'bg-emerald-500'
  if (status === 'pendente') return 'bg-amber-500'
  if (status === 'incompleto') return 'bg-indigo-800'
  if (status === 'excluido') return 'bg-red-500'
}
</script>
