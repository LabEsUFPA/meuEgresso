<template>
  <div
    class="flex w-full gap-2 items-center border-[1px] border-indigo-300 p-1 rounded-md"
    :class="{ ['border-[2px]']: searchbarFocused }"
  >
    <SvgIcon
      type="mdi"
      size="24"
      :path="mdiMagnify"
      class="text-indigo-300 ml-2"
    />

    <OField :root-class="classNames(['flex h-full w-full'])">
      <OInput
        override
        :v-model="props.modelValue"
        expanded
        placeholder="Pesquisar vaga"
        :root-class="classNames(['flex h-full w-full'])"
        :input-class="classNames(['flex w-full h-full focus:outline-0 text-zinc-700'])"
        @change=" $emit('update:modelValue', $event.target.value)"
        @focus="toggleSearchbarFocus()"
        @blur="toggleSearchbarFocus()"
      />
    </OField>

    <CustomButton
      type="button"
      color="sky"
      text-class="text-sm sm:text-lg text-white"
      @click="$emit('update:modelValue', $event.target.value)"
    >
      Buscar
    </CustomButton>
  </div>
</template>

<script setup lang="ts">

import { ref } from 'vue'
import { OField, OInput } from '@oruga-ui/oruga-next'
import classNames from 'classnames'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiMagnify } from '@mdi/js'

import CustomButton from 'src/components/CustomButton.vue'

defineEmits(['update:modelValue'])
const props = defineProps<{
  modelValue:string
}>()

const searchbarFocused = ref(false)

const toggleSearchbarFocus = () => {
  searchbarFocused.value = !searchbarFocused.value
}

</script>
