<template>
  <div>
    <textarea
      class="px-2 py-0.5 border border-gray-400 rounded-md w-full md:w-1/2 h-32 block focus:outline-sky-400 focus:outline-2"
      :class="{
        ['outline outline-red-500']: !meta.valid && meta.validated && meta.touched,
        ['outline outline-emerald-500']: meta.valid && meta.validated && meta.touched,
        ['opacity-80 bg-gray-100 cursor-not-allowed']: disabled
      }"
      name="adicionais.experiencias"
      :value="inputValue"
      :disabled="disabled"
      @input="handleInput($event)"
      @blur="handleBlur"
      required
    />

    <div
      class="text-xs mt-1"
      :class="{
        ['text-red-500']: !meta.valid,
        ['text-emerald-500']: meta.valid,
      }"
      v-show="meta.validated"
    >
      {{ meta.valid ? successMessage : errorMessage }}
    </div>
  </div>
</template>

<script lang="ts" setup>
import { toRef } from 'vue'
import { useField } from 'vee-validate'
import { computed } from '@vue/reactivity';

const $emit = defineEmits(['update:value'])

interface Props {
  name: string
  value?: string
  disabled?: boolean
  successMessage?: string
  errorMessage?: string
}

const props = withDefaults(defineProps<Props>(), {
  value: '',
  errorMessage: '',
  successMessage: ''
})

const name = toRef(props, 'name')

// we don't provide any rules here because we are using form-level validation
// https://vee-validate.logaretm.com/v4/guide/validation#form-level-validation
const {
  value: inputValue,
  handleBlur,
  handleChange,
  meta
} = useField(name, undefined, {
  initialValue: props.value
})

function handleInput (e: Event) {
  handleChange(e)
  $emit('update:value', (e.target as HTMLInputElement).value)
}

const successMessages = {
  'adicionais.assuntosPalestras': '',
  'adicionais.experiencias': '',
  'adicionais.contribuicoes': ''
}


const successMessage = computed(() => {
  const inputName = name.value
  // @ts-ignore
  return successMessages[inputName] || props.successMessage
})

const errorMessages = {
  'adicionais.assuntosPalestras': 'Por favor informar os assuntos das palestras.',
  'adicionais.experiencias': 'Por favor informar suas experiências.',
  'adicionais.contribuicoes': 'Por favor informar suas contribuições.'
}

const errorMessage = computed(() => {
  const inputName = name.value
  // @ts-ignore
  return errorMessages[inputName] || props.errorMessage
})
</script>
