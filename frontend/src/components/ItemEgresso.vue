<template>
  <div class="grid grid-cols-4 w-full px-6 sm:px-8 py-2 sm:py-3 border-gray-200 border-b-[1px] items-center">
    <div class="flex gap-4 col-span-2 items-center">
      <RouterLink :to="`/egresso/${id}`">
        <div class="flex w-8 h-8 justify-center items-center rounded-3xl bg-cyan-800">
          <SvgIcon
            type="mdi"
            size="16"
            :path="mdiAccount"
            class="text-white"
          />
        </div>
      </RouterLink>
      <RouterLink :to="`/egresso/${id}`">
        <h1 class="text-cyan-800 font-normal">
          {{ nome }}
        </h1>
      </RouterLink>
    </div>

    <h1 class="text-gray-400 font-normal">
      {{ dataCadastro.split('-').reverse().join('/') }}
    </h1>

    <div class="flex justify-between">
      <div
        class="flex w-24 py-1 justify-center items-center text-white text-sm font-normal rounded-2xl"
        :class="statusColor[status]"
      >
        {{ status }}
      </div>
      <AdminOptionsDropdown
        :id="id"
        :status="status"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAccount } from '@mdi/js'
import AdminOptionsDropdown from './AdminOptionsDropdown.vue'

const statusColor: any = {
  Ativo: 'bg-emerald-500',
  Pendente: 'bg-amber-500',
  Incompleto: 'bg-indigo-800'
}

defineProps<{
    id: number,
    nome: string,
    dataCadastro: string,
    status: string
}>()

</script>
