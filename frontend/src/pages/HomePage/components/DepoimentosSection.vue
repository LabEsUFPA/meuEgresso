<template>
  <div class="flex flex-col items-center my-16">
    <div class="w-[1728px] bg-gradient-to-b from-sky-200 to-indigo-200 rounded-2xl">
      <div v-if="depoimentosMock.length > 0">
        <div class="flex flex-wrap justify-center my-8 mx-9">
          <div class="flex w-full items-center justify-between p-6 sm:p-8">
            <div class="flex items-center gap-2">
              <div class="w-[32px] p-2 text-cyan-800">
                <SvgIcon
                  type="mdi"
                  size="24"
                  :path="mdiMessageText"
                />
              </div>
              <h1 class="text-cyan-800 text-xl sm:text-2xl font-bold">
                Depoimentos
              </h1>
            </div>
            <div>
              <CustomButton
                tag="router"
                variant="standard"
                color="blue"
              >
                <div>
                  Envie seu depoimento
                </div>
              </CustomButton>
            </div>
          </div>
          <div class="flex flex-row flex-wrap justify-center w-full">
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
    descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
