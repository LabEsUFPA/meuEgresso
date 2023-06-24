<template>
  <button
    class="px-4 py-1 peer flex items-center font-bold"
    @click="toggleNavbarVisibility"
  >
    <SvgIcon
      type="mdi"
      class="inline mr-3"
      size="35"
      :path="mdiMenu"
    />

    Menu
  </button>

  <OSidebar
    fullheight
    overlay
    v-model:open="isOpen"
    class="z-1"
    content-class="flex flex-col w-4/6 bg-white justify-between"
  >
    <div class="bg-gradient-to-br from-pacific-cyan to-bondi-blue pb-8">
      <div class="flex flex-col gap-8 p-4 justify-center items-center mb-4">
        <CustomButton
          variant="flat"
          color="sky"
          class="self-start"
        >
          <SvgIcon
            type="mdi"
            class="inline text-white"
            size="32"
            :path="mdiBackburger"
            @click="toggleNavbarVisibility"
          />
        </CustomButton>

        <img
          class="w-12"
          src="/src/assets/logo.svg"
          alt="Logo"
        >

        <RouterLink
          v-if="$loginStore.loggedIn"
          :to="isEgress ? '/egresso' : '/painel-admin'"
          @click="toggleNavbarVisibility"
          class="flex flex-col w-full gap-2 p-4 bg-sky-200/20 text-white rounded-md"
        >
          <div class="flex gap-4 items-center">
            <img
              v-if="fotoEgresso"
              @error="!fotoEgresso"
              :src="fotoEgresso"
              class="w-10 h-10 object-cover rounded-full border-2 border-sky-200/80"
            >
            <img
              v-else
              :src="eagle"
              class="w-10 h-10 p-2 rounded-full flex items-center justify-center shrink-0 bg-sky-200"
            >
            <h1 class="font-bold">
              {{ userLoggedName }}
            </h1>
          </div>

          <div
            class="flex justify-end items-center text-xs font-normal"
          >
            <h1>
              {{ isEgress ? 'Perfil' : 'Painel' }}
            </h1>

            <SvgIcon
              type="mdi"
              class="inline"
              size="16"
              :path="mdiChevronRight"
            />
          </div>
        </RouterLink>

        <div
          v-else
          class="flex flex-col sm:flex-row w-full gap-2 mb-4 justify-center"
        >
          <CustomButton
            color="white"
            variant="flat"
            tag="router"
            link="/entrar"
          >
            <div @click="toggleNavbarVisibility">
              Entrar
            </div>
          </CustomButton>

          <CustomButton
            color="white"
            variant="outlined"
            tag="router"
            link="/cadastro-perfil"
          >
            <div @click="toggleNavbarVisibility">
              Cadastre-se
            </div>
          </CustomButton>
        </div>
      </div>

      <RouterLink
        v-for="navButton in navButtons"
        :key="navButton.title"
        :to="navButton.navigateTo"
        @click="toggleNavbarVisibility"
      >
        <div
          class="flex p-4 justify-between items-center text-white font-bold hover:bg-sky-200/20"
          :class="{'bg-sky-200/40 hover:bg-sky-200/40': $route.path === navButton.navigateTo}"
        >
          <h1>
            {{ navButton.title }}
          </h1>

          <SvgIcon
            type="mdi"
            class="inline"
            size="24"
            :path="mdiChevronRight"
          />
        </div>
      </RouterLink>
    </div>

    <div
      v-if="$loginStore.loggedIn"
      class="flex flex-col bg-white pb-4"
    >
      <RouterLink to="/conta">
        <div
          class="flex gap-2 w-full p-4 hover:bg-sky-100 text-start text-sky-900 text-sm items-center"
          @click="toggleNavbarVisibility"
        >
          <SvgIcon
            type="mdi"
            class="inline"
            size="21"
            :path="mdiCog"
          />
          Editar conta
        </div>
      </RouterLink>

      <RouterLink to="/entrar">
        <div
          class="flex gap-2 w-full p-4 hover:bg-red-100 text-start text-red-500 text-sm"
          @click="userLogout()"
        >
          <SvgIcon
            type="mdi"
            class="inline"
            size="21"
            :path="mdiLogoutVariant"
          />
          Sair
        </div>
      </RouterLink>
    </div>
  </OSidebar>
</template>

<script setup lang='ts'>
import { onMounted, ref, watch } from 'vue'
import { OSidebar } from '@oruga-ui/oruga-next'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiBackburger, mdiChevronRight, mdiCog, mdiLogoutVariant, mdiMenu } from '@mdi/js'
import { useRoute } from 'vue-router'

import CustomButton from './CustomButton.vue'
import { useLoginStore } from 'src/store/LoginStore'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import LocalStorage from 'src/services/localStorage'
import Api from 'src/services/api'
import eagle from 'src/assets/eagle.svg'

const $loginStore = useLoginStore()
const $perfilStore = usePerfilEgressoStore()
const storage = new LocalStorage()
const $route = useRoute()
const isOpen = ref(false)

const userLoggedName = ref<string|undefined>('')
const isEgress = ref(true)

const idEgresso = ref<number|null>(null)
const fotoEgresso = ref<string|null>(null)

onMounted(async () => {
  userLoggedName.value = $loginStore.loggedIn ? storage.getLoggedUser()?.sub : ''
  isEgress.value = $loginStore.loggedIn ? storage.getLoggedUser()?.scope === 'EGRESSO' : false
  fotoEgresso.value = null

  if (isEgress.value) {
    await fetchEgresso()
    fotoEgresso.value = await $perfilStore.fetchImageEgressoUrl(String(idEgresso.value))
  }

  watch($loginStore, async () => {
    userLoggedName.value = $loginStore.loggedIn ? storage.getLoggedUser()?.sub : ''
    isEgress.value = $loginStore.loggedIn ? storage.getLoggedUser()?.scope === 'EGRESSO' : false
    fotoEgresso.value = null

    if (isEgress.value) {
      await fetchEgresso()
      fotoEgresso.value = await $perfilStore.fetchImageEgressoUrl(String(idEgresso.value))
    }
  })
})

const toggleNavbarVisibility = () => {
  isOpen.value = !isOpen.value
}

function userLogout () {
  toggleNavbarVisibility()
  $loginStore.userLogout()
}

async function fetchEgresso () {
  const response = await Api.request({
    method: 'get',
    route: '/egresso'
  })

  if (response?.status === 200) {
    idEgresso.value = response?.data.id
  }

  return response?.status != null ? response.status : 500
}

const navButtons = [
  { title: 'Mapa', navigateTo: '/' },
  { title: 'Gráficos', navigateTo: '/graficos' },
  { title: 'Vagas', navigateTo: '/vagas' }
]

</script>
