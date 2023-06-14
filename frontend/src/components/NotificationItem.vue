<template>
  <div class="flex flex-col w-[960px] bg-white mx-4 sm:mx-6">
    <div :class="['flex', 'gap-4', 'px-6', 'sm:px-8', 'pt-8', 'sm:pt-8', 'pb-8', 'items-center', 'border-b-[1px]', 'border-b-gray-200']">
      <div :class="['shrink-0', 'p-2', 'rounded-3xl', 'text-white', getStatusColor(status)]">
        <SvgIcon
          type="mdi"
          size="21"
          :path="defineStatus(status)"
        />
      </div>

      <div class="flex flex-col flex-grow text-cyan-800">
        <div class="flex items-center">
          <p class="text-sm sm:text-lg font-medium leading-tight">
            {{ nomeUsuario }}
          </p>
          <p class="text-sm sm:text-lg px-2 font-medium-light leading-tight">
            {{ defineDescricao(status) }}
          </p>
        </div>
      </div>

      <div class="w-200 flex text-gray-400">
        <p class="text-sm sm:text-lg px-12 font-medium-light leading-tight">
          {{ data }}
        </p>
        <SvgIcon
          type="mdi"
          size="21"
          :path="mdiChevronRight"
          class="text-cyan-600"
        />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheck, mdiClock, mdiChevronRight, mdiAlertCircle, mdiClose } from '@mdi/js'

defineProps<{
  id: Number,
  idUsuario: Number,
  status: String,
  nomeUsuario: String,
  data: String,
}>()

const defineStatus = (status: String) => {
  if (status === 'concluido') return mdiCheck
  if (status === 'pendente') return mdiClock
  if (status === 'incompleto') return mdiAlertCircle
  if (status === 'deletado') return mdiClose
}

const defineDescricao = (status: String) => {
  if (status === 'concluido') return 'completou seu cadastro'
  if (status === 'pendente') return 'está com o cadastro pendente'
  if (status === 'incompleto') return 'não completou o cadastro'
  if (status === 'deletado') return 'teve seu cadastro excluído'
}

const getStatusColor = (status: String) => {
  if (status === 'concluido') return 'bg-emerald-500'
  if (status === 'pendente') return 'bg-amber-500'
  if (status === 'incompleto') return 'bg-indigo-800'
  if (status === 'deletado') return 'bg-red-500'
}
</script>
