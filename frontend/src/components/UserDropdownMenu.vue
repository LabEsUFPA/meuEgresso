<template>
  <ODropdown
    aria-role="list"
    position="bottom-left"
    menu-class="flex flex-col bg-white p-2 whitespace-nowrap rounded-md shadow-xl border-[1px] border-gray-200')"
  >
    <template #trigger="{active}">
      <button
        class="flex w-fit gap-3 py-4 rounded items-center justify-end"
      >
        <h1 class="text-sm font-semibold">
          {{ userLoggedName }}
        </h1>
        <img
          v-if="fotoEgresso"
          @error="!fotoEgresso"
          :src="fotoEgresso"
          class="w-8 h-8 object-cover rounded-full border-2 border-sky-200/80"
        >
        <img
          v-else
          :src="eagle"
          class="w-8 h-8 p-2 rounded-full flex items-center justify-center shrink-0 bg-sky-200"
        >

        <SvgIcon
          type="mdi"
          class="inline"
          size="24"
          :path="active ? mdiMenuUp : mdiMenuDown"
        />
      </button>
    </template>

    <ODropdownItem
      v-for="(opcao, index) in opcoesMenu.filter(op => op.scope.includes(String(userScope)))"
      :key="index"
      aria-role="listitem"
      role="button"
      override
      :item-class="classNames({
        ['p-2 pr-8 rounded']: true,
        ['text-cyan-600 hover:bg-sky-300/30'] : opcao.title !== 'Sair',
        ['text-red-500 hover:bg-red-300/30'] : opcao.title === 'Sair'
      })"
      @click="opcao.click()"
    >
      {{ opcao.title }}
    </ODropdownItem>
  </ODropdown>
</template>

<script lang="ts" setup>

import { ref, createApp, onMounted, watch } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiMenuDown, mdiMenuUp } from '@mdi/js'
import { ODropdown, ODropdownItem } from '@oruga-ui/oruga-next'
import { createPinia } from 'pinia'
import Api from 'src/services/api'
import classNames from 'classnames'

import { useLoginStore } from 'src/store/LoginStore'
import LocalStorage from 'src/services/localStorage'
import { useRouter } from 'vue-router'

import eagle from 'src/assets/eagle.svg'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'

interface Props {
  loggedIn: boolean
}

const props = withDefaults(defineProps<Props>(), {
  loggedIn: false
})
const pinia = createPinia()
const app = createApp({})
app.use(pinia)

const $router = useRouter()
const $loginStore = useLoginStore()
const $perfilStore = usePerfilEgressoStore()
const storage = new LocalStorage()
const userLoggedName = ref<string|undefined>('')
const userScope = ref('')
const idEgresso = ref<number|null>(null)
const fotoEgresso = ref<string|null>(null)

onMounted(async () => {
  fotoEgresso.value = null
  userLoggedName.value = $loginStore.loggedIn ? storage.getLoggedUser()?.sub : ''
  userScope.value = props.loggedIn ? String(storage.getLoggedUser()?.scope) : 'EGRESSO'

  if (userScope.value === 'EGRESSO') {
    await fetchEgresso()
    fotoEgresso.value = await $perfilStore.fetchImageEgressoUrl(String(idEgresso.value))
  }

  watch($loginStore, async () => {
    fotoEgresso.value = null
    userLoggedName.value = $loginStore.loggedIn ? storage.getLoggedUser()?.sub : ''
    userScope.value = props.loggedIn ? String(storage.getLoggedUser()?.scope) : 'EGRESSO'

    if (userScope.value === 'EGRESSO') {
      await fetchEgresso()
      fotoEgresso.value = await $perfilStore.fetchImageEgressoUrl(String(idEgresso.value))
    }
  })
})

const userLogout = () => {
  $loginStore.userLogout()
  $router.push('/entrar')
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

const opcoesMenu = [
  { title: 'Painel', click: () => $router.push('/painel-admin'), scope: ['ADMIN', 'SECRETARIO'] },
  { title: 'Perfil', click: () => $router.push('/egresso'), scope: ['EGRESSO'] },
  { title: 'Editar conta', click: () => $router.push('/conta'), scope: ['EGRESSO', 'ADMIN', 'SECRETARIO'] },
  { title: 'Sair', click: userLogout, scope: ['EGRESSO', 'ADMIN', 'SECRETARIO'] }
]

</script>
