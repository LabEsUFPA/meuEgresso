<template>
  <div class="select">
    <OField
      override
      message-class="text-xs mt-1 max-w-[250px]"
      :label-class="classNames({
        ['text-sm ml-1']: true,
        ['opacity-80']: disabled
      })"
    >
      <template #label>
        {{ label }}
        <sup
          class="text-red-500"
          v-if="required"
        >
          *
        </sup>
      </template>
      <template #default>
        <div
          class="grid grid-cols-8"
          :class="classNames({
            ['bg-gray-100 cursor-not-allowed']: disabled,
            ['cursor-pointer']: !disabled,
            ['outline-2 outline outline-red-500']: !meta.valid && meta.validated && meta.dirty && meta.touched,
            ['outline-2 outline outline-emerald-500']: meta.valid && meta.validated && meta.dirty && meta.touched,
            ['rounded-t-lg']: open,
            ['rounded-lg']: !open,
            ['w-64 py-1 px-3 relative border bg-white']: true,
          })"
          @click="!disabled ? focusInput = !focusInput : ''"
        >
          <div
            :class="{
              ['cursor-not-allowed']: disabled,
              ['col-span-1 flex justify-start items-center text-gray-400']: true
            }"
            v-if="iconPath"
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

          <OAutocomplete
            override
            keep-first
            open-on-focus
            selectable-header
            check-infinite-scroll
            menu-class="absolute shadow-md bg-white w-64 z-50 cursor-pointer -left-[1px] overflow-y-auto top-8 rounded-b-lg border border-t-0"
            item-class="p-2 text-left border-t hover:bg-gray-200"
            item-hover-class="bg-gray-200"
            ref="input"
            max-height="24rem"
            v-model="model"
            :data="filteredDataArray"
            :placeholder="placeholder"
            :field="typeof options[0] === 'object' ? 'label' : 'value'"
            :required="required"
            :disabled="disabled"
            :loading="isFetching"
            :input-class="classNames({
              ['cursor-not-allowed']: disabled,
              ['bg-transparent focus:outline-none']: true,
              [name.replaceAll('.', '-')]: true
            })"
            :root-class="classNames({
              ['col-span-6']: iconPath,
              ['col-span-7']: !iconPath
            })"
            :debounce-typing="infinite ? 500 : 0"
            @select="(option: IOpts) => (handleEmit(option))"
            @focus="() => { !disabled ? open = !open : '' }"
            @blur="handleBlur(); open = false"
            @keydown="open = true"
            @keydown.esc.enter="open = false"
            @typing="$emit('typing', $event)"
            @infinite-scroll="$emit('infiniteScroll', $event)"
          >
            <template #empty>
              Dados não encontrados
            </template>
            <template #default="data">
              {{ data.option?.label ? data.option.label : data.option }}
            </template>
          </OAutocomplete>

          <div class="text-cyan-600 col-span-1 flex flex-row items-end justify-end">
            <SvgIcon
              type="mdi"
              :path="mdiChevronDown"
            />
          </div>
        </div>
      </template>
      <template #message>
        <div
          v-if="meta.touched"
          class="text-red-500"
        >
          {{ errorMessage }}
        </div>
        <div>
          {{ helperText }}
        </div>
      </template>
    </OField>
  </div>
</template>
<script setup lang="ts">
import { ref, computed, toRef, onMounted, watch } from 'vue'
import { OField, OAutocomplete } from '@oruga-ui/oruga-next'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronDown } from '@mdi/js'
import { useField } from 'vee-validate'
import { type models } from 'src/@types'
import classNames from 'classnames'
interface ComplexOpts extends models.ComplexOpts {}

type IOpts = string | ComplexOpts
interface Props {
  valueId?: number
  label: string
  name: string
  helperText?: string
  options: IOpts[]
  iconPath?: string
  required?: boolean
  placeholder?: string
  imgIcon?: boolean
  disabled?: boolean
  preFilled?: boolean // tirar duvidas
  isFetching?: boolean,
  infinite?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  iconPath: '',
  helperText: '',
  placeholder: '',
  value: '',
  valueId: 0,
  errorMessage: 'Campo inválido',
  successMessage: 'Campo correto',
  preFilled: false
})

const $emit = defineEmits(['change', 'infiniteScroll', 'typing'])

const model = ref<any>('')
const selected = ref<IOpts>('')
const open = ref(false)
const input = ref<HTMLElement | null>(null)
const focusInput = ref(false)

const filteredDataArray = computed(() => {
  return props.options.filter((option) => {
    if (typeof option === 'string') {
      return option.toString().toLowerCase().indexOf(model.value.toLowerCase()) >= 0
    }

    return option.label.toString().toLowerCase().indexOf(model.value.toLowerCase()) >= 0
  })
})

const name = toRef(props, 'name')
const {
  handleChange,
  handleBlur,
  meta,
  errorMessage
} = useField(name, undefined)

function handleEmit (option: IOpts) {
  selected.value = option
  console.log(selected.value)

  if (option !== null) {
    if (typeof selected.value === 'object') {
      handleChange(selected.value.value)
      $emit('change', selected.value.value)
      return
    }

    handleChange(selected.value)
    $emit('change', selected.value)
  }
}

onMounted(() => {
  watch(focusInput, () => {
    if (input.value) {
      input.value.focus()
    }
  })
})
</script>
