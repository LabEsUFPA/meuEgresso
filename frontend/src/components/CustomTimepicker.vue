<template>
  <div
    class="input"
    :id="name.replaceAll('.', '-')"
  >
    <OField
      override
      message-class="text-xs mt-1 max-w-[250px]"
      :label-class="classNames({
        ['text-sm ml-1']: true,
        ['opacity-80']: disabled
      })"
    >
      <template
        #label
      >
        <div v-if="label">
          {{ label }}
          <sup
            class="text-red-500"
            v-if="required"
          >*</sup>
        </div>
        <div v-if="customLabel">
          <div class="mb-1.5">
            <slot name="label" />
            <sup
              class="text-red-500"
              v-if="required"
            >*</sup>
          </div>
        </div>
      </template>
      <template #default>
        <div
          :class="classNames({
            ['outline-2 outline outline-sky-400 bg-white']: focused && !disabled,
            ['bg-gray-100 cursor-not-allowed']: disabled,
            ['outline-2 outline outline-red-500']: !meta.valid && meta.validated && meta.touched,
            ['outline-2 outline outline-emerald-500']: meta.valid && meta.validated && meta.dirty,
            ['']: withoutValidation,
            [`${inputClass} rounded-lg w-64 py-1 px-3 border grid grid-cols-8`]: true
          })"
        >
          <div
            :class="{ ['cursor-not-allowed']: disabled }"
            class="flex flex-row text-gray-400 items-center"
          >
            <img
              class="w-[20px]"
              :src="iconPath"
              v-if="imgIcon"
              alt="Icon"
            >

            <SvgIcon
              type="mdi"
              class="col-span-1"
              size="20"
              :path="iconPath"
              v-else-if="iconPath"
            />
          </div>
          <OTimepicker
            :root-class="classNames({
              ['col-span-7']: iconPath,
              ['col-span-8']: !iconPath
            })"
            :input-class="classNames({
              ['border-none shadow-none h-full p-0']: true,
              ['focus:outline-none bg-transparent']: true,
              ['cursor-not-allowed']: disabled
            })"
            :placeholder="`${(new Date).getHours()}:${(new Date).getMinutes()}`"
            :editable="true"

            v-model="inputValue"
            :data-maska="mask"
            @update:model-value="handleInput"
            @focus="focused = true"
            @blur="focused = false; handleBlur()"
            v-maska
          />
        </div>
      </template>
      <template #message>
        <div
          v-if="meta.validated"
          class="text-red-500"
        >
          {{ meta.valid ? null : customErrorMessage? props.errorMessage : errorMessage }}
        </div>
        <div :class="classHelperText">
          {{ helperText }}
        </div>
      </template>
    </OField>
  </div>
</template>

<script lang="ts" setup>
import { ref, toRef } from 'vue'
import { useField } from 'vee-validate'
import classNames from 'classnames'
import SvgIcon from '@jamescoyle/vue-icon'
import { OTimepicker, OField } from '@oruga-ui/oruga-next'

const $emit = defineEmits(['update:value'])

  interface Props {
    name: string
    label?: string
    helperText?: string
    placeholder?: string
    iconPath?: string
    inputClass?: string
    required?: boolean
    mask?: string | string[]
    imgIcon?: boolean
    disabled?: boolean,
    classHelperText?: string,
    errorMessage?: string,
    customErrorMessage?: boolean,
    withoutValidation?: boolean
    customLabel?: boolean
  }

const props = withDefaults(defineProps<Props>(), {
  placeholder: '',
  label: '',
  iconPath: '',
  inputClass: '',
  helperText: '',
  mask: '',
  classHelperText: '',
  errorMessage: '',
  customErrorMessage: false,
  withoutValidation: false,
  customLabel: false
})

const focused = ref(false)
const name = toRef(props, 'name')

const {
  value: inputValue,
  handleBlur,
  handleChange,
  errorMessage,
  meta
} = useField(name, undefined)

function handleInput (e: Event) {
  inputValue.value = e
  $emit('update:value', e)
  handleChange(e)
}
</script>

<style>
.o-tpck__select {
  outline-color: #0091b7;
}
</style>
