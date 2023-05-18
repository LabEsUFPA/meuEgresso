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

        <RouterLink to="/egresso" v-show="userLoggedGroupID === 3">
          <div
            class="w-32 p-2 pr-8 hover:bg-sky-100 text-start text-blue-900"
            @click="toggleUserMenu()"
          >
            Perfil
          </div>
        </RouterLink>

        <RouterLink :to="userLoggedGroupID === 3 ? '/conta-egresso' : '/conta-admin'">
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

import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiMenuDown, mdiMenuUp } from '@mdi/js'
import { useLoginStore } from 'src/store/LoginStore'

interface Props {
  userLogged: boolean
}

const props = withDefaults(defineProps<Props>(), {
  userLogged: false
})

const { userLogged } = props

const store = useLoginStore()
const userLoggedName = ref(userLogged ? store.getLoggedUser()?.username : '')
const userLoggedGroupID = ref(userLogged ? store.getLoggedUser()?.grupos[0].id : '')
console.log(userLoggedGroupID)

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