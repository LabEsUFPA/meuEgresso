<template>
  <div
    v-if="vmodel || visible"
    :class="{
      'opacity-50': !enabled || !vmodel
    }"
    class="flex-auto relative"
    alt="one"
  >
    <div
      class="LabelModeValue flex-auto rounded-lg py-1 px-3 mt-1"
      alt="two"
    >
      <div
        class="flex-auto flex-row items-center"
        alt="three"
      >
        <SvgIcon
          type="mdi"
          class="text-gray-400"
          :size="20"
          :path="iconPath"
          current="sky-900"
        />
        <h1 class="font-semibold absolute top-0 ml-8 mt-[1px]">
          {{ label }}
        </h1>

        <h1 class="flex-auto ml-[33px] mt-1 font-regular inline-flex">
          <CustomInput
            v-if="isinput"
            :name="name"
            :type="type"
            icon-path=""
            :model-value="name"
            :v-model="vmodel"
            label=""
            helper-text=""
            :placeholder="placeholder"
          />
          <div v-else>
            <div v-if="vmodel">
              <div class="whitespace-pre-wrap">
                {{ vmodel }}
              </div>
            </div>

            <div v-else>
              {{ placeholder }}
            </div>
          </div>
        </h1>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import CustomInput from 'src/components/CustomInput.vue'

defineEmits(['update:name'])

type inputs = 'date' | 'text' | 'email' | 'number' | 'password';

interface Props {
  name?: string;
  label?: string;
  helperText?: string;
  placeholder?: string;
  type?: inputs;
  iconPath?: string;
  inputClass?: string;
  required?: boolean;
  mask?: string;
  isinput?: boolean;
  vmodel?: string;
  iconSize?: string;
  visible?: boolean;
  enabled?: boolean;
}
withDefaults(defineProps<Props>(), {
  name: '',
  label: '',
  type: 'text',
  iconPath: '',
  inputClass: '',
  helperText: '',
  mask: '',
  placeholder: 'placeholder',
  isinput: false,
  vmodel: '',
  iconSize: '20',
  visible: false,
  enabled: true
})
</script>
