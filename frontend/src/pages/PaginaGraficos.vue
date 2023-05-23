<template>
  <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200 px-64">
    <div class="flex w-full justify-start border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl text-blue-900 py-8 pl-11 mt-10  shadow-md">
      <SvgIcon
        type="mdi"
        size="30"
        class="inline mr-2"
        :path="mdiPoll"
      />

      <h1 class=" text-3xl font-bold">
        Gráficos
      </h1>
    </div>
  </div>
  <div class="flex flex-col gap-y-4 mb-14">
    <div class="flex w-full justify-between px-64 mt-10">
      <CustomPieGraph
        v-if="loading"
        legend="Gênero"
        info="Quantidade de egressos por cada gênero"
        :data="genderData"
        :legend-data="genderDataLegend"
      />
      <CustomPieGraph
        v-if="loading"
        legend="Área de atuação"
        info="Quantidade de egressos pro cada área de atuação"
        :data="activitySectorData"
        :legend-data="activitySectorLegend"
      />
    </div>
    <div class="flex w-full justify-between px-64 mt-10">
      <CustomBarGraph
        v-if="loading"
        :x="ageDataX"
        :y="ageDataY"
      />
      <CustomPieGraph
        v-if="loading"
        legend="Nível de ensino"
        info="Quantidade de egressos por nível de ensino"
        :data="studentData"
        :legend-data="studentLegend"
      />
    </div>
    <div class="flex w-full justify-between px-64 mt-10">
      <CustomPieGraph
        v-if="loading"
        legend="Salário"
        info="Quantidade de egressos por faixa salárial"
        :data="wageData"
        :legend-data="wageLegend"
      />
      <CustomPieGraph
        v-if="loading"
        legend="Pos-graduação"
        info="Quantidade de egressos que fizeram pós-graduação"
        :data="postGraduateData"
        :legend-data="postGraduateLegend"
      />
    </div>
    <div class="flex w-full justify-between px-64 mt-10">
      <CustomPieGraph
        v-if="loading"
        legend="Cotistas"
        info="Quantidade de egressos que foram cotistas"
        :data="shareHolderData"
        :legend-data="shareHolderLegend"
      />
      <CustomPieGraph
        v-if="loading"
        legend="Cotas"
        info="Quantidade de egressos por cada conta"
        :data="quotasData"
        :legend-data="quotasLegend"
      />
    </div>
    <div class="flex w-full justify-between px-64 mt-10">
      <CustomPieGraph
        v-if="loading"
        legend="Bolsista"
        info="Quantidade de egressos que foram bolsistas"
        :data="scholarData"
        :legend-data="scholarLegend"
      />
      <CustomPieGraph
        v-if="loading"
        legend="Área de atuação"
        info="Quantidade de egressos por cada área de atuação"
        :data="actingData"
        :legend-data="actingLegend"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiPoll } from '@mdi/js'
import CustomPieGraph from 'src/components/CustomPieGraph.vue'
import CustomBarGraph from 'src/components/CustomBarGraph.vue'
import { useGraficoStore } from 'src/store/GraficoStore'
import { models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}

const store = useGraficoStore()

const genderData = ref<PieChartSeries[]>()
const genderDataLegend = ref<string[]>()
const activitySectorData = ref<PieChartSeries[]>()
const activitySectorLegend = ref<string[]>()
const ageDataX = ref<number[]>([])
const ageDataY = ref<string[]>([])
const studentData = ref<PieChartSeries[]>()
const studentLegend = ref<string[]>()
const wageData = ref<PieChartSeries[]>()
const wageLegend = ref<string[]>()
const postGraduateData = ref<PieChartSeries[]>()
const postGraduateLegend = ref<string[]>()
const shareHolderData = ref<PieChartSeries[]>()
const shareHolderLegend = ref<string[]>()
const quotasData = ref<PieChartSeries[]>()
const quotasLegend = ref<string[]>()
const scholarData = ref<PieChartSeries[]>()
const scholarLegend = ref<string[]>()
const actingData = ref<PieChartSeries[]>()
const actingLegend = ref<string[]>()

const loading = ref(false)

onMounted(async () => {
  await getGraphData()
  loading.value = true
})

const getGraphData = async () => {
  const genderGraph = await store.getGenderData()
  genderData.value = genderGraph?.genderData
  genderDataLegend.value = genderGraph?.genderDataLegend

  const activitySectorGraph = await store.getSectorData()
  activitySectorData.value = activitySectorGraph?.activitySectorData
  activitySectorLegend.value = activitySectorGraph?.activitySectorLegend

  const ageGraph = await store.getAgeData()
  ageDataX.value = ageGraph?.ageDataX
  ageDataY.value = ageGraph?.ageDataY

  const studentGraph = await store.getStudentData()
  studentData.value = studentGraph?.studentData
  studentLegend.value = studentGraph?.studentLegend

  const wageGraph = await store.getWageData()
  wageData.value = wageGraph?.wageData
  wageLegend.value = wageGraph?.wageLegend

  const postGraduateGraph = await store.getPostGraduateData()
  postGraduateData.value = postGraduateGraph?.postGraduateData
  postGraduateLegend.value = postGraduateGraph?.postGraduateLegend

  const shareHolderGraph = await store.getShareHolderData()
  shareHolderData.value = shareHolderGraph?.shareHolderData
  shareHolderLegend.value = shareHolderGraph?.shareHolderLegend

  const quotasGraph = await store.getQuotasData()
  quotasData.value = quotasGraph?.quotasData
  quotasLegend.value = quotasGraph?.quotasLegend

  const scholarGraph = await store.getScholarData()
  scholarData.value = scholarGraph?.scholarData
  scholarLegend.value = scholarGraph?.scholarLegend

  const actingGraph = await store.getActingData()
  actingData.value = actingGraph?.actingData
  actingLegend.value = actingGraph?.actingLegend
}
</script>
