<template>
  <div class="flex flex-col w-[650px] h-96 bg-white rounded-xl p-4 text-gray-600 gap-y-10">
    <div class="pl-1">
      <h1 class="font-bold text-2xl">
        {{ legend }}
      </h1>
      <p class="text-base">
        {{ info }}
      </p>
    </div>
    <v-chart
      :option="option"
      autoresize
    />
  </div>
</template>

<script lang="ts" setup>
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { PieChart, BarChart } from 'echarts/charts'
import {
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  GridComponent
} from 'echarts/components'
import VChart from 'vue-echarts'
import { ref } from 'vue'

use([
  CanvasRenderer,
  PieChart,
  BarChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  GridComponent
])

  interface Props {
      legend?: string,
      info?: string
      x: number[]
      y: string[]
  }

const props = withDefaults(defineProps<Props>(), {
  legend: 'Gráfico',
  info: 'Um belo gráfico'
})

const option = ref({
  xAxis: {
    type: 'category',
    data: props.y
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: props.x,
      type: 'bar'
    }
  ]
})
</script>
