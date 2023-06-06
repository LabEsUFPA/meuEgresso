<template>
  <button
    type="button"
    :class="{
      ['font-medium flex gap-3 px-4 py-2 rounded-3xl items-center']: true,
      ['text-indigo-800 bg-indigo-600/30']: !selectable || selected,
      ['text-gray-800 bg-gray-600/30']: selectable && !selected
    }"
  >
    <Icon
      v-if="icon"
      :icon="icon"
      width="16"
      height="16"
    />
    <p class="text-sm">
      {{ title }}
    </p>
    <Icon
      v-if="!selectable"
      icon="ic:round-close"
      width="16"
      height="16"
    />
  </button>
</template>

<script setup lang="ts">
import { Icon } from '@iconify/vue'

interface Props {
  title: string
  selectable?: boolean
  selected?: boolean
  icon?: string
}

withDefaults(defineProps<Props>(), {
  icon: ''
})

</script>
