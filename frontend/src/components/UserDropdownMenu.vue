<template>
  <button
    class="relative w-fit gap-x-2 md:flex rounded items-center justify-end"
    @click="toggleUserMenu()"
    @blur="delayedToggleUserMenu()"
  >
    <h1 class="text-sm font-semibold">
      {{ userLoggedName }}
    </h1>

    <div class="flex flex-col justify-end">
      <SvgIcon
        type="mdi"
        class="inline"
        size="24"
        :path="userMenuIsOpen ? mdiMenuUp : mdiMenuDown"
      />

      <div
        v-show="userMenuIsOpen"
        id="dropdown"
        class="absolute shadow-md bg-white min-w-32 z-50 cursor-pointer right-[1px] max-h-96 overflow-y-auto top-8 py-3 rounded-lg border border-t-0 text-sm justify-self-end"
      >
        <RouterLink
          to="/egresso"
          v-show="isEgress"
        >
          <div
            class="w-32 p-2 pr-8 hover:bg-sky-100 text-start text-blue-900"
            @click="toggleUserMenu()"
          >
            Perfil
          </div>
        </RouterLink>
        <RouterLink :to="isEgress ? '/conta-egresso' : '/conta-admin'">
          <div
            class="w-32 p-2 pr-8 hover:bg-sky-100 text-start text-blue-900"
            @click="toggleUserMenu()"
          >
            Editar conta
          </div>
        </RouterLink>

        <RouterLink to="/entrar">
          <div
            class="w-32 p-2 hover:bg-red-100 border-t text-start text-red-500"
            @click="userLogout()"
          >
            Sair
          </div>
        </RouterLink>
      </div>
    </div>
  </button>
</template>

<script lang="ts" setup>

import { ref, createApp } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiMenuDown, mdiMenuUp } from '@mdi/js'
import { createPinia } from 'pinia'
import { useLoginStore } from 'src/store/LoginStore'
import LocalStorage from 'src/services/localStorage'

interface Props {
  userLogged: boolean
}

const props = withDefaults(defineProps<Props>(), {
  userLogged: false
})
const pinia = createPinia()
const app = createApp({})
app.use(pinia)

const store = useLoginStore()
const storage = new LocalStorage()
const userLoggedName = ref(props.userLogged ? storage.getLoggedUser()?.sub : '')
const isEgress = ref(props.userLogged ? storage.getLoggedUser()?.scope === 'EGRESSO' : false)

const userMenuIsOpen = ref(false)
const toggleUserMenu = () => {
  userMenuIsOpen.value = !userMenuIsOpen.value
}

const delayedToggleUserMenu = () => setTimeout(() => toggleUserMenu(), 150)

const userLogout = () => {
  store.userLogout()
  toggleUserMenu()
}

defineExpose({ toggleUserMenu, userMenuIsOpen })

</script>
