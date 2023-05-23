<template>
  <div v-show="modelValue">
    <div class="inset-0 fixed top-0 left-0 bg-black/75 flex items-center justify-center">
      <div class="flex flex-col md:w-2/4 sm:w-10/12 max-w-2xl bg-white rounded-md m-4">
        <div class="flex gap-4 px-8 pt-8 pb-4 justify-between items-center border-b-[1px] border-b-sky-200 text-cyan-800">
          <div class="flex gap-4 items-center">
            <Icon
              icon="material-symbols:edit-rounded"
              width="18"
              height="18"
            />
            <p class="text-lg font-medium">
              Editar Filtros
            </p>
          </div>

          <button
            class="hover:bg-gray-200 rounded p-1"
            @click="$emit('update:modelValue', false); $emit('close')"
          >
            <Icon
              icon="ic:round-close"
              width="18"
              height="18"
            />
          </button>
        </div>

        <div

          class="flex flex-wrap gap-4 px-8 py-8 border-b-[1px] border-b-sky-200"
        >
          <div
            v-for="filtro in filtrosAreaEmprego"
          >
            <FilterChip :title="filtro.name" />
          </div>
        </div>

        <div class="flex justify-end px-8 pb-8 pt-4">
          <RouterLink :to="`/vagas`">
            <CustomButton
              variant="outlined"
              color="emerald"
            >
              Ver mais
              <Icon
                icon="mingcute:right-line"
                width="32"
                height="32"
              />
            </CustomButton>
          </RouterLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { Icon } from '@iconify/vue'
import { onMounted, ref } from 'vue'
import FilterChip from './FilterChip.vue'

defineEmits(['update:modelValue', 'close'])
defineProps<{
    modelValue: boolean
}>()

const filtrosAreaEmprego = [
  { id: 1, name: 'Engenharia de Software' },
  { id: 2, name: 'Programação' },
  { id: 3, name: 'Suporte em TI' },
  { id: 4, name: 'Analista de Sistemas' },
  { id: 5, name: 'Analista de QA' },
  { id: 6, name: 'Outros' }
]

</script>
