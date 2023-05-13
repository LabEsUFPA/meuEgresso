<template>
  <div class="flex flex-col md:flex-row md:justify-center items-center p-2 relative h-full">
    <div class="rounded-xl border border-gray-400 overflow-hidden h-96 w-96 md:h-[600px] md:w-full md:max-w-3xl">
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
        <CustomMapMarker
          v-for="(mapElement, index) in egressos"
          @select="selectMarker"
          :lat-long="mapElement[0]"
          :egressos="mapElement[1]"
          :key="index"
        />
        <l-map />
      </lmap>
    </div>
    <div class="mt-2 md:mt-0 md:ml-2 w-full h-40 md:w-52 md:h-[600px] bg-gray-300 rounded-xl p-1">
      <div
        class="text-gray-700 h-full text-center mx-auto w-3/4 font-light flex flex-col justify-center items-center"
        v-if="!selectedMarker.length"
      >
        <SvgIcon
          type="mdi"
          :path="mdiInformation"
          class="inline text-gray-500 mb-6"
        />

        <span>Clique em alguma localização destacada</span>
      </div>
      <div
        class="flex flex-col"
        v-else
      >
        <div class="text-sky-500 bg-white p-3 text-xs rounded-xl mb-1">
          <SvgIcon
            type="mdi"
            :path="mdiMapMarker"
            class="inline"
            size="15"
          />
          {{ selectedMarker[0].localizacao.cidade }},
          {{ State.getStateByCode(selectedMarker[0].localizacao.estado).name /* deprecado, atualizar para getStateByCodeAndCountry quando tiver back */ }},
          {{ Country.getCountryByCode(selectedMarker[0].localizacao.pais).name }}
        </div>

        <div
          class="bg-white rounded-xl mb-1 p-3"
          v-for="(egresso, index) in selectedMarker"
          :key="index"
        >
          <div
            :title="egresso.nome"
            class="font-semibold whitespace-nowrap overflow-hidden text-ellipsis"
          >
            {{ egresso.nome }}
          </div>
          <div
            :title="egresso.empresa"
            class="whitespace-nowrap overflow-hidden text-ellipsis"
          >
            {{ egresso.empresa }}
          </div>
          <div class="mt-3 flex justify-end">
            <CustomButton
              tag="router"
              variant="outlined"
              color="sky"
              :link="`/egresso/${egresso.id}`"
            >
              Visitar
              <SvgIcon
                type="mdi"
                class="inline"
                :path="mdiChevronRight"
              />
            </CustomButton>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import 'leaflet/dist/leaflet.css'
import { LMap, LTileLayer } from '@vue-leaflet/vue-leaflet'
import { getRandomEgressoList } from 'src/mock/EgressosMapa'
import { computed, ref } from 'vue'
import { type models } from 'src/@types'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronRight, mdiInformation, mdiMapMarker } from '@mdi/js'
import { Country, State } from 'country-state-city'
import CustomButton from 'src/components/CustomButton.vue'
import CustomMapMarker from 'src/components/CustomMapMarker.vue'
import { LatLng } from 'leaflet'
interface EgressoMapa extends models.EgressoMapa {}

const zoom = 2
const selectedMarker = ref<EgressoMapa[]>([])
function selectMarker ($event: LatLng) {
  const clickedMarkerKey = `${$event.lat}:${$event.lng}`
  selectedMarker.value = egressos.value.get(clickedMarkerKey) || []
  console.log(selectedMarker.value)
}

const egressos = computed(() => {
  const data = [...getRandomEgressoList(12), {
    nome: 'Rafael Wintheiser IV',
    id: 29080,
    localizacao: {
      cidade: 'Apex',
      estado: 'KS',
      pais: 'FJ',
      latitude: 60,
      longitude: 154
    },
    empresa: 'Marvin, Bartell and Stehr'
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
    },
    empresa: 'Marvin, Bartell and Stehr'
  }, {
    nome: 'Rafael Wintheiser VI',
    id: 29082,
    localizacao: {
      cidade: 'Apex',
      estado: 'KS',
      pais: 'FJ',
      latitude: 60,
      longitude: 154
    },
    empresa: 'Marvin, Bartell and Stehr'
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
</script>
