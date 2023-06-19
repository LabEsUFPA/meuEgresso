<template>
  <div class="flex flex-col w-[960px] bg-white rounded-2xl mx-4 sm:mx-6">
    <div class="flex gap-4 px-6 sm:px-8 pt-6 sm:pt-8 pb-4 items-center border-b-[1px] border-b-gray-200">
      <div class="shrink-0 p-2 bg-cyan-800 rounded-3xl text-white">
        <SvgIcon
          type="mdi"
          size="21"
          :path="mdiAccount"
        />
      </div>

      <div class="flex flex-col text-cyan-800">
        <p class="text-sm sm:text-lg font-medium leading-tight">
          {{ nome }}
        </p>
        <p class="flex text-xs sm:text-sm font-normal">
          anunciou uma vaga
        </p>
      </div>
    </div>

    <div class="flex flex-col gap-4 p-6 sm:p-8 border-b-[1px] border-b-gray-200">
      <h1 class="text-cyan-600 text-xl sm:text-2xl font-bold">
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

      <p
        v-show="salario"
        class="text-neutral-900 font-medium"
      >
        {{ salario }}
      </p>
    </div>

    <div class="flex justify-end px-6 sm:px-8 pb-6 sm:pb-8 pt-4">
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
import { mdiAccount, mdiBullhorn, mdiChevronRight } from '@mdi/js'

import CustomButton from 'src/components/CustomButton.vue'

defineProps<
  {
  id: Number,
  nome: String,
  titulo: String,
  area: String,
  descricao: String,
  salario: String,
}>()

</script>
