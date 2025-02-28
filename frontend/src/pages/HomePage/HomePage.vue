<template>
  <div
    v-if="loading"
    class="flex h-[70vh] items-center justify-center text-center"
  >
    <SvgIcon
      type="mdi"
      size="80"
      class="animate-spin text-gray-400"
      :path="mdiLoading"
    />
  </div>
  <SociodemographicMap
    v-else
    :egress-list="markers"
  />
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useHomeStore } from 'src/store/HomeStore'
import SociodemographicMap from './components/SociodemographicMap.vue'
import { type models } from 'src/@types'
import apiEnderecos from 'src/services/apiEnderecos'
import { mdiLoading } from "@mdi/js"
import SvgIcon from '@jamescoyle/vue-icon'


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

  for (const egresso of data) {
    const cidade = await apiEnderecos.getCidadeByIdFull(egresso.endereco.cidadeId)
    egresso.endereco.latitude = (cidade.latitude)
    egresso.endereco.longitude = (cidade.longitude)

    const mapKey = `${(egresso.endereco.latitude)}:${egresso.endereco.longitude}`
    const mapElement = filtered.get(mapKey)

    if (mapElement) {
      filtered.set(mapKey, [...mapElement, egresso])
    } else {
      filtered.set(mapKey, [egresso])
    }
  }

  markers.value = filtered
  loading.value = false
}
</script>
