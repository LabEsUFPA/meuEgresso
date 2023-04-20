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
      :class="`${focused ? 'outline-2 outline outline-sky-400' : 'border-gray-400'} ${inputClass}`"
    >
      <div class="flex flex-row items-center">
        <SvgIcon
          type="mdi"
          class="text-gray-400 col-span-1"
          size="20"
          :path="iconPath"
          v-if="iconPath"
        />
      </div>
      <input
        class="focus:outline-none"
        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength)"
        :maxlength="maxLength"
        :minlength="minLength"
        :class="iconPath ? 'col-span-7' : 'col-span-8'"
        :type="type"
        :value="modelValue"
        :placeholder="placeholder"
        :id="id"
        :required="required"
        :data-maska="mask"
        @input="$emit('update:modelValue', ($event.target as HTMLInputElement).value)"
        @focus="focused = true"
        @blur="focused = false"
        v-maska
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

defineEmits(['update:modelValue'])

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
  mask?: string
  maxLength?: number
  minLength?: number
}

withDefaults(defineProps<Props>(), {
  placeholder: '',
  type: 'text',
  iconPath: '',
  inputClass: '',
  helperText: '',
  mask: '',
  errorText: '',
  maxLength: 300,
  minLength: 1
  mask: ''
})

const focused = ref(false)

const id = `text-input-${Math.floor(Math.random() * 1000000).toString()}`
</script>
