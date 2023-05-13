<template>
  <LCircleMarker
    @click="$emit('select', getLatLng(latLong))"
    :lat-lng="getLatLng(latLong)"
  >
    <LTooltip :options="{ className: 'border border-red-500' }">
      <div class="p-1 flex flex-col">
        <div class="text-[16px] italic">
          <SvgIcon
            type="mdi"
            :path="mdiMapMarker"
            class="inline text-gray-400"
            size="18"
          />
          {{ egressos[0].localizacao.cidade }},
          {{ State.getStateByCode(egressos[0].localizacao.estado).name /* deprecado, atualizar para getStateByCodeAndCountry quando tiver back */ }},
          {{ Country.getCountryByCode(egressos[0].localizacao.pais).name }}
        </div>

        <div class="font-bold italic text-right text-[16px]">
          {{ egressos.length }} egresso{{ egressos.length === 1 ? '' : 's' }}
        </div>

        <div class="text-gray-400 text-xs text-right mt-1">
          Clique para ver detalhes
        </div>
      </div>
    </LTooltip>
  </LCircleMarker>
</template>

<script lang="ts" setup>
import { LCircleMarker, LTooltip } from '@vue-leaflet/vue-leaflet'
import { Country, State } from 'country-state-city'
import { mdiMapMarker } from '@mdi/js'
import SvgIcon from '@jamescoyle/vue-icon'
import { type models } from 'src/@types'
import { latLng } from 'leaflet'
interface EgressoMapa extends models.EgressoMapa {}

defineEmits(['select'])

defineProps<{
  latLong: string
  egressos: EgressoMapa[]
}>()

function getLatLng (key: string) {
  const splitKey = key.split(':')
  const lat = parseInt(splitKey[0])
  const lng = parseInt(splitKey[1])

  return latLng(lat, lng)
}
</script>
