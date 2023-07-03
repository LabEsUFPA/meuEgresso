<template>
  <div
    class="flex gap-1 sm:gap-3 justify-center items-center"
  >
    <button
      class="flex hover:bg-sky-200/50 text-sky-600 font-medium items-center p-2 rounded-lg"
      v-show="currentPage>0"
      @click="decrementaPage()"
    >
      <SvgIcon
        type="mdi"
        size="32"
        :path="mdiChevronLeft"
      />
    </button>

    <div
      v-if="totalPages <= 5"
      class="flex gap-1 sm:gap-2 text-sm sm:text-base"
    >
      <button
        variant="flat"
        type="button"
        color="sky"
        v-for="pageNumber in totalPages"
        :key="pageNumber"
        class="flex hover:bg-sky-200/50 text-sky-600 font-medium items-center py-2 px-2 sm:px-4 rounded-md"
        :class="{['bg-sky-200']: currentPage + 1 === pageNumber}"
        @click="navigateToPage(pageNumber - 1)"
      >
        {{ pageNumber }}
      </button>
    </div>

    <div
      v-else
      class="flex gap-1 sm:gap-2 text-sm sm:text-base"
    >
      <div
        v-for="pageNumber in getPagesShown()"
        :key="pageNumber"
      >
        <div v-if="pageNumber > 0">
          <button
            variant="flat"
            type="button"
            color="sky"
            class="flex hover:bg-sky-200/50 text-sky-600 font-medium items-center py-2 px-2 sm:px-4 rounded-md"
            :class="{[`bg-sky-200`]: currentPage + 1 === pageNumber}"
            @click="navigateToPage(pageNumber - 1)"
          >
            {{ pageNumber }}
          </button>
        </div>
        <h1
          v-else
          class="flex text-sky-600 font-medium items-center py-2 px-4"
        >
          ...
        </h1>
      </div>
    </div>

    <button
      class="flex hover:bg-sky-200/50 text-sky-600 font-medium items-center p-2 rounded-md"
      v-show="currentPage < totalPages - 1"
      @click="incrementaPage()"
    >
      <SvgIcon
        type="mdi"
        size="32"
        :path="mdiChevronRight"
      />
    </button>
  </div>
</template>

<script setup lang='ts'>

import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronRight, mdiChevronLeft } from '@mdi/js'

const props = defineProps<{
  currentPage: number,
  totalPages: number
}>()

const $emits = defineEmits(['update:currentPage'])

const getPagesShown = () => {
  const pagesShown = new Set<number>()
  const current = props.currentPage + 1

  pagesShown.add(1)
  pagesShown.add(current - 1)
  pagesShown.add(current)
  pagesShown.add(current + 1)
  pagesShown.add(props.totalPages)

  const pagesShownArray = [...pagesShown].filter(p => p > 0 && p <= props.totalPages).sort((a, b) => a - b)
  const pagination = []

  for (let i = 0; i < pagesShownArray.length - 1; i++) {
    pagination.push(pagesShownArray[i])
    if (pagesShownArray[i + 1] - pagesShownArray[i] > 1) {
      pagination.push(0)
    }
  }
  pagination.push(pagesShownArray[pagesShownArray.length - 1])

  return pagination
}

const navigateToPage = (page:number) => {
  $emits('update:currentPage', page)
}

const incrementaPage = () => {
  $emits('update:currentPage', props.currentPage + 1)
}

const decrementaPage = () => {
  $emits('update:currentPage', props.currentPage - 1)
}
</script>
