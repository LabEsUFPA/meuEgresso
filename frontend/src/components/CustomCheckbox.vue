
<template>
  <div :id="name.replaceAll('.', '-')">
    <button
      class="flex flex-row pr-1 items-center w-fit focus-visible:rounded-sm mb-4"
      role="checkbox"
      :class="{
        ['cursor-not-allowed opacity-80']: disabled,
        ['cursor-pointer']: !disabled
      }"
      :aria-labelledby="name"
      :aria-checked="inputValue"
      @click="!disabled && handleChange(!inputValue); $emit('update:value', inputValue)"
      @keydown.enter.space="!disabled && handleChange(!inputValue); $emit('update:value', inputValue)"
      :id="`checkbox-${name}`"
      type="button"
    >
      <div class="text-teal-600">
        <SvgIcon
          type="mdi"
          class="inline"
          :path="mdiCheckboxBlankOutline"
          v-if="!inputValue"
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
        :class="{
          ['cursor-not-allowed opacity-80']: disabled,
          ['cursor-pointer']: !disabled
        }"
        :id="name"
      >
        {{ label }}
      </label>
      <sup
        class="text-red-500"
        v-if="required"
      >
        *
      </sup>
    </button>
  </div>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheckboxBlankOutline, mdiCheckboxMarked } from '@mdi/js'
import { useField } from 'vee-validate'
import { toRef } from 'vue'
const props = defineProps<{
  value?: boolean
  label: string
  name: string
  disabled?: boolean
  required?: boolean
}>()
type Booleanish = 'true' | 'false'
const $emit = defineEmits(['update:value'])

const name = toRef(props, 'name')

const {
  value: inputValue,
  handleChange
} = useField<Booleanish | 'mixed' | undefined>(name, undefined)

</script>
