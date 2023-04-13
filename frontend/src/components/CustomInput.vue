<template>
  <div>
    <label
      class="text-sm ml-1"
      v-if="label"
      :for="id"
    >
      {{ label }} <sup
        v-if="required"
        class="text-red-500"
      >*</sup>
    </label>
    <div
      class="rounded-lg w-64 py-1 px-3 border grid grid-cols-8"
      :class="`${focused ? 'outline-2 outline outline-gray-600' : 'border-gray-400'} ${inputClass}`"
    >
      <SvgIcon
        type="mdi"
        class="text-gray-400 col-span-1"
        size="24"
        :path="iconPath"
        v-if="iconPath"
      />
      <input
        class="focus:outline-none"
        :class="iconPath ? 'col-span-7' : 'col-span-8'"
        :type="type"
        :value="modelValue"
        :placeholder="placeholder"
        :id="id"
        :required="required"
        @input="$emit('update:modelValue', ($event.target as HTMLInputElement).value)"
        @focus="focused = true"
        @blur="focused = false"
      >
    </div>
    <div
      v-if="helperText"
      class="text-xs mt-1 ml-1 max-w-[250px] sm:max-w-fit"
    >
      {{ helperText }}
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'

defineEmits([
  'update:modelValue'
])

type inputs = 'date' | 'text' | 'email' | 'number' | 'password'

interface Props {
  modelValue: string
  label: string
  helperText: string
  placeholder?: string
  type?: inputs
  iconPath?: string
  inputClass?: string
  required?: boolean
}

withDefaults(defineProps<Props>(), {
  placeholder: '',
  type: 'text',
  iconPath: '',
  inputClass: '',
  helperText: ''
})

const focused = ref(false)

const id = `text-input-${Math.floor(Math.random() * 1000000).toString()}`
</script>
