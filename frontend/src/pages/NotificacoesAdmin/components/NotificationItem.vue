<template>
  <div class="flex sm:grid flex-col gap-2 sm:gap-0 sm:grid-cols-3 w-full px-6 sm:px-10 py-3 border-gray-200 border-b-[1px] items-start sm:items-center">
    <div class="flex gap-4 col-span-2 items-center">
      <div :class="['shrink-0', 'p-2', 'rounded-3xl', 'text-white', getStatusColor(status)]">
        <SvgIcon
          type="mdi"
          size="21"
          :path="defineStatus(status)"
        />
      </div>
      <div class="flex flex-row justify-center">
        <h1 class="text-cyan-800 font-normal mb-1 mr-5">
          {{ nome }}
        </h1>
        <h1 class="text-gray-400 font-normal mb-1 mr-5">
          {{ defineDescricao(status) }}
        </h1>
      </div>
      <div class="col-span-">
        <h1 class="text-gray-400 font-normal mb-1 ">
          {{ dataModificacao }}
        </h1>
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
