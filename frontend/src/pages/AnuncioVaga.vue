<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex gap-2 sm:gap-4 w-[960px] px-6 sm:px-8 pt-6 sm:pt-8 pb-4 border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl mt-10 mx-4 sm:mx-6 items-center">
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

        <div class="shrink-0 p-2 bg-cyan-800 rounded-3xl text-white">
          <SvgIcon
            type="mdi"
            size="21"
            :path="mdiAccount"
          />
        </div>

        <div class="flex flex-col text-cyan-800">
          <p class="text-sm sm:text-lg font-medium leading-tight">
            {{ $store.anuncio.createdBy.nome }}
          </p>
          <p class="flex text-xs sm:text-sm font-normal">
            anunciou uma vaga
          </p>
        </div>
      </div>
    </div>

    <div class="flex justify-center">
      <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl mx-4 sm:mx-6 mb-10">
        <div class="flex flex-col gap-6 sm:gap-8 p-6 sm:p-8 border-b-[1px] border-b-gray-200">
          <h1 class="text-cyan-600 text-xl sm:text-2xl font-bold">
            {{ $store.anuncio.titulo }}
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
                {{ $store.anuncio.areaEmprego.nome }}
              </p>
            </div>
          </div>

          <div class="flex flex-col gap-1">
            <h2 class="text-neutral-900 text-lg font-semibold">
              Descrição
            </h2>
            <p class="text-neutral-900">
              {{ $store.anuncio.descricao }}
            </p>
          </div>

          <div class="flex flex-col gap-1">
            <h2 class="text-neutral-900 text-lg font-semibold">
              Salário
            </h2>
            <p
              v-if="$store.anuncio.salario"
              class="text-neutral-900"
            >
              R$ {{ $store.anuncio.salario }}
            </p>
            <p
              v-else
              class="text-gray-400"
            >
              Não foi informado
            </p>
          </div>
        </div>

        <div class="flex flex-col gap-6 px-6 sm:px-8 pb-6 sm:pb-8 pt-4">
          <div class="flex flex-col gap-1">
            <h2 class="text-neutral-900 text-lg font-semibold">
              Contato
            </h2>

            <CustomButton
              tag="a"
              color="emerald"
              :link="$store.anuncio.link"
              class="w-fit"
              target="_blank"
            >
              <SvgIcon
                type="mdi"
                size="21"
                :path="mdiOpenInNew"
                class="mr-2"
              />
              <div>
                Link externo
              </div>
            </CustomButton>
          </div>

          <div class="flex justify-end">
            <p class="text-gray-400 text-sm">
              Vaga disponível até {{ $store.anuncio.dataExpiracao.split('-').reverse().join('/') }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

import { useRoute } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronLeft, mdiBullhorn, mdiOpenInNew, mdiAccount } from '@mdi/js'
import { useAnuncioVagaStore } from 'src/store/AnuncioVagaStore'

import CustomButton from 'src/components/CustomButton.vue'

const $store = useAnuncioVagaStore()
const $route = useRoute()
const { id } = $route.params
$store.getAnuncioId(parseInt(id.toString()))

</script>
