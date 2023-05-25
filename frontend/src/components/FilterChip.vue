<template>
  <button
    class="flex gap-3 px-4 py-2 rounded-3xl items-center"
    :class="{
      ['text-indigo-800 bg-indigo-600/30 font-medium'] : applied,
      ['text-zinc-700 bg-gray-200'] : !applied
    }"
  >
    <p class="text-sm">
      {{ title }}
    </p>
    <SvgIcon
      v-show="applied"
      type="mdi"
      size="16"
      :path="mdiClose"
    />
  </button>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiClose } from '@mdi/js'

defineProps<{
    title: string
    applied: boolean
}>()

</script>
