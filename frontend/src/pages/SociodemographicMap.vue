<template>
  <div class="flex flex-row justify-center">
    <div
      class="rounded-xl border border-gray-400 overflow-hidden"
      style="height:600px; width:800px"
    >
      <LMap
        ref="map"
        v-model:zoom="zoom"
        :center="[47.41322, -1.219482]"
        :use-global-leaflet="false"
      >
        <LTileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          layer-type="base"
          name="OpenStreetMap"
        />
        <LCircleMarker
          v-for="(mapElement, index) in egressos"
          :key="index"
          @click="testClick"
          :lat-lng="getLatLng(mapElement[0])"
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
                {{ mapElement[1][0].localizacao.cidade }},
                {{ State.getStateByCode(mapElement[1][0].localizacao.estado).name /* deprecado, atualizar para getStateByCodeAndCountry quando tiver back */ }},
                {{ Country.getCountryByCode(mapElement[1][0].localizacao.pais).name }}
              </div>

              <div class="font-bold italic text-right text-[16px]">
                {{ mapElement[1].length }} egresso{{ mapElement[1].length === 1 ? '' : 's' }}
              </div>

              <div class="text-gray-400 text-xs text-right mt-1">
                Clique para ver detalhes
              </div>
            </div>
          </LTooltip>
        </LCircleMarker>
      </LMap>
    </div>
  </div>
</template>

<script setup lang="ts">
import 'leaflet/dist/leaflet.css'
import { latLng } from 'leaflet'
import { LMap, LTileLayer, LCircleMarker, LTooltip } from '@vue-leaflet/vue-leaflet'
import { getRandomEgressoList } from 'src/mock/EgressosMapa'
import { computed } from 'vue'
import { type models } from 'src/@types'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiMapMarker } from '@mdi/js'
import { Country, State } from 'country-state-city'
interface EgressoMapa extends models.EgressoMapa {}

const zoom = 2
const testClick = (ClickEvent: Event) => {
  console.log(ClickEvent)
}

const egressos = computed(() => {
  const data = [...getRandomEgressoList(10), {
    nome: 'Rafael Wintheiser IV',
    id: 29080,
    localizacao: {
      cidade: 'Apex',
      estado: 'KS',
      pais: 'FJ',
      latitude: 60,
      longitude: 154
    }
  },
  {
    nome: 'Rafael Wintheiser V',
    id: 29081,
    localizacao: {
      cidade: 'Apex',
      estado: 'KS',
      pais: 'FJ',
      latitude: 60,
      longitude: 154
    }
  }, {
    nome: 'Rafael Wintheiser VI',
    id: 29082,
    localizacao: {
      cidade: 'Apex',
      estado: 'KS',
      pais: 'FJ',
      latitude: 60,
      longitude: 154
    }
  }]
  const filtered = new Map<string, EgressoMapa[]>()

  data.forEach(egresso => {
    const mapKey = `${egresso.localizacao.latitude}:${egresso.localizacao.longitude}`
    const mapElement = filtered.get(mapKey)

    if (mapElement) {
      filtered.set(mapKey, [...mapElement, egresso])
    } else {
      filtered.set(mapKey, [egresso])
    }
  })

  return filtered
})

function getLatLng (key: string) {
  const splitKey = key.split(':')
  const lat = parseInt(splitKey[0])
  const lng = parseInt(splitKey[1])

  return latLng(lat, lng)
}
</script>
