<template>
  <button
    class="flex flex-row pr-1 items-center w-fit focus-visible:rounded-sm"
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
  </button>
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
}>()

const $emit = defineEmits(['update:value'])

const name = toRef(props, 'name')
const {
  value: inputValue,
  handleChange
} = useField(name, undefined, {
  initialValue: props.value
})
</script>
