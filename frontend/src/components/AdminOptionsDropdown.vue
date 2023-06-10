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
      v-for="(opcao, index) in opcoesAdmin.filter(o => o.status === 'Todos' || o.status === status)"
      :key="index"
      aria-role="listitem"
      override
      :item-class="classNames('text-sm text-cyan-600 p-2 hover:bg-sky-300/30 rounded')"
    >
      <button>
        {{ opcao.titulo }}
      </button>
    </ODropdownItem>
  </ODropdown>
</template>

<script setup lang="ts">

import SvgIcon from '@jamescoyle/vue-icon'
import { mdiDotsVertical } from '@mdi/js'
import { ODropdown, ODropdownItem, OButton } from '@oruga-ui/oruga-next'
import classNames from 'classnames'

defineProps<{
    id: number,
    status: string
    }
>()

const opcoesAdmin = [
  { titulo: 'Aprovar cadastro', status: 'Pendente', click: () => {} },
  { titulo: 'Editar cadastro', status: 'Ativo', click: () => {} },
  { titulo: 'Excluir cadastro', status: 'Todos', click: () => {} },
  { titulo: 'Enviar e-mail', status: 'Todos', click: () => {} }

]

</script>
