<template>
  <div>
    <div class="w-fit">
      <div
        class="text-sm ml-1"
        v-if="label"
      >
        {{ label }} <sup
          v-if="required"
          class="text-red-500"
        >*</sup>
      </div>
      <button
        type="button"
        class="w-64 py-1 px-3 grid grid-cols-8 relative border"
        :class="open ? 'rounded-t-lg' : 'rounded-lg'"
        @click="open = !open"
        @blur="open = false"
      >
        <SvgIcon
          type="mdi"
          class="text-gray-400 col-span-1"
          size="24"
          :path="iconPath"
          v-if="iconPath"
        />
        <div
          class="text-left"
          :class="iconPath ? 'col-span-6' : 'col-span-7'"
        >
          {{ modelValue }}
        </div>

        <div
          class="text-cyan-600 col-span-1 flex flex-row items-end justify-end"
        >
          <SvgIcon
            type="mdi"
            :path="mdiChevronDown"
          />
        </div>

        <div
          :class="open ? '' : 'hidden'"
          class="absolute shadow-md bg-white w-64 z-50 cursor-pointer -left-[1px] top-8 rounded-b-lg border border-t-0"
        >
          <div
            class="p-2 hover:bg-gray-200 text-left"
            @click="$emit('update:modelValue', '')"
          >
            ...
          </div>
          <div
            class="p-2 hover:bg-gray-200 text-left border-t"
            :key="index"
            v-for="(option, index) in options"
            @click="$emit('update:modelValue', option)"
          >
            {{ option }}
          </div>
        </div>
      </button>
      <div
        v-if="helperText"
        class="text-xs mt-1 ml-1 max-w-[250px] sm:max-w-fit"
      >
        {{ helperText }}
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronDown } from '@mdi/js'

defineEmits(['update:modelValue'])

interface Props {
  modelValue: string
  label: string
  helperText?: string
  options: string[]
  iconPath?: string
  required?: boolean
}

withDefaults(defineProps<Props>(), {
  iconPath: '',
  helperText: ''
})

const open = ref(false)
</script>
