<template>
  <div class="p-1 flex flex-col">
    <div class="text-[16px] italic">
      <SvgIcon
        type="mdi"
        :path="mdiMapMarker"
        class="inline text-gray-400"
        size="18"
      />
      {{ egressos[0].endereco.cidade }},
      {{ egressos[0].endereco.estado }},
      {{ egressos[0].endereco.pais }}
    </div>
    <div class="font-bold italic text-right text-[16px]">
      {{ egressos.length }} egresso{{ egressos.length === 1 ? '' : 's' }}
    </div>
    <div class="text-gray-400 text-xs text-right mt-1 hidden md:block">
      Clique para ver detalhes
    </div>
  </div>
</template>

<script lang="ts" setup>
import { mdiMapMarker } from '@mdi/js'
import SvgIcon from '@jamescoyle/vue-icon'
import { type models } from 'src/@types'
interface EgressoMapa extends models.EgressoMapa {}

defineProps<{
  egressos: EgressoMapa[]
}>()
</script>
