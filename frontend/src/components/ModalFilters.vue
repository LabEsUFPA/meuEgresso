<template>
  <div v-show="modelValue">
    <div class="inset-0 fixed top-0 left-0 bg-black/75 flex items-center justify-center">
      <div class="flex flex-col md:w-2/4 sm:w-10/12 max-w-2xl bg-white rounded-md m-4">
        <div class="flex gap-4 px-8 pt-8 pb-4 justify-between items-center border-b-[1px] border-b-gray-200 text-cyan-800">
          <div class="flex gap-4 items-center">
            <SvgIcon
              type="mdi"
              size="18"
              :path="mdiPencil"
            />
            <p class="text-lg font-medium">
              Editar Filtros
            </p>
          </div>

          <button
            class="hover:bg-gray-200 rounded p-1"
            @click="$emit('update:modelValue', false); $emit('close')"
          >
            <SvgIcon
              type="mdi"
              size="18"
              :path="mdiClose"
            />
          </button>
        </div>

        <div
          class="flex flex-wrap gap-4 px-8 py-8 border-b-[1px] border-b-gray-200"
        >
          <FilterChip
            v-for="filtro in filtrosAreaEmprego"
            :key="filtro.id"
            :title="filtro.name"
            :applied="filtro.applied"
            @click="toggleFilterApplied(filtro.id)"
          />
        </div>

        <div class="flex justify-end px-8 pb-8 pt-4 gap-4">
          <CustomButton
            color="gray"
            @click="$emit('update:modelValue', false)"
          >
            Cancelar
          </CustomButton>
          <CustomButton
            color="emerald"
            @click="$emit('applyFilters', filtrosAreaEmprego.filter(f => f.applied)); $emit('update:modelValue', false)"
          >
            Aplicar filtros
          </CustomButton>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

import { ref, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiClose, mdiPencil } from '@mdi/js'

import FilterChip from './FilterChip.vue'
import CustomButton from './CustomButton.vue'

defineEmits(['update:modelValue', 'close', 'applyFilters'])

interface Props {
    modelValue: boolean
    filters: {
        id: number
        name: string
        applied: boolean
    }[]

}

const props = defineProps<Props>()

const filtrosAreaEmprego = ref(props.filters)

onMounted(async () => {
  filtrosAreaEmprego.value = props.filters
})

const toggleFilterApplied = (id:number) => {
  const filtro = filtrosAreaEmprego.value.find(f => f.id === id)
  if (filtro) {
    filtro.applied = !filtro.applied
  }
}

</script>
