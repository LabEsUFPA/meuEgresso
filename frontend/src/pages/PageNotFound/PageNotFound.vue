<template>
  <div class="h-full w-full flex justify-center items-center flex-col">
    <h1 class="text-9xl text-center text-sky-800 mb-10">
      404
    </h1>

    <div class="mb-10">
      Pagina não encontrada
    </div>

    <CustomButton @click="$router.go(-1)">
      Voltar
    </CustomButton>
  </div>
</template>

<script lang="ts" setup>
import CustomButton from 'src/components/CustomButton.vue'
import { useRouter } from 'vue-router'

const $router = useRouter()
</script>
