<template>
  <div
    v-if="showAlert"
    class="flex h-12 gap-x-4 bg-red-600 py-2 px-2 items-center justify-between rounded-md"
  >
    <SvgIcon
      type="mdi"
      class="text-white col-span-1"
      size="24"
      :path="iconPath"
    />
    <p class="text-white">
      {{ text }}
    </p>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiAlertCircleOutline } from '@mdi/js'
import { defineProps } from 'vue'

interface Props {
    showAlert: boolean
    text: string
    iconPath: string
}

withDefaults(defineProps<Props>(), {
  text: '',
  iconPath: mdiAlertCircleOutline
})
</script>
