<template>
  <MapaSociodemografico
    v-if="!loading"
    :egress-list="markers"
  />
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useHomeStore } from 'src/store/HomeStore'
import MapaSociodemografico from 'src/components/MapaSociodemografico.vue'
import { City } from 'country-state-city'
import { type models } from 'src/@types'
interface EgressoMapa extends models.EgressoMapa {}

const loading = ref(true)
const markers = ref<any>([])

onMounted(() => {
  getEgresso()
})

const getEgresso = async () => {
  const store = useHomeStore()
  await store.getEgress()
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

  markers.value = filtered
  loading.value = false
}

</script>
