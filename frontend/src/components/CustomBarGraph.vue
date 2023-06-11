<template>
  <div
    v-if="loading"
    class="flex flex-col h-[400px] w-full bg-white rounded-xl p-4 text-gray-600 gap-y-10 sm:h-96 lg:w-[650px] xl:w-[550px] 2xl:w-full"
  >
    <div
      class="w-full h-full flex items-center justify-center"
    >
      <SvgIcon
        type="mdi"
        size="80"
        class="animate-spin text-gray-400"
        :path="mdiLoading"
      />
    </div>
  </div>
  <div
    v-else
    class="flex flex-col h-[400px] w-full bg-white rounded-xl p-4 text-gray-600 gap-y-10 sm:h-96"
  >
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
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiLoading } from '@mdi/js'
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
import { ref, watch } from 'vue'
import { models } from 'src/@types'
interface BarChartModel extends models.Graphics.BarChartModel {}

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
    loading: boolean
    data: BarChartModel | null
}

const props = withDefaults(defineProps<Props>(), {
  legend: 'Gráfico',
  info: 'Um belo gráfico'
})

watch(() => props.data?.x, () => {
  setOptionData()
})

const option = ref({
  xAxis: {
    type: 'category',
    data: props.data?.x
  },
  yAxis: {
    type: 'value',
    minInterval: 1
  },
  series: [
    {
      data: props.data?.y,
      type: 'bar'
    }
  ]
})

const setOptionData = () => {
  option.value.xAxis.data = props.data?.x
  option.value.series[0].data = props.data?.y
}
</script>
