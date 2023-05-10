<template>
  <div style="height:600px; width:800px">
    <l-map
      ref="map"
      v-model:zoom="zoom"
      :center="[47.41322, -1.219482]"
      :use-global-leaflet="false"
    >
      <l-tile-layer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        layer-type="base"
        name="OpenStreetMap"
      />
      <l-circle-marker
        @click="testClick"
        :lat-lng="test"
      />
    </l-map>
  </div>
</template>

<script setup lang="ts">
import 'leaflet/dist/leaflet.css'
import { latLng } from 'leaflet'
import { LMap, LTileLayer, LCircleMarker } from '@vue-leaflet/vue-leaflet'

const zoom = 2
const test = latLng(-1.45502, -48.5024)
const testClick = (ClickEvent: Event) => {
  console.log(ClickEvent)
}
</script>
