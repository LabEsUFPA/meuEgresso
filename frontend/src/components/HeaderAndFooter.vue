<template>
  <div class="flex flex-col min-h-screen justify-between">
    <header class="text-white">
      <div class="bg-gradient-to-br from-pacific-cyan to-bondi-blue">
        <div class="py-4 px-8 md:pl-14 flex flex-row items-center bg-[url('src/assets/textura.svg')] h-full w-full bg-right bg-no-repeat">
          <RouterLink
            to="/"
            class="flex flex-row items-center"
          >
            <img
              class="w-12"
              src="src/assets/logo.svg"
              alt="Logo"
            >
            <div class="ml-8">
              <div class="text-lx md:text-xl">
                UFPA
              </div>
              <div class="text-2xl md:text-2xl font-semibold whitespace-nowrap">
                Sistema de Egressos
              </div>
            </div>
          </RouterLink>
          <!-- Div que preenche o espaco vazio no container flexbox -->
          <div class="flex-1" />

          <UserDropdownMenu
            v-if="userLogged"
            :user-logged="userLogged"
          />

          <div
            v-else
            class="px-8 hidden gap-x-2 md:flex"
          >
            <CustomButton
              color="white"
              variant="flat"
              tag="router"
              link="/entrar"
            >
              Entrar
            </CustomButton>

            <CustomButton
              class="ml-4"
              color="white"
              variant="outlined"
              tag="router"
              link="/cadastro-perfil"
            >
              Cadastre-se
            </CustomButton>
          </div>
        </div>
      </div>
      <div class="h-10 bg-aero">
        <nav class="h-full pl-6">
          <ul class="text-cyan-800 w-96 h-full font-semibold hidden md:flex flex-row justify-around items-center">
            <li class="cursor-pointer relative group hover:text-white h-full">
              <RouterLink to="/">
                <div class="h-full flex items-center">
                  Mapa
                </div>
              </RouterLink>
              <!--
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
              -->
            </li>
            <li class="cursor-pointer relative group hover:text-white h-full">
              <RouterLink to="/graficos">
                <div class="h-full flex items-center">
                  Gráficos
                </div>
              </RouterLink>
              <!--
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
              -->
            </li>
            <li class="cursor-pointer relative group hover:text-white h-full">
              <RouterLink to="/vagas">
                <div class="h-full flex items-center">
                  Vagas
                </div>
              </RouterLink>
              <!--
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
              -->
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
                  <RouterLink
                    to="/entrar"
                    class="block py-2 px-3 hover:bg-gray-100"
                  >
                    Entrar
                  </RouterLink>
                </li>
                <li>
                  <RouterLink
                    to="/cadastro-perfil"
                    class="block py-2 px-3 hover:bg-gray-100"
                  >
                    Cadastre-se
                  </RouterLink>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <main class="h-full">
      <RouterView />
    </main>
    <footer>
      <div class="bg-gradient-to-br h-24 from-pacific-cyan to-bondi-blue flex flex-row items-center justify-start pl-20">
        <div class="mr-10">
          <img
            class="w-14"
            src="src/assets/brasão.png"
            alt="Brasão"
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

import { RouterLink } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { watch, ref } from 'vue'
import { mdiMenu } from '@mdi/js'

import { useLoginStore } from 'src/store/LoginStore'
import CustomButton from 'src/components/CustomButton.vue'
import UserDropdownMenu from './UserDropdownMenu.vue'

const store = useLoginStore()
const userLogged = ref(store.userLogged)

watch(() => store.userLogged, () => {
  userLogged.value = store.userLogged
})

</script>
