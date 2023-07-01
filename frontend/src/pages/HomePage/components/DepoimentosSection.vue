<template>
  <div v-show="depoimentosMock.length > 0">
    <div class="flex flex-col gap-4 sm:gap-8 items-center bg-gradient-to-b from-sky-200 to-indigo-200 rounded-2xl mx-2 my-6 p-4 sm:p-8">
      <div class="flex flex-col sm:flex-row gap-4 w-full justify-between items-start sm:items-center">
        <div class="flex gap-3 sm:gap-6 justify-center">
          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiMessageText"
            class="text-cyan-800"
          />
          <h1 class="text-cyan-800 text-xl sm:text-2xl font-bold">
            Depoimentos
          </h1>
        </div>

        <CustomButton
          tag="router"
          link="/entrar"
          variant="standard"
          color="blue"
        >
          Envie seu depoimento
        </CustomButton>
      </div>
      <div class="flex flex-wrap flex-col md:flex-row justify-center w-full gap-4 sm:gap-8">
        <ItemDepoimento
          v-for="depoimento in depoimentosMock"
          :key="depoimento.id"
          :id="depoimento.id"
          :nome="depoimento.nome"
          :descricao="depoimento.descricao"
          :foto="depoimento.foto"
        />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

import { ref, onMounted } from 'vue'
import { useAnuncioVagaStore } from 'src/store/AnuncioVagaStore'
import ItemDepoimento from './ItemDepoimento.vue'
import { mdiMessageText } from '@mdi/js'
import SvgIcon from '@jamescoyle/vue-icon'
import CustomButton from 'src/components/CustomButton.vue'

const depoimentosMock = [
  {
    id: 1,
    nome: 'Marcus Loureiro',
    descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    foto: 'foto egresso'
  },
  {
    id: 2,
    nome: 'Victor Silva',
    descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    foto: 'foto egresso'
  },
  {
    id: 3,
    nome: 'Vitória Nauanda',
    descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    foto: 'foto egresso'
  }
]

const $store = useAnuncioVagaStore()

const loading = ref(false)

onMounted(async () => {
  await $store.fetchAreasEmprego()
  loading.value = true
})

</script>
