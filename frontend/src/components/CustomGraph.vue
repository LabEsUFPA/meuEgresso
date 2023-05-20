<template>
  <div class="flex flex-col w-[600px] h-96 bg-white rounded-xl p-4 text-gray-600 gap-y-10">
    <div class="pl-1">
      <h1 class="font-bold text-2xl">
        {{ legend }}
      </h1>
      <p class="text-base">
        {{ info }}
      </p>
    </div>
    <v-chart
      :option="type === 'pie'? option : option2"
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
    type?: string
}

withDefaults(defineProps<Props>(), {
  legend: 'Gráfico',
  info: 'Um belo gráfico',
  type: 'pie'
})

const option = ref({
  title: {
    text: 'Traffic Sources',
    left: 'center'
  },
  tooltip: {
    trigger: 'item',
    formatter: '{a} <br/>{b} : {c} ({d}%)'
  },
  legend: {
    orient: 'vertical',
    left: 'left',
    data: ['Direct', 'Email', 'Ad Networks', 'Video Ads', 'Search Engines']
  },
  series: [
    {
      name: 'Traffic Sources',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 5,
        borderWidth: 2
      },
      center: ['50%', '60%'],
      data: [
        { value: 335, name: 'Direct' },
        { value: 310, name: 'Email' },
        { value: 234, name: 'Ad Networks' },
        { value: 135, name: 'Video Ads' },
        { value: 1548, name: 'Search Engines' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
})

const option2 = ref({
  xAxis: {
    type: 'category',
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [120, 200, 150, 80, 70, 110, 130],
      type: 'bar'
    }
  ]
})
</script>
