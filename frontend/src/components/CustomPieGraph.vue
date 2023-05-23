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
import { models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}

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
    data: PieChartSeries[] | undefined
    legendData: string[] | undefined
}

const props = withDefaults(defineProps<Props>(), {
  legend: 'Gráfico',
  info: 'Um belo gráfico'
})

const option = ref({
  title: {
    left: 'center'
  },
  tooltip: {
    trigger: 'item',
    formatter: `${props.legend} <br/>{b} : {c} ({d}%)`
  },
  legend: {
    orient: 'vertical',
    left: 'left',
    data: props.legendData
  },
  series: [
    {
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderColor: '#fff',
        borderWidth: 2,
        borderRadius: 5
      },
      label: {
        show: false
      },
      center: ['60%', '50%'],
      data: props.data
    }
  ]
})
</script>
