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
      class="rounded-lg max-w-36 sm:w-48 md:w-64 py-1 border"
      :class="`${focused ? 'outline-2 outline outline-gray-600' : 'border-gray-400'} ${inputClass}`"
    >
      <SvgIcon
        type="mdi"
        class="absolute ml-1 text-gray-400 col-span-1"
        size="24"
        :path="iconPath"
        v-if="iconPath"
      />
      <input
        class="w-full pl-8 pr-2 focus:outline-none"
        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
        :maxlength="maxLength"
        :minlength="minLength"
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
    <div
      v-if="errorText"
      class="text-xs text-red-600 mt-1 ml-1 max-w-[250px] sm:max-w-fit"
    >
      {{ errorText }}
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
  helperText?: string
  errorText?: string
  placeholder?: string
  type?: inputs
  iconPath?: string
  inputClass?: string
  required?: boolean
  maxLength?: number
  minLength?: number
}

withDefaults(defineProps<Props>(), {
  placeholder: '',
  type: 'text',
  iconPath: '',
  inputClass: '',
  helperText: '',
  errorText: '',
  maxLength: 300,
  minLength: 1
})

const focused = ref(false)

const id = `text-input-${Math.floor(Math.random() * 1000000).toString()}`
</script>
