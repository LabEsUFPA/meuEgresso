<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex gap-4 w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl px-8 pt-8 pb-4 mt-10 mx-6 items-center">
        <RouterLink
          to="/vagas"
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

        <div class="w-8 h-8 bg-cyan-800 rounded-3xl" />

        <div class="flex flex-col text-cyan-800">
          <p class="text-lg font-medium">
            {{ anuncio.nome }}
          </p>
          <p class="text-sm font-normal">
            anunciou uma vaga
          </p>
        </div>
      </div>
    </div>

    <div class="flex justify-center">
      <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl mx-6 mb-10 px-2 pb-2">
        <div class="flex flex-col gap-8 px-8 py-8 border-b-[1px] border-b-gray-200">
          <h1 class="text-cyan-600 text-2xl font-bold">
            {{ anuncio.titulo }}
          </h1>

          <div class="flex gap-4 items-center text-gray-400">
            <div class="p-2 bg-gray-100 rounded-md">
              <SvgIcon
                type="mdi"
                size="21"
                :path="mdiBullhorn"
              />
            </div>

            <div class="flex flex-col">
              <p class="text-sm font-semibold">
                Área de emprego
              </p>
              <p class="text-sm">
                {{ anuncio.area }}
              </p>
            </div>
          </div>

          <div class="flex flex-col gap-1">
            <h2 class="text-neutral-900 text-lg font-semibold">
              Descrição
            </h2>
            <p class="text-neutral-900">
              {{ anuncio.descricao }}
            </p>
          </div>

          <div class="flex flex-col gap-1">
            <h2 class="text-neutral-900 text-lg font-semibold">
              Salário
            </h2>
            <p class="text-neutral-900">
              R$ {{ anuncio.salario }}
            </p>
          </div>
        </div>

        <div class="flex flex-col gap-6 px-8 pb-8 pt-4">
          <div class="flex flex-col gap-1">
            <h2 class="text-neutral-900 text-lg font-semibold">
              Contato
            </h2>

            <CustomButtonLink
              color="emerald"
              :url="anuncio.linkContato"
              :icon-path="mdiOpenInNew"
            >
              Link externo
            </CustomButtonLink>
          </div>

          <div class="flex justify-end">
            <p class="text-gray-400 text-sm">
              Vaga disponível até {{ anuncio.dataExpiracao.split('-').reverse().join('/') }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronLeft, mdiBullhorn, mdiOpenInNew } from '@mdi/js'

import CustomButtonLink from 'src/components/CustomButtonLink.vue'

const $route = useRoute()
const { id } = $route.params

const defaultProps = {
  id: 0,
  nome: 'Nome Completo',
  titulo: 'Título da vaga',
  area: 'Área de emprego',
  descricao: 'Descrição da vaga',
  salario: 0,
  linkContato: 'https://www.ufpa.br/',
  dataExpiracao: '31-12-2023'
}

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

const fetchAnuncio = (id: number) => {
  return anuncios[id - 1]
}

const anuncio = ref(defaultProps)

onMounted(() => {
  anuncio.value = fetchAnuncio(Number(id))
})

</script>
