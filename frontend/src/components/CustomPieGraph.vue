<template>
  <div
    class="flex flex-col h-[400px] w-full bg-white rounded-xl p-4 text-gray-600 sm:h-96"
  >
    <div
      v-if="loading"
      class="w-full h-full flex items-center justify-center"
    >
      <SvgIcon
        type="mdi"
        size="80"
        class="animate-spin text-gray-400"
        :path="mdiLoading"
      />
    </div>
    <div
      class="flex h-full w-full"
      v-else
    >
      <div
        v-if="data?.error"
        class="flex flex-col w-full justify-center items-center"
      >
        <SvgIcon
          type="mdi"
          size="80"
          class="text-gray-400"
          :path="mdiAlertCircleOutline"
        />
        <h1>Ocorreu algum erro :(</h1>
      </div>

      <div
        v-else
        class="flex flex-col h-full w-full gap-y-10"
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
          :option="windowWidth < 600 ? optionMobile : optionDesktop"
          autoresize
        />
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiLoading, mdiAlertCircleOutline } from '@mdi/js'
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
import { onMounted, ref, watch } from 'vue'
import { models } from 'src/@types'
interface PieChartModel extends models.Graphics.PieChartModel {}

use([
  CanvasRenderer,
  PieChart,
  BarChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  GridComponent
])

const windowWidth = ref(window.innerWidth)

interface Props {
    legend?: string,
    info?: string
    loading: boolean
    data: {
      series: PieChartModel
      error: boolean
    } | null
}

const props = withDefaults(defineProps<Props>(), {
  legend: 'Gráfico',
  info: 'Um belo gráfico'
})

function onResize () {
  windowWidth.value = window.innerWidth
}
onMounted(() => {
  window.addEventListener('resize', onResize)
})

watch(() => props.data, () => {
  setOptionData()
})

const optionDesktop = ref({
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
    data: props.data?.series.legend
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
      center: ['70%', '50%'],
      data: props.data?.series.values
    }
  ]
})

const optionMobile = ref({
  title: {
    left: 'center'
  },
  tooltip: {
    trigger: 'item',
    formatter: `${props.legend} <br/>{b} : {c} ({d}%)`,
    position: ['0%', '50%']
  },
  legend: {
    orient: 'horizontal',
    left: 'left',
    data: props.data?.series.legend
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
      center: ['50%', '65%'],
      data: props.data?.series.values
    }
  ]
})

const setOptionData = () => {
  optionDesktop.value.series[0].data = props.data?.series.values
  optionMobile.value.series[0].data = props.data?.series.values
}
</script>
