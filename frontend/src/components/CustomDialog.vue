<template>
  <div v-if="modelValue">
    <div class="inset-0 fixed top-0 left-0 bg-black/75 flex items-center justify-center z-10">
      <div
        class="bg-white rounded-xl w-80 h-fit min-h-[16rem] p-4 sm:w-10/12 sm:h-96 max-w-2xl relative"
        :class="{
          ['scale-0']: !modelValue
        }"
      >
        <div class="h-full">
          <CustomButton
            v-if="!hideCloseButton"
            class="absolute right-0"
            color="blue"
            @click="$emit('update:modelValue', false); $emit('close')"
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
  </div>
</template>

<script lang="ts" setup>
import CustomButton from './CustomButton.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiClose } from '@mdi/js'

defineEmits(['update:modelValue', 'close'])

interface Props {
  modelValue: boolean,
  hideCloseButton?: boolean
}

withDefaults(defineProps<Props>(), {
  hideCloseButton: false
})
</script>
