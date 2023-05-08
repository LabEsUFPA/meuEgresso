<template>
  <div v-if="modelValue">
    <div class="inset-0 fixed top-0 left-0 bg-black/75 flex items-center justify-center">
      <div
        class="bg-white rounded-xl w-80 h-52 sm:w-10/12 sm:h-96 max-w-2xl relative overflow-hidden"
        :class="{
          ['scale-0']: !modelValue
        }"
      >
        <CustomButton
          class="absolute right-0"
          color="blue"
          @click="$emit('update:modelValue', false)"
          variant="flat"
        >
          <SvgIcon
            type="mdi"
            class="inline"
            :path="mdiClose"
          />
        </CustomButton>
        <slot />
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import CustomButton from './CustomButton.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiClose } from '@mdi/js'

defineEmits(['update:modelValue'])
defineProps<{
  modelValue: boolean
}>()
</script>
