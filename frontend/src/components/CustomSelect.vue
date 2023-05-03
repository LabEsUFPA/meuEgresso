<template>
  <div
    :class="{
      'opacity-80': disabled
    }"
  >
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
        :class="{
          ['bg-gray-100 cursor-not-allowed']: disabled,
          ['outline-2 outline outline-red-500']: !meta.valid && meta.validated && meta.touched,
          ['outline-2 outline outline-emerald-500']: meta.valid && meta.validated && meta.touched,
          ['rounded-t-lg']: open,
          ['rounded-lg']: !open
        }"
        @click="() => { !disabled ? open = !open : '' }"
        @blur="open = false"
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
        <div
          class="text-left"
          :class="iconPath ? 'col-span-6' : 'col-span-7'"
        >
          <p
            :class="inputValue === '' ? 'text-gray-500' : 'text-black'"
          >
            {{ inputValue === '' ? placeholder : currentSelection.label }}
          </p>
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
          class="absolute shadow-md bg-white w-64 z-50 cursor-pointer -left-[1px] max-h-96 overflow-y-auto top-8 rounded-b-lg border border-t-0"
        >
          <div
            class="p-2 hover:bg-gray-200 text-left"
            @click="handleEmit('')"
          >
            ...
          </div>
          <div
            class="p-2 hover:bg-gray-200 text-left border-t"
            :key="index"
            v-for="(option, index) in options"
            @click="handleEmit(option)"
          >
            {{ typeof option === 'object' ? option.label : option }}
          </div>
        </div>
      </button>
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
        class="text-xs mt-1 ml-1 max-w-[250px] sm:max-w-fit"
      >
        {{ helperText }}
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, toRef } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronDown } from '@mdi/js'
import { useField } from 'vee-validate'
import { type models } from 'src/@types'
interface ComplexOpts extends models.ComplexOpts {}

type IOpts = string | ComplexOpts

interface Props {
  value?: string
  label: string
  name: string
  helperText?: string
  options: IOpts[]
  iconPath?: string
  required?: boolean
  placeholder?: string
  imgIcon?: boolean
  disabled?: boolean
  errorMessage?: string
  successMessage?: string
}

const props = withDefaults(defineProps<Props>(), {
  iconPath: '',
  helperText: '',
  placeholder: '',
  value: '',
  errorMessage: 'Campo inválido',
  successMessage: 'Campo correto'
})

const $emit = defineEmits(['update:value'])

const currentSelection = ref<ComplexOpts>({
  label: '',
  value: ''
})

const name = toRef(props, 'name')

const {
  value: inputValue,
  handleChange,
  meta
} = useField(name, undefined, {
  initialValue: props.value
})

function handleEmit (option: IOpts) {
  if (typeof option === 'object') {
    handleChange(option.value)
    $emit('update:value', option.value)
    currentSelection.value = option
    return
  }

  handleChange(option)
  $emit('update:value', option)
  currentSelection.value.label = option
}

const open = ref(false)
</script>
