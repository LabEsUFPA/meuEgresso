
<template>
  <div
    v-show="modelValue"
    id="modal-filters"
  >
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
            v-for="filtro in filtrosModal"
            :key="filtro.id"
            :title="filtro.name"
            :selected="filtro.selected"
            :selectable="filtro.selectable"
            @click="toggleFilterApplied(filtro.id)"
          />
        </div>

        <div class="flex justify-end px-8 pb-8 pt-4 gap-4">
          <CustomButton
            color="gray"
            @click="$emit('update:modelValue', false)"
          >
            Fechar
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

const $emit = defineEmits(['update:modelValue', 'close', 'applyFilters'])

interface Props {
    modelValue: boolean
    filters: {
        id: number
        name: string
        selected: boolean
        selectable: boolean
    }[]

}

const props = defineProps<Props>()

const filtrosModal = ref(props.filters)

onMounted(async () => {
  filtrosModal.value = props.filters
})

const toggleFilterApplied = (id:number) => {
  const filtro = filtrosModal.value.find(f => f.id === id)
  if (filtro) {
    filtro.selected = !filtro.selected
    $emit('applyFilters', filtrosModal.value.filter(f => f.selected))
  }
}

</script>
