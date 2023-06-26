<template>
  <div class="flex flex-col w-[500px] bg-white rounded-2xl mx-4 my-4 sm:mx-6">
    <div class="flex gap-4 px-6 sm:px-8 pt-6 sm:pt-8 pb-4 items-center border-b-[1px] border-b-gray-200">
      <div class="flex flex-col gap-4 p-6 sm:p-8">
        <p class="text-neutral-900">
          {{ descricao }}
        </p>
      </div>
    </div>
    <div class="flex flex-row gap-4 p-6 sm:p-8">
      <div class="shrink-0 p-2 bg-cyan-800 rounded-3xl text-white">
        <SvgIcon
          type="mdi"
          size="21"
          :path="mdiAccount"
        />
      </div>
      <h1 class="text-cyan-600 text-xl sm:text-2xl font-bold">
        {{ nome }}
      </h1>
    </div>
  </div>
</template>

<script setup lang="ts">

import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAccount } from '@mdi/js'

defineProps<
    {
    id: Number,
    nome: String,
    descricao: String,
    foto: String,
  }>()

</script>
