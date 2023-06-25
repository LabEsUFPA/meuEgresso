<template>
  <div class="flex flex-col min-h-screen justify-between">
    <header class="text-white">
      <div class="bg-gradient-to-br from-pacific-cyan to-bondi-blue">
        <div class="py-4 px-8 md:pl-14 flex flex-row items-center bg-[url('/src/assets/textura.svg')] h-full w-full bg-right bg-no-repeat">
          <RouterLink
            to="/"
            class="flex flex-row items-center"
          >
            <img
              class="w-12"
              src="/src/assets/logo.svg"
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
            v-if="loggedIn"
            :logged-in="loggedIn"
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
            </li>
            <li class="cursor-pointer relative group hover:text-white h-full">
              <RouterLink to="/graficos">
                <div class="h-full flex items-center">
                  Gráficos
                </div>
              </RouterLink>
            </li>
            <li class="cursor-pointer relative group hover:text-white h-full">
              <RouterLink to="/vagas">
                <div class="h-full flex items-center">
                  Vagas
                </div>
              </RouterLink>
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
    <main class="flex-1 bg-neutral-100">
      <div class="h-fit">
        <CustomDialog
          v-if="showEgressNotRegisteredModal"
          v-model="showEgressNotRegisteredModal"
          :button-botton="true"
          :hide-close-button="true"
          @close="$router.push({ path: '/cadastro' })"
        >
          <div class="flex flex-col items-center">
            <SvgIcon
              type="mdi"
              size="110"
              class="text-amber-500 absolute bottom-[13rem] bg-white rounded-full sm:bottom-[21rem]"
              :path="mdiAlertCircle"
            />
          </div>
          <div class="flex flex-col w-full h-full items-center justify-center">
            <div class="flex flex-col h-full items-center justify-center text-center gap-y-8">
              <h1 class="font-bold text-amber-500 text-3xl sm:text-5xl">
                Cadastro pendente!
              </h1>
              <p class="text-gray-500 px-4 text-lg sm:px-32 sm:text-2xl">
                É necessário realizar o cadastro completo para usar o sistema.
              </p>
            </div>
            <CustomButton
              class="mb-2"
              @click="() => {showEgressNotRegisteredModal = false}"
            >
              Finalizar Cadastro
            </CustomButton>
          </div>
        </CustomDialog>
        <RouterView />
      </div>
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
import { RouterLink, useRouter } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { watch, ref, onMounted } from 'vue'
import { mdiMenu, mdiAlertCircle } from '@mdi/js'

import { useLoginStore } from 'src/store/LoginStore'
import CustomButton from 'src/components/CustomButton.vue'
import UserDropdownMenu from './UserDropdownMenu.vue'
import CustomDialog from './CustomDialog.vue'

const $store = useLoginStore()
const loggedIn = ref($store.loggedIn)
const $router = useRouter()
const showEgressNotRegisteredModal = ref(false)

onMounted(() => {
  checkEgressRegistration()
})

watch(() => $store.loggedIn, () => {
  loggedIn.value = $store.loggedIn
  if (loggedIn.value) {
    checkEgressRegistration()
  }
})

const checkEgressRegistration = () => {
  const userData = $store.getUserData()
  if ($store.isFirstAccess === 'yes') showEgressNotRegisteredModal.value = false
  else {
    if (
      userData?.scope === 'EGRESSO' &&
      !userData?.isEgresso
    ) showEgressNotRegisteredModal.value = true
  }
}

</script>
