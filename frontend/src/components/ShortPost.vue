<template>
  <div class="flex flex-col w-[960px] bg-white rounded-2xl mx-6 p-2">
    <div class="flex gap-4 px-8 pt-8 pb-4 items-center border-b-[1px] border-b-gray-200">
      <div class="w-8 h-8 bg-cyan-800 rounded-3xl" />

      <div class="flex flex-col text-cyan-800">
        <p class="text-lg font-medium">
          {{ nome }}
        </p>
        <p class="text-sm font-normal">
          anunciou uma vaga
        </p>
      </div>
    </div>

    <div class="flex flex-col gap-4 px-8 py-8 border-b-[1px] border-b-gray-200">
      <h1 class="text-cyan-600 text-2xl font-bold">
        {{ titulo }}
      </h1>

      <div class="flex gap-4 items-center text-gray-400">
        <div class="p-2 bg-gray-100 rounded-md">
          <SvgIcon
            type="mdi"
            size="21"
            :path="mdiBullhorn"
          />
        </div>

        <p class="text-sm">
          {{ area }}
        </p>
      </div>

      <p class="text-neutral-900">
        {{ descricao }}
      </p>

      <p class="text-neutral-900 font-medium">
        R$ {{ salario }}
      </p>
    </div>

    <div class="flex justify-end px-8 pb-8 pt-4">
      <CustomButton
        tag="router"
        :link="`/vagas/${id}`"
        variant="outlined"
        color="emerald"
      >
        <div>
          Ver mais
        </div>
        <SvgIcon
          type="mdi"
          size="32"
          :path="mdiChevronRight"
        />
      </CustomButton>
    </div>
  </div>
</template>

<script setup lang="ts">

import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBullhorn, mdiChevronRight } from '@mdi/js'

import CustomButton from 'src/components/CustomButton.vue'

defineProps<
  {
  id: 0,
  nome: 'Nome Completo',
  titulo: 'Título da vaga',
  area: 'Área de emprego',
  descricao: 'Descrição da vaga',
  salario: 0
}>()

</script>
