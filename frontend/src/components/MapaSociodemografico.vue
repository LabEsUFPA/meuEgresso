<template>
  <div class="flex flex-col md:flex-row md:justify-center items-center p-2 relative h-full">
    <div class="rounded-xl border border-gray-400 overflow-hidden h-96 w-96 md:h-[600px] md:w-full md:max-w-screen">
      <div
        class="w-full h-full"
        id="mapContainer"
      />
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

<script lang="ts" setup>
import 'leaflet/dist/leaflet.css'
import L from 'leaflet'
import { ref, onMounted, computed } from 'vue'
import { Country, State } from 'country-state-city'
import CustomButton from 'src/components/CustomButton.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiChevronLeft, mdiChevronRight, mdiInformation, mdiMapMarker } from '@mdi/js'
import { type models } from 'src/@types'
interface EgressoMapa extends models.EgressoMapa {}

const props = defineProps<{
  egressList: Map<string, EgressoMapa[]>
}>()

defineEmits(['select'])

const selectedMarker = ref<EgressoMapa[]>([])
function selectMarker ($event: L.LeafletEvent) {
  const latLng = $event.target._latlng
  const clickedMarkerKey = `${latLng.lat}:${latLng.lng}`
  selectedMarker.value = props.egressList.get(clickedMarkerKey) || []
}

const getLatLng = (key: string) => {
  const splitKey = key.split(':')
  const lat = parseInt(splitKey[0])
  const lng = parseInt(splitKey[1])

  return L.latLng(lat, lng)
}

let map: L.Map | L.LayerGroup<any>

onMounted(() => {
  createMapLayer()
})

const createMapLayer = () => {
  map = L.map('mapContainer').setView([-15.7801, -47.9292], 4)
  L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    noWrap: true
  }).addTo(map)

  const setMarkers = () => {
    props.egressList.forEach((mapElement, index) => {
      L.circleMarker(getLatLng(index)).addTo(map).on('click', selectMarker)
    })
  }
  setMarkers()
}

const currentPage = ref(0)
const maxEntries = 4

const egressosPaginados = computed<EgressoMapa[]>(() => {
  const start = currentPage.value * maxEntries
  return selectedMarker.value.slice(start, start + maxEntries)
})

const maxPages = computed(() => {
  return Math.ceil(selectedMarker.value.length / maxEntries) - 1
})
</script>
