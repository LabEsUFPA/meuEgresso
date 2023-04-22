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
        class="w-64 py-1 px-3 grid grid-cols-8 relative border border-gray-400"
        :class="open ? 'rounded-t-lg' : 'rounded-lg'"
        @click="open = !open"
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
            :class="modelValue === '' ? 'text-gray-500' : 'text-black'"
          >
            {{ modelValue === '' ? placeholder : currentSelection.label }}
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
          class="absolute shadow-md bg-white w-64 z-50 cursor-pointer -left-[1px] max-h-96 overflow-y-auto top-8 rounded-b-lg border border-gray-400 border-t-0"
        >
          <div
            class="p-2 hover:bg-gray-200 text-left"
            @click="$emit('update:modelValue', '')"
          >
            ...
          </div>
          <div
            class="p-2 hover:bg-gray-200 text-left border-t border-gray-400"
            :key="index"
            v-for="(option, index) in options"
            @click="handleEmit(option)"
          >
            {{ typeof option === 'object' ? option.label : option }}
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

const $emit = defineEmits(['update:modelValue'])

interface ComplexOpts {
  label: string,
  value: any
}

type IOpts = string | ComplexOpts

interface Props {
  modelValue: string
  label: string
  helperText?: string
  options: IOpts[]
  iconPath?: string
  required?: boolean
  placeholder?: string
  imgIcon?: boolean
}

withDefaults(defineProps<Props>(), {
  iconPath: '',
  helperText: '',
  placeholder: ''
})

const currentSelection = ref<ComplexOpts>({
  label: '',
  value: ''
})

function handleEmit (option: IOpts) {
  console.log(typeof option)
  if (typeof option === 'object') {
    $emit('update:modelValue', option.value)
    currentSelection.value = option
    return
  }

  $emit('update:modelValue', option)
  currentSelection.value.label = option
}

const open = ref(false)
</script>
