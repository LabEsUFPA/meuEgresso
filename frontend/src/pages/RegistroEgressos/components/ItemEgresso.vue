<template>
  <div class="flex sm:grid flex-col gap-2 sm:gap-0 sm:grid-cols-4 w-full px-6 sm:px-8 py-3 border-gray-200 border-b-[1px] items-start sm:items-center">
    <div class="flex gap-4 col-span-2 items-center">
      <div
        role="button"
        class="flex w-8 h-8 justify-center items-center rounded-full bg-cyan-800 overflow-hidden"
        @click="() => idEgresso ? $router.push(`/egresso/${idEgresso}`) : null"
      >
        <img
          v-if="fotoUsuario !== '' && foto"
          @error="fotoUsuario = ''"
          :src="fotoUsuario"
        >

        <SvgIcon
          v-else

          type="mdi"
          size="16"
          :path="mdiAccount"
          class="text-white"
        />
      </div>
      <h1
        role="button"
        class="text-cyan-800 font-normal"
        @click="() => idEgresso ? $router.push(`/egresso/${idEgresso}`) : null"
      >
        {{ nome }}
      </h1>
    </div>

    <h1 class="text-gray-400 font-normal">
      {{ dataCadastro.split('-').reverse().join('/') }}
    </h1>

    <div class="flex w-full justify-between">
      <div
        id="status"
        class="flex w-24 py-1 justify-center items-center text-white text-sm font-normal rounded-2xl"
        :class="statusColor[status]"
      >
        {{ capitalize(status) }}
      </div>
      <AdminOptionsDropdown
        :id="id"
        :id-egresso="idEgresso"
        :nome="nome"
        :status="status"
        :email="email"
        @update-data="$emit('updateData')"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { ref, capitalize } from 'vue'
import { mdiAccount } from '@mdi/js'
import AdminOptionsDropdown from 'src/components/AdminOptionsDropdown.vue'

const statusColor: any = {
  completo: 'bg-emerald-500',
  pendente: 'bg-amber-500',
  incompleto: 'bg-indigo-800'
}

const props = defineProps<{
    id: number,
    idEgresso?: number,
    nome: string,
    dataCadastro: string,
    status: string
    foto?: string
    email: string
}>()

const fotoUsuario = ref(props.foto)

defineEmits(['updateData'])

</script>
