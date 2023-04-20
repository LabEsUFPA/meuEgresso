<template>
  <div class="flex flex-col min-h-screen justify-between">
    <header class="text-white">
      <div class="bg-gradient-to-br from-pacific-cyan to-bondi-blue">
        <div class="py-12 pl-8 md:pl-14 flex flex-row items-end bg-[url('src/assets/textura.svg')] h-full w-full bg-right bg-no-repeat">
          <div class="flex flex-row items-center">
            <img
              class="w-16"
              src="src/assets/logo.svg"
            >
            <div class="ml-8">
              <div class="text-lx md:text-2xl">
                UFPA
              </div>
              <div class="text-2xl md:text-4xl font-semibold whitespace-nowrap">
                Sistema de Egressos
              </div>
            </div>
          </div>
          <!-- Div que preenche o espaco vazio no container flexbox -->
          <div class="flex-1" />


          <div class="px-8 hidden gap-x-2 md:flex">
            <CustomButton
              color="white"
              variant="flat"
              :is-button="false"
              :is-router="true"
              link="/entrar">
              Entrar
            </CustomButton>

            <CustomButton
              class="ml-4"
              color="white"
              variant="outlined"
              :is-button="false"
              :is-router="true"
              link="/cadastro-perfil">
              Cadastre-se
            </CustomButton>
          </div>
        </div>
      </div>
      <div class="h-14 bg-aero">
        <nav class="h-full pl-6">
          <ul class="text-cyan-800 w-96 h-full text-lg font-semibold hidden md:flex flex-row justify-around items-center">
            <li class="cursor-pointer relative group hover:text-white h-full">
              <div class="h-full flex items-center">
                Noticias
              </div>
              <div class="hidden absolute z-50 bg-cyan-900 cursor-default text-white py-3 overflow-hidden rounded-b-xl group-hover:block hover:block">
                <ul class="text-sm font-normal">
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer mb-1">
                    Anúncios
                  </li>
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer mb-1">
                    Programa
                  </li>
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer">
                    Faculdade
                  </li>
                </ul>
              </div>
            </li>
            <li class="cursor-pointer relative group hover:text-white h-full">
              <div class="h-full flex items-center">
                Estatísticas
              </div>
              <div class="hidden absolute z-50 bg-cyan-900 cursor-default text-white py-3 overflow-hidden rounded-b-xl group-hover:block hover:block">
                <ul class="text-sm font-normal">
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer mb-1">
                    Anúncios
                  </li>
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer mb-1">
                    Programa
                  </li>
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer">
                    Faculdade
                  </li>
                </ul>
              </div>
            </li>
            <li class="cursor-pointer relative group hover:text-white h-full">
              <div class="h-full flex items-center">
                Busca
              </div>
              <div class="hidden absolute z-50 bg-cyan-900 cursor-default text-white py-3 overflow-hidden rounded-b-xl group-hover:block hover:block">
                <ul class="text-sm font-normal">
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer mb-1">
                    Anúncios
                  </li>
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer mb-1">
                    Programa
                  </li>
                  <li class="py-2 px-3 pr-16 hover:bg-cyan-800 cursor-pointer">
                    Faculdade
                  </li>
                </ul>
              </div>
            </li>
          </ul>

          <div class="h-full items-center relative group flex md:hidden">
            <button class="px-4 py-1 peer flex items-center">
              <SvgIcon
                type="mdi"
                class="inline mr-3"
                size="35"
                :path="mdiMenu"
              />

              Menu
            </button>
            <div
              tabindex="0"
              class="bg-white hidden text-neutral-900 absolute left-4 top-14 group-focus-within:block z-50"
            >
              <ul class="py-3 overflow-hidden rounded-b-xl shadow-lg">
                <li>
                  <a
                    href="#"
                    class="block py-2 px-3 hover:bg-gray-100"
                  >
                    Entrar
                  </a>
                </li>
                <li>
                  <a
                    href="#"
                    class="block py-2 px-3 hover:bg-gray-100"
                  >
                    Cadastre-se
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <main>
      <RouterView />
    </main>
    <footer>
      <div class="bg-gradient-to-br h-24 from-pacific-cyan to-bondi-blue flex flex-row items-center justify-start pl-20">
        <div class="mr-10">
          <img
            class="w-14"
            src="src/assets/brasão.png"
          >
        </div>
        <div class="text-white font-semibold">
          <div class="text-lg mb-1">
            Contato
          </div>
          <ul class="text-sm">
            <li>0000-0000</li>
            <li>
              <a href="mailto:email@email.com"> email@email.com </a>
            </li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</template>

<script lang="ts" setup>
import CustomButton from 'src/components/CustomButton.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiMenu } from '@mdi/js'
</script>
