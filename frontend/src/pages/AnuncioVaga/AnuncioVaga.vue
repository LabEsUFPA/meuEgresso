
<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex gap-2 sm:gap-4 w-[960px] p-4 sm:p-6 border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl mt-10 mx-4 sm:mx-6 items-center">
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

        <div class="flex w-12 h-12 justify-center object-cover items-center rounded-full bg-cyan-800 overflow-hidden">
          <img
            v-if="fotoUsuario"
            @error="!fotoUsuario"
            :src="fotoUsuario"
            class="w-12 h-12 object-cover rounded-full border-2 border-sky-200/80"
          >
          <img
            v-else
            :src="eagle"
            class="w-12 h-12 p-2 rounded-full flex items-center justify-center shrink-0 bg-sky-200"
          >
        </div>

        <div class="flex flex-col text-cyan-800">
          <p class="text-sm sm:text-lg font-medium leading-tight">
            {{ $store.anuncio.createdByUser.nome }}
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
              v-if="$store.anuncio.salario != '0.00'"
              class="text-neutral-900"
            >
              {{ formataSalario(parseFloat($store.anuncio.salario)) }}
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

          <div class="flex flex-col gap-4 items-end">
            <p class="text-gray-400 text-sm">
              Vaga disponível até {{ $store.anuncio.dataExpiracao.split('-').reverse().join('/') }}
            </p>
            <CustomButton
              v-show="tipoUsuario === 'ADMIN' || userId === $store.anuncio.createdByUser.id"
              type="button"
              color="red"
              variant="flat"
              class="w-fit"
              @click="openDeleteConfirmation = true"
            >
              <SvgIcon
                type="mdi"
                size="21"
                :path="mdiDelete"
                class="mr-2"
              />
              <div>Apagar</div>
            </CustomButton>
          </div>
        </div>
      </div>
    </div>
  </div>

  <CustomDialog
    v-model="openDeleteConfirmation"
  >
    <div class="flex flex-col gap-2 h-full w-full">
      <div class="flex flex-col gap-4 h-full justify-center items-center">
        <SvgIcon
          type="mdi"
          size="48"
          :path="mdiDeleteForever"
          class="text-red-500"
        />
        <h1 class="text-cyan-800 font-medium text-xl text-center">
          Excluir anúncio permanentemente?
        </h1>
      </div>

      <div class="flex gap-8 justify-center px-8 pb-8">
        <CustomButton
          type="button"
          color="gray"
          class="w-fit"
          @click="openDeleteConfirmation = false"
        >
          Cancelar
        </CustomButton>
        <CustomButton
          type="button"
          color="emerald"
          class="w-fit"
          @click="onDeleteAnuncio"
        >
          Confirmar
        </CustomButton>
      </div>
    </div>
  </CustomDialog>
</template>

<script setup lang="ts">

import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronLeft, mdiBullhorn, mdiOpenInNew, mdiDelete, mdiDeleteForever } from '@mdi/js'

import { useAnuncioVagaStore } from 'src/store/AnuncioVagaStore'
import { useLoginStore } from 'src/store/LoginStore'
import CustomButton from 'src/components/CustomButton.vue'
import CustomDialog from 'src/components/CustomDialog.vue'
import eagle from 'src/assets/eagle.svg'

const $store = useAnuncioVagaStore()
const $route = useRoute()
const $router = useRouter()
const { id } = $route.params
$store.getAnuncioId(parseInt(id.toString()))
const $loginStore = useLoginStore()
const tipoUsuario = ref('')
const userId = ref(0)
const fotoUsuario = ref($store.anuncio.createdByUser.foto)

onMounted(() => {
  if ($loginStore.loggedIn) {
    tipoUsuario.value = $loginStore.getUserData()?.scope ?? ''
  }
  if (tipoUsuario.value === 'EGRESSO') {
    userId.value = $loginStore.getUserData()?.idUsuario ?? 0
  }
})

const openDeleteConfirmation = ref(false)
const onDeleteAnuncio = () => {
  if (tipoUsuario.value === 'ADMIN') {
    $store.deleteAnuncioAdmin($store.anuncio.id)
  } else {
    $store.deleteAnuncioEgresso($store.anuncio.id)
  }

  openDeleteConfirmation.value = false
  $router.push('/vagas')
}

const formataSalario = (value:number) => {
  const formattedValue = value.toLocaleString('pt-BR', {
    style: 'currency',
    currency: 'BRL'
  })
  console.log(value)
  return formattedValue
}

</script>
