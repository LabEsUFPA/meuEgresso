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

          <div class="hidden md:flex">
            <UserDropdownMenu
              v-if="loggedIn"
              :logged-in="loggedIn"
            />

            <div
              v-else
              class="flex px-8 gap-x-2"
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
            <NavbarDrawer />
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
              size="90"
              class="text-amber-500 absolute bottom-[13rem] bg-white rounded-full sm:bottom-[21rem]"
              :path="mdiAlertCircle"
            />
          </div>
          <div class="flex flex-col w-full h-[230px] items-center justify-center sm:h-full">
            <div class="flex flex-col h-full items-center justify-center text-center gap-y-8">
              <h1 class="font-bold text-amber-500 text-3xl sm:text-5xl">
                Cadastro pendente!
              </h1>
              <p class="text-gray-500 px-4 text-lg sm:px-32 sm:text-2xl">
                É necessário realizar o cadastro completo para usar o sistema.
              </p>
            </div>
            <CustomButton
              text-class="text-white font-bold text-lg p-20 py-2"
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
      <div class="flex flex-col bg-gradient-to-br from-pacific-cyan to-bondi-blue text-white items-start px-14 py-8">
        <div class="flex flex-col sm:flex-row w-full gap-4 items-center justify-between border-b-[1px] border-sky-200/20 pb-4 sm:pb-8">
          <div class="flex gap-8 items-center">
            <img
              class="w-14 self-center"
              src="src/assets/brasão.png"
              alt="Brasão"
            >
            <div class="flex flex-col gap-2 font-semibold">
              <div>Universidade Federal do Pará</div>
              <div class="text-sm">
                Faculdade de Computação
              </div>
            </div>
          </div>

          <CustomButton
            tag="a"
            color="blue"
            link="https://www.ppgcc.propesp.ufpa.br/index.php/br/"
            target="_blank"
          >
            <div class="p-2 text-xs font-medium mr-3">
              Conheça o Programa de Pós-graduação
            </div>
            <SvgIcon
              type="mdi"
              size="16"
              :path="mdiOpenInNew"
              class="shrink-0"
            />
          </CustomButton>
        </div>

        <div class="flex flex-col sm:flex-row gap-4 sm:gap-32 w-full items-start py-4 sm:py-8">
          <div class="flex flex-col gap-4">
            <div class="flex gap-4 items-center">
              <div class="w-fit rounded-lg p-2 bg-cyan-800/30">
                <SvgIcon
                  type="mdi"
                  size="16"
                  :path="mdiMapMarker"
                  class="shrink-0"
                />
              </div>

              <div class="font-medium text-normal">
                Endereço
              </div>
            </div>
            <div class="flex flex-col gap-1 text-sm">
              <div>Rua Augusto Corrêa, 01</div>
              <div>Campus Universitário do Guamá</div>
              <div>Belém, Pará, Brasil</div>
              <div>CEP 66075-110</div>
            </div>
          </div>

          <div class="flex flex-col gap-4">
            <div class="flex gap-4 items-center">
              <div class="w-fit rounded-lg p-2 bg-cyan-800/30">
                <SvgIcon
                  type="mdi"
                  size="16"
                  :path="mdiPhone"
                  class="shrink-0"
                />
              </div>
              <div class="font-medium text-normal">
                Telefones
              </div>
            </div>

            <div class="flex flex-col gap-1 text-sm">
              <div>+55 (91) 3201-7405</div>
              <div>+55 (91) 3201-7409 / 7835</div>
            </div>
          </div>

          <div class="flex flex-col gap-4">
            <div class="flex gap-4 items-center">
              <div class="w-fit rounded-lg p-2 bg-cyan-800/30">
                <SvgIcon
                  type="mdi"
                  size="16"
                  :path="mdiEmail"
                  class="shrink-0"
                />
              </div>
              <div class="font-medium text-normal">
                E-mail
              </div>
            </div>

            <a
              href="mailto:egressocomp@ufpa.br"
              class="flex flex-col gap-1 text-sm"
            >
              egressocomp@ufpa.br
            </a>
          </div>
        </div>

        <div class="flex gap-2 bg-cyan-800/30 text-sm py-2 px-4 rounded-lg self-center">
          <div>
            Desenvolvido com 💖 por discentes
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script lang="ts" setup>
import { RouterLink, useRouter } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { watch, ref, onMounted } from 'vue'
import { mdiAlertCircle, mdiEmail, mdiMapMarker, mdiOpenInNew, mdiPhone } from '@mdi/js'

import { useLoginStore } from 'src/store/LoginStore'
import CustomButton from 'src/components/CustomButton.vue'
import UserDropdownMenu from './UserDropdownMenu.vue'
import NavbarDrawer from './NavbarDrawer.vue'
import CustomDialog from './CustomDialog.vue'
import CookieService from 'src/services/cookieService'

const $store = useLoginStore()
const loggedIn = ref($store.loggedIn)
const $router = useRouter()
const showEgressNotRegisteredModal = ref(false)
const cookieService = new CookieService()

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
  const isFirstAccess = cookieService.get('isFirstAccess')

  if (
    userData?.scope === 'EGRESSO' &&
    !userData?.isEgresso &&
    isFirstAccess !== 'yes'
  ) showEgressNotRegisteredModal.value = true
}

</script>
