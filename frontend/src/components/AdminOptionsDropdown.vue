<template>
  <ODropdown
    aria-role="list"
    position="bottom-left"
    :menu-class="classNames('flex flex-col bg-white p-2 whitespace-nowrap rounded-md shadow-xl border-[1px] border-gray-200')"
  >
    <template #trigger="{active}">
      <OButton
        variant="primary"
      >
        <SvgIcon
          type="mdi"
          size="24"
          :path="mdiDotsVertical"
          class="text-cyan-800 rounded-md"
          :class="{['bg-sky-300/30'] : active}"
        />
      </OButton>
    </template>

    <ODropdownItem
      v-for="(opcao, index) in opcoesAdmin.filter(op => op.status.includes(status) && op.habilitado)"
      :key="index"
      aria-role="listitem"
      override
      :item-class="classNames({
        ['text-sm text-cyan-600 p-2 hover:bg-sky-300/30 rounded']: true,
        ['text-red-500 hover:bg-red-300/30 rounded'] : opcao.titulo === 'Excluir cadastro',
        ['text-emerald-500 hover:bg-red-emerald/30 rounded'] : opcao.titulo === 'Aprovar cadastro',
      })"
    >
      <button
        @click="() => escolheAcao(opcao.titulo)"
      >
        {{ opcao.titulo }}
      </button>
    </ODropdownItem>
  </ODropdown>

  <div class="absolute z-10">
    <CustomDialog
      @close="isLoadingAction = null"
      v-model="isConfirmationOpen"
    >
      <div
        v-if="isLoadingAction === null"
        class="flex flex-col h-full text-lg text-cyan-800 justify-center items-center p-6"
      >
        <div
          class="flex flex-col gap-4 h-full justify-center items-center"
        >
          <SvgIcon
            type="mdi"
            size="32"
            :path="mensagemDialog[action]?.icon"
            class="inline md:hidden text-cyan-800 rounded-md"
          />

          <SvgIcon
            type="mdi"
            size="64"
            :path="mensagemDialog[action]?.icon"
            class="hidden md:inline text-cyan-800 rounded-md"
          />

          <div class="flex flex-col items-center">
            <h1 class="font-medium">
              {{ mensagemDialog[action]?.text }}
            </h1>
            <h1 class="font-semibold">
              {{ nome }}?
            </h1>
          </div>
        </div>

        <div class="flex gap-4 justify-self-end">
          <CustomButton
            type="button"
            variant="flat"
            color="red"
            @click="isConfirmationOpen = false"
          >
            Cancelar
          </CustomButton>
          <CustomButton
            type="button"
            color="emerald"
            @click="() => mensagemDialog[action]?.click()"
          >
            Confirmar
          </CustomButton>
        </div>
      </div>

      <div
        v-else-if="isLoadingAction === true"
        class="flex flex-col gap-4 h-full justify-center items-center p-6"
      >
        <SvgIcon
          type="mdi"
          size="64"
          :path="mdiLoading"
          class="inline text-gray-400 animate-spin md:hidden"
        />

        <SvgIcon
          type="mdi"
          size="96"
          :path="mdiLoading"
          class="hidden text-gray-400 animate-spin md:inline"
        />
        <div class="text-cyan-800 text-xl md:text-2xl font-medium">
          {{ mensagemDialog[action]?.loading }}
        </div>
      </div>

      <div
        v-else
        class="flex flex-col gap-4 h-full justify-center items-center p-6"
      >
        <SvgIcon
          type="mdi"
          size="64"
          :path="mdiCheckCircle"
          class="inline text-green-500 md:hidden"
        />

        <SvgIcon
          type="mdi"
          size="96"
          :path="mdiCheckCircle"
          class="hidden text-green-500 md:inline"
        />
        <div class="text-cyan-800 text-xl md:text-2xl font-medium">
          {{ mensagemDialog[action]?.success }}
        </div>
      </div>
    </CustomDialog>
  </div>
</template>

<script setup lang="ts">

import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheckCircleOutline, mdiDeleteForever, mdiDotsVertical, mdiLoading, mdiCheckCircle } from '@mdi/js'
import { ODropdown, ODropdownItem, OButton } from '@oruga-ui/oruga-next'
import classNames from 'classnames'
import { useRouter } from 'vue-router'

import CustomDialog from './CustomDialog.vue'
import CustomButton from './CustomButton.vue'
import { usePainelStore } from 'src/store/PainelStore'
import { useLoginStore } from 'src/store/LoginStore'

const props = defineProps<{
    id: number
    idEgresso?: number
    nome?: string
    status: string
    email: string
    }
>()

const $emits = defineEmits(['updateData'])

const $store = usePainelStore()
const $router = useRouter()
const $login = useLoginStore()

const userScope = ref($login.getLoggedUser()?.scope)
const isConfirmationOpen = ref<true | false>(false)
const isLoadingAction = ref<true | false | null>(null)
const action = ref('')

const escolheAcao = (acao:string) => {
  action.value = acao
  if (acao === 'Aprovar cadastro' || acao === 'Excluir cadastro') {
    isConfirmationOpen.value = true
  } else {
    const aplicarAcao = opcoesAdmin.filter(opcao => opcao.titulo === acao)[0]
    aplicarAcao.click()
  }
}

async function aprovaCadastro () {
  isLoadingAction.value = true

  const codeAtiva = await $store.ativaUsuario(props.id)
  const codeValida = await $store.validaUsuario(props.id)

  if (codeAtiva === 201 && codeValida === 201) {
    $emits('updateData')
    isLoadingAction.value = false
  }
}

function editaCadastro () {
  $router.push(`/egresso/${props.idEgresso}`)
}

async function excluiCadastro () {
  isLoadingAction.value = true

  if (props.idEgresso) {
    const codeDelete = await $store.deleteUsuario(props.idEgresso)
    if (codeDelete === 200) {
      $emits('updateData')
      isLoadingAction.value = false
    }
  }
}

function enviaEmail () {
  $router.push({ name: 'email', params: { destino: props.email } })
}

const opcoesAdmin = [
  { titulo: 'Aprovar cadastro', status: ['pendente'], click: aprovaCadastro, habilitado: true },
  { titulo: 'Editar cadastro', status: ['completo', 'pendente'], click: editaCadastro, habilitado: true },
  { titulo: 'Enviar e-mail', status: ['incompleto', 'completo', 'pendente'], click: enviaEmail, habilitado: true },
  { titulo: 'Excluir cadastro', status: ['completo', 'pendente'], click: excluiCadastro, habilitado: userScope.value === 'ADMIN' }
]

const mensagemDialog: any = {
  'Aprovar cadastro': { text: 'Aprovar o cadastro de', loading: 'Aprovando cadastro', success: 'Cadastro aprovado', click: aprovaCadastro, icon: mdiCheckCircleOutline },
  'Excluir cadastro': { text: 'Excluir o cadastro de', loading: 'Excluindo cadastro', success: 'Cadastro excluído', click: excluiCadastro, icon: mdiDeleteForever }
}

</script>
