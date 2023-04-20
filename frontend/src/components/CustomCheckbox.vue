<template>
  <button
    class="flex flex-row items-center cursor-pointer w-fit"
    @click="$emit('update:modelValue', !modelValue)"
  >
    <div class="text-teal-600">
      <SvgIcon
        type="mdi"
        class="inline"
        :path="mdiCheckboxBlankOutline"
        v-if="!modelValue"
      />

      <SvgIcon
        type="mdi"
        class="inline"
        :path="mdiCheckboxMarked"
        v-else
      />
    </div>

    <label
      class="ml-1"
      :for="id"
    >
      {{ label }}
    </label>
  </button>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheckboxBlankOutline, mdiCheckboxMarked } from '@mdi/js'

defineProps<{
  modelValue: boolean
  label: string
}>()

defineEmits(['update:modelValue'])

const id = `checkbox-input-${Math.floor(Math.random() * 1000000).toString()}`
</script>
