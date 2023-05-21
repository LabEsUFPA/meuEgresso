<template>
    <div class="flex flex-col">

      <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
        <div class="flex w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-8 mt-10 mx-6 items-center justify-between">
          
          <div class="flex text-cyan-800 items-center">
            <Icon icon="majesticons:megaphone" width="32" height="32" class="mr-5 inline" />
            <h1 class="text-3xl font-bold">
              Vagas de emprego
            </h1>
          </div>
          
          <CustomButton type="submit" color="emerald" text-class="text-white font-medium">
            Anuncie uma vaga
            <Icon icon="mingcute:right-line" width="32" height="32" />
          </CustomButton>

        </div>
      </div>

      <div class="flex flex-col gap-8 mb-10" >

        <div class="flex justify-center">
          <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl p-2 mx-6 items-center">
            
            <div class="flex w-full px-8 pt-2 pb-4 border-b-[1px] border-sky-200">
              <Searchbar :pesquisaValue="pesquisaValue"/>
            </div>

            <div class="flex w-full items-start gap-8 px-8 pt-4 pb-8">
              
              <div class="flex gap-4 text-cyan-800 items-center">
                <Icon icon="material-symbols:filter-list-rounded" width="24" height="24" />
                <p class="font-medium text-lg">Filtros</p>
              </div>

              <div class="flex flex-wrap gap-4">

                <FilterChip title="Engenharia de software"/>
                <button 
                  class="flex gap-3 px-4 py-2 rounded-3xl items-center text-cyan-800 bg-gray-200 font-medium"
                  @click="openModalFilters()"
                >
                  <Icon icon="ic:round-plus" width="16" height="16"/>
                  <p class="text-sm">Adicionar filtro</p>
                </button>

              </div>

            </div>

          </div>
        </div>

          <div v-for="anuncio in anuncios" class="flex justify-center">
            <ShortPost
              :id="anuncio.id"
              :nome="anuncio.nome"
              :titulo="anuncio.titulo"
              :area="anuncio.area"
              :descricao="anuncio.descricao"
              :salario="anuncio.salario"
            />
          </div>
        
      </div>

    </div>

    
    <ModalFilters v-model="isModalFiltersOpen" />

    
    
    
    
    <!--
    <CustomDialog :v-model="true">
      <div class="h-full flex justify-center items-center">
        <div class="w-1/2">
          <div class="text-green-500 text-center mb-3">
            <SvgIcon
              type="mdi"
              size="100"
              class="inline"
              :path="mdiCheckCircle"
            />
          </div>
          <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
            Dados atualizados com sucesso!
          </h1>
        </div>
      </div>
    </CustomDialog>
    -->
  
  </template>
  
  <script setup lang="ts">
  
  import { Icon } from '@iconify/vue';
  import { ref, onMounted } from 'vue'
  import SvgIcon from '@jamescoyle/vue-icon'
  import { mdiCheckCircle } from '@mdi/js'
  import { OModal } from '@oruga-ui/oruga-next'

  import CustomButton from 'src/components/CustomButton.vue'
  import CustomDialog from 'src/components/CustomDialog.vue'
  import ShortPost from 'src/components/ShortPost.vue'
  import Searchbar from 'src/components/Searchbar.vue'
  import FilterChip from 'src/components/FilterChip.vue';
  import ModalFilters from 'src/components/ModalFilters.vue';

  const anuncios = [
    { 
      id: 1,
      nome: 'Victor Silva',
      titulo: 'Vaga Front-end',
      area: 'Programador',
      descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      salario: 1000.0,
      linkContato: 'https://www.google.com.br',
      dataExpiracao: '2023-08-01'
    },
    { 
      id: 2,
      nome: 'Marcus Loureiro',
      titulo: 'Vaga Back-end',
      area: 'Programador',
      descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      salario: 1200.0,
      linkContato: 'https://www.google.com.br',
      dataExpiracao: '2023-08-01'
    }
  ]

  const pesquisaValue = ref('')
  
  const isModalFiltersOpen = ref(false)

  const openModalFilters = () => {
    isModalFiltersOpen.value = true
    console.log('abre modal')
  }

  const closeModalFilters = () => {
    isModalFiltersOpen.value = false
  }
  
  </script>