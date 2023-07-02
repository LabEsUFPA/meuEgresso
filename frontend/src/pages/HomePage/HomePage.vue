<template>
  <SociodemographicMap
    v-if="!loading"
    :egress-list="markers"
  />
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useHomeStore } from 'src/store/HomeStore'
import SociodemographicMap from './components/SociodemographicMap.vue'
import { City } from 'country-state-city'
import { type models } from 'src/@types'
// import apiEnderecos from 'src/services/apiEnderecos'

interface EgressoMapa extends models.EgressoMapa {}

const loading = ref(true)
const markers = ref<any>([])

onMounted(async () => {
  window.scrollTo(0, 0)
  await getEgresso()
})

const getEgresso = async () => {
  const store = useHomeStore()
  await store.getEgress()
  const data = store.egressList
  const filtered = new Map<string, EgressoMapa[]>()

  data.forEach(egresso => {
    // const cidade = await apiEnderecos.getCidadeByIdFull(egresso.endereco.cidadeId) usar isso
    const cidade = City.getCitiesOfState(egresso.endereco.pais, egresso.endereco.estado).filter(elem => elem.name === egresso.endereco.cidade)[0]
    egresso.endereco.latitude = parseInt(String(cidade.latitude))
    egresso.endereco.longitude = parseInt(String(cidade.longitude))

    const mapKey = `${egresso.endereco.latitude}:${egresso.endereco.longitude}`
    const mapElement = filtered.get(mapKey)

    if (mapElement) {
      filtered.set(mapKey, [...mapElement, egresso])
    } else {
      filtered.set(mapKey, [egresso])
    }
  })

  markers.value = filtered
  loading.value = false
}
</script>
