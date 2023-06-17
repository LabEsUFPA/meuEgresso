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
      v-for="(opcao, index) in opcoesAdmin.filter(o => o.status === 'todos' || o.status === status)"
      :key="index"
      aria-role="listitem"
      override
      :item-class="classNames('text-sm text-cyan-600 p-2 hover:bg-sky-300/30 rounded')"
    >
      <button
        @click="() => {action = opcao.titulo; isConfirmationOpen = true}"
      >
        {{ opcao.titulo }}
      </button>
    </ODropdownItem>
  </ODropdown>

  <div class="absolute z-10">
    <CustomDialog v-model="isConfirmationOpen">
      <div class="flex flex-col h-full text-lg text-cyan-800 justify-center items-center p-6">
        <div class="flex flex-col gap-4 h-full justify-center items-center">
          <SvgIcon
            type="mdi"
            size="32"
            :path="mensagemDialog[action]?.icon"
            class="text-cyan-800 rounded-md"
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
            @click="() => { isConfirmationOpen = false; mensagemDialog[action]?.click() }"
          >
            Confirmar
          </CustomButton>
        </div>
      </div>
    </CustomDialog>
  </div>
</template>

<script setup lang="ts">

import { ref } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiCheckCircleOutline, mdiDeleteForever, mdiDotsVertical, mdiEmail, mdiPencil } from '@mdi/js'
import { ODropdown, ODropdownItem, OButton } from '@oruga-ui/oruga-next'
import classNames from 'classnames'
import { useRouter } from 'vue-router'

import CustomDialog from './CustomDialog.vue'
import CustomButton from './CustomButton.vue'

const props = defineProps<{
    id: number
    nome?: string
    status: string
    }
>()

const $router = useRouter()
const isConfirmationOpen = ref(false)
const action = ref('')

const aprovaCadastro = () => {
  console.log('aprova')
}

const editaCadastro = () => {
  $router.push(`/egresso/${props.id}`)
}

const excluiCadastro = () => {
  console.log('exclui')
}

const enviaEmail = () => {
  console.log('email')
}

const opcoesAdmin = [
  { titulo: 'Aprovar cadastro', status: 'pendente', click: aprovaCadastro },
  { titulo: 'Editar cadastro', status: 'completo', click: editaCadastro },
  { titulo: 'Excluir cadastro', status: 'todos', click: excluiCadastro },
  { titulo: 'Enviar e-mail', status: 'todos', click: enviaEmail }
]

const mensagemDialog: any = {
  'Aprovar cadastro': { text: 'Aprovar o cadastro de', click: aprovaCadastro, icon: mdiCheckCircleOutline },
  'Editar cadastro': { text: 'Editar o cadastro de', click: editaCadastro, icon: mdiPencil },
  'Excluir cadastro': { text: 'Excluir o cadastro de', click: excluiCadastro, icon: mdiDeleteForever },
  'Enviar e-mail': { text: 'Enviar e-mail para', click: enviaEmail, icon: mdiEmail }
}

</script>
