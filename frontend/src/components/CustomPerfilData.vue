<template>
  <div class="flex-auto relative">
    <div class="flex-auto rounded-lg py-1 px-3 mt-1">
      <div class="flex-auto flex-row items-center">
        <SvgIcon
          type="mdi"
          class="text-gray-400"
          size="20"
          :path="iconPath"
          current="sky-900"
        />
        <!-- v-if="iconPath" -->
        <h1 class="font-semibold absolute top-0 ml-8 mt-[1px]">
          {{ label }}
        </h1>

        <h1 class="flex-auto ml-[33px] mt-1 font-regular inline-flex">
          <!-- :icon-path="iconPath" -->

          <CustomInput
            v-if="isinput"
            :type="type"
            icon-path=""
            :model-value="modelValue"
            :v-model="vmodel"
            label=""
            helper-text=""
            :placeholder="placeholder"
          />
          <div v-else>
            <slot v-if="modelValue">
              {{ modelValue }}
            </slot>

            <slot v-else>
              {{ placeholder }}
            </slot>
          </div>
        </h1>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import CustomInput from 'src/components/CustomInput.vue'

defineEmits(['update:modelValue'])

type inputs = 'date' | 'text' | 'email' | 'number' | 'password';

interface Props {
  modelValue: string;
  label: string;
  helperText?: string;
  placeholder?: string;
  type: inputs;
  iconPath?: string;
  inputClass?: string;
  required?: boolean;
  mask?: string;
  isinput?: boolean;
  vmodel: string;
}

withDefaults(defineProps<Props>(), {
  type: 'text',
  iconPath: '',
  inputClass: '',
  helperText: '',
  mask: '',
  placeholder: 'placeholder',
  isinput: false
})
</script>
