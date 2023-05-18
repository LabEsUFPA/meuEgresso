<template>
  <div
    :class="{
      'opacity-80': disabled
    }"
  >
    <label
      class="text-sm ml-1"
      v-if="label"
      :for="name"
    >
      {{ label }} <sup
        v-if="required"
        class="text-red-500"
      >*</sup>
    </label>
    <div
      class="rounded-lg w-64 py-1 px-3 border grid grid-cols-8"
      :class="{
        ['outline-2 outline outline-sky-400']: focused && !disabled,
        ['bg-gray-100 cursor-not-allowed']: disabled,
        ['outline-2 outline outline-red-500']: !meta.valid && meta.validated && meta.touched,
        ['outline-2 outline outline-emerald-500']: meta.valid && meta.validated && meta.touched,
        [`${inputClass}`]: true
      }"
    >
      <div
        :class="{ ['cursor-not-allowed']: disabled }"
        class="flex flex-row text-gray-400 items-center"
      >
        <img
          class="w-[20px]"
          :src="iconPath"
          v-if="imgIcon"
        >

        <SvgIcon
          type="mdi"
          class="col-span-1"
          size="20"
          :path="iconPath"
          v-else-if="iconPath"
        />
      </div>
      <input
        class="focus:outline-none bg-transparent"
        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength)"
        :maxlength="maxLength"
        :minlength="minLength"
        :class="{
          ['cursor-not-allowed']: disabled,
          ['col-span-7']: iconPath,
          ['col-span-8']: !iconPath
        }"
        :type="type"
        :value="inputValue"
        :placeholder="placeholder"
        :id="name"
        :name="name"
        :required="required"
        :data-maska="mask"
        :step="step"
        :disabled="disabled"
        @input="handleInput($event)"
        @focus="focused = true"
        @blur="focused = false; handleBlur()"
        v-maska
      >
    </div>

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

    <div
      v-if="helperText"
      :class="classHelperText"
      class="text-xs mt-1 max-w-[250px]"
    >
      {{ helperText }}
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, toRef } from 'vue'
import { useField } from 'vee-validate'
import SvgIcon from '@jamescoyle/vue-icon'
import { computed } from '@vue/reactivity';

type inputs = 'date' | 'text' | 'email' | 'number' | 'password'

const $emit = defineEmits(['update:value'])

interface Props {
  value?: string
  name: string
  label: string
  helperText?: string
  errorMessage?: string
  successMessage?: string
  placeholder?: string
  type?: inputs
  iconPath?: string
  inputClass?: string
  required?: boolean
  mask?: string
  maxLength?: number
  minLength?: number
  imgIcon?: boolean
  step?: number | string
  disabled?: boolean,
  classHelperText?: string
}

const props = withDefaults(defineProps<Props>(), {
  value: '',
  placeholder: '',
  type: 'text',
  iconPath: '',
  inputClass: '',
  helperText: '',
  mask: '',
  errorMessage: '',
  successMessage: '',
  maxLength: 300,
  minLength: 1,
  step: 1,
  classHelperText: ''
})

const successMessages = {
  email: 'Email válido',
  registration: '',
  username: 'Nome de usuário válido',
  name: 'Nome válido.',
  password: 'Senha válida.',
  confirmationPassword: 'As senhas coincidem.',
  'geral.nome':'Nome válido.',
  'geral.linkedin': '',
  'academico.posGrad.local': '',
  'academico.posGrad.curso': '',
  "carreira.empresa": '',
}

const successMessage = computed(() => {
  const inputName = name.value
  // @ts-ignore
  return successMessages[inputName] || props.successMessage
})

const errorMessages = {
  email: 'Email inválido',
  registration: '',
  username: 'Nome de usuário inválido.',
  name: 'Nome inválido.',
  password: 'Senha inválida.',
  confirmationPassword: 'As senhas não coincidem.',
  'geral.nome':'Por favor preencher o nome completo.',
  'geral.linkedin': '',
  'academico.posGrad.local': 'Por favor preencha o nome da instituição.',
  'academico.posGrad.curso': 'Por favor preencha o nome do curso.',
  'carreira.empresa': 'Por favor preencha o nome da empresa.',
}

const errorMessage = computed(() => {
  const inputName = name.value
  // @ts-ignore
  return errorMessages[inputName] || props.errorMessage
})


const focused = ref(false)

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
  $emit('update:value', (e.target as HTMLInputElement).value)
  handleChange(e)
}
</script>
