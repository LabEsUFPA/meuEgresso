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
    <div class="mt-2 md:mt-0 md:ml-2 w-full h-[355px] md:w-72 md:h-[600px] bg-gray-300 rounded-xl p-1">
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
        class="flex flex-col items-stretch justify-between h-full"
        v-else
      >
        <div>
          <div class="text-sky-500 bg-white p-3 text-xs rounded-xl mb-1">
            <SvgIcon
              type="mdi"
              :path="mdiMapMarker"
              class="inline"
              size="15"
            />
            {{ selectedMarker[0].empresa.endereco.cidade }},
            {{ State.getStateByCodeAndCountry(selectedMarker[0].empresa.endereco.estado, selectedMarker[0].empresa.endereco.pais)?.name }},
            {{ Country.getCountryByCode(selectedMarker[0].empresa.endereco.pais)?.name }}
          </div>

          <div class="grid grid-cols-2 gap-1 md:grid-cols-1">
            <div
              class="bg-white rounded-xl p-3 shadow-sm"
              v-for="(egresso, index) in egressosPaginados"
              :key="index"
            >
              <div
                :title="egresso.nomeEgresso"
                class="font-semibold whitespace-nowrap overflow-hidden text-ellipsis"
              >
                {{ egresso.nomeEgresso }}
              </div>
              <div
                :title="egresso.empresa.nome"
                class="whitespace-nowrap overflow-hidden text-ellipsis"
              >
                {{ egresso.empresa.nome }}
              </div>
              <div class="mt-3 flex justify-end">
                <CustomButton
                  tag="router"
                  variant="outlined"
                  color="sky"
                  :link="`/egresso/${egresso.id.egressoId}`"
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

        <div
          v-if="maxPages > 0"
          class="flex flex-row"
        >
          <CustomButton
            color="white"
            text-class="text-gray-600"
            class="mr-2"
            @click="() => currentPage > 0 && currentPage--"
            v-if="currentPage !== 0"
          >
            <SvgIcon
              type="mdi"
              class="inline"
              :path="mdiChevronLeft"
            />
            Anterior
          </CustomButton>

          <div class="flex-1" />

          <CustomButton
            color="white"
            text-class="text-gray-600"
            @click="() => currentPage < maxPages && currentPage++"
            v-if="currentPage !== maxPages"
          >
            Próximo
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
</template>

<script setup lang="ts">
import 'leaflet/dist/leaflet.css'
import { LMap, LTileLayer } from '@vue-leaflet/vue-leaflet'
import { computed, ref } from 'vue'
import { type models } from 'src/@types'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronLeft, mdiChevronRight, mdiInformation, mdiMapMarker } from '@mdi/js'
import { Country, State, City } from 'country-state-city'
import CustomButton from 'src/components/CustomButton.vue'
import CustomMapMarker from 'src/components/CustomMapMarker.vue'
import { LatLng } from 'leaflet'
import { useHomeStore } from 'src/store/HomeStore'
interface EgressoMapa extends models.EgressoMapa {}

const zoom = ref(2)
const selectedMarker = ref<EgressoMapa[]>([])
function selectMarker ($event: LatLng) {
  const clickedMarkerKey = `${$event.lat}:${$event.lng}`
  selectedMarker.value = egressos.value.get(clickedMarkerKey) || []
}

const store = useHomeStore()
store.getEgress()

const egressos = computed(() => {
  const data = store.egressList
  const filtered = new Map<string, EgressoMapa[]>()

  data.forEach(egresso => {
    const cidade = City.getCitiesOfState(egresso.empresa.endereco.pais, egresso.empresa.endereco.estado).filter(elem => elem.name === egresso.empresa.endereco.cidade)[0]
    egresso.empresa.endereco.latitude = parseInt(String(cidade.latitude))
    egresso.empresa.endereco.longitude = parseInt(String(cidade.longitude))

    const mapKey = `${egresso.empresa.endereco.latitude}:${egresso.empresa.endereco.longitude}`
    const mapElement = filtered.get(mapKey)

    if (mapElement) {
      filtered.set(mapKey, [...mapElement, egresso])
    } else {
      filtered.set(mapKey, [egresso])
    }
  })

  return filtered
})

const currentPage = ref(0)
const maxEntries = 4

const egressosPaginados = computed<EgressoMapa[]>(() => {
  const start = currentPage.value * maxEntries
  return selectedMarker.value.slice(start, start + maxEntries)
})

const maxPages = computed(() => {
  console.log(selectedMarker.value.length, maxEntries, Math.ceil(selectedMarker.value.length / maxEntries) - 1)
  return Math.ceil(selectedMarker.value.length / maxEntries) - 1
})
</script>
