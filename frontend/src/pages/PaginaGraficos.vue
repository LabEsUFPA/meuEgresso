<template>
  <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200 px-64">
    <div class="flex w-full justify-start border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl text-blue-900 py-8 pl-11 mt-10  shadow-md">
      <SvgIcon
        type="mdi"
        size="30"
        class="inline mr-2"
        :path="mdiPoll"
      />

      <h1 class=" text-3xl font-bold">
        Gráficos
      </h1>
    </div>
  </div>
  <div class="flex w-full justify-between px-64 mt-10">
    <CustomGraph type="pie" />
    <CustomGraph type="bar" />
  </div>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiPoll } from '@mdi/js'
import CustomGraph from 'src/components/CustomGraph.vue'
</script>
