<template>
  <div class="flex flex-1 flex-col bg-white rounded-2xl">
    <div class="flex gap-4 p-4 sm:p-6 items-center border-b-[1px] border-b-gray-200">
      <p class="text-neutral-900">
        {{ descricao }}
      </p>
    </div>
    <div class="flex flex-row gap-4 p-4 sm:p-6 items-center">
      <img
        :src="eagle"
        class="w-10 h-10 p-2 rounded-full flex items-center justify-center shrink-0 bg-sky-200"
      >
      <h1 class="text-cyan-600 text-sm sm:text-base font-semibold">
        {{ nome }}
      </h1>
    </div>
  </div>
</template>

<script setup lang="ts">

import eagle from 'src/assets/eagle.svg'

defineProps<
    {
    id: Number,
    nome: String,
    descricao: String,
    foto: String,
  }>()

</script>
