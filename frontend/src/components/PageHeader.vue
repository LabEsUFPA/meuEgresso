<template>
  <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
    <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
      <div class="flex gap-6 text-cyan-800 items-center">
        <RouterLink
          id="back-button"
          v-show="backTo"
          :to="backTo ? backTo : '/'"
          class="flex h-full"
        >
          <button
            class="flex h-full items-center hover:bg-cyan-600/20 active:bg-cyan-600/40 text-cyan-800 rounded-md"
          >
            <SvgIcon
              type="mdi"
              size="32"
              :path="mdiChevronLeft"
            />
          </button>
        </RouterLink>
        <SvgIcon
          type="mdi"
          size="32"
          :path="iconPath"
        />
        <h1 class="text-2xl sm:text-3xl font-bold">
          {{ titulo }}
        </h1>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronLeft } from '@mdi/js'

defineProps<{
    iconPath: string,
    titulo: string,
    backTo?: string
}>()

</script>
