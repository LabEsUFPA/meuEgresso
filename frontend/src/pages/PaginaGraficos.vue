<template>
  <div class="flex w-full px-3 justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
    <div class="flex w-full min-w-[250px] max-w-[1400px] justify-start border-2 border-b-0 border-white rounded-t-2xl text-blue-900 py-8 pl-6 md:pl-11 mt-10 shadow-md">
      <SvgIcon
        type="mdi"
        size="30"
        class="inline mr-2"
        :path="mdiPoll"
      />

      <h1 class="text-3xl font-bold">
        Gráficos
      </h1>
    </div>
  </div>
  <div class="flex px-3 justify-center">
    <div class="w-full min-w-[250px] max-w-[1400px] flex flex-col md:flex-row bg-white rounded-b-2xl py-8 pl-7 md:pl-11 text-blue-900 gap-x-5">
      <span class="font-semibold md:text-lg flex items-center mb-3 md:mb-0">
        <SvgIcon
          type="mdi"
          class="inline mr-2 md:mr-4"
          :path="mdiFilterVariant"
        />

        Filtros
      </span>

      <div class="overflow-x-auto flex-1' flex flex-row gap-x-1 md:gap-x-3">
        <FilterChip
          title="Todos"
          :selected="filters.all"
          selectable
          @click="handleFilters('all')"
        />
        <FilterChip
          title="Geral"
          icon="mdi:account"
          :selected="filters.general"
          selectable
          @click="handleFilters('general')"
        />
        <FilterChip
          title="Academico"
          icon="maki:college"
          :selected="filters.academic"
          selectable
          @click="handleFilters('academic')"
        />
        <FilterChip
          title="Carreira"
          icon="material-symbols:work"
          :selected="filters.career"
          selectable
          @click="handleFilters('career')"
        />
      </div>
    </div>
  </div>
  <div class="flex justify-center gap-y-4 mb-14 py-10">
    <div class="grid grid-cols-1 xl:grid-cols-2 md:px-10 px-4 gap-y-10 gap-x-20 justify-items-center items-center">
      <CustomPieGraph
        v-show="filters.all || filters.general"
        legend="Gênero"
        info="Quantidade de egressos por cada gênero"
        :loading="genderData ? false : true"
        :data="genderData"
        :legend-data="genderDataLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Área de atuação"
        info="Quantidade de egressos pro cada área de atuação"
        :loading="activitySectorData ? false : true"
        :data="activitySectorData"
        :legend-data="activitySectorLegend"
      />
      <CustomBarGraph
        v-show="filters.all || filters.general"
        legend="Idade"
        info="Quantidade de egressos por idade"
        :loading="ageDataX.length ? false : true"
        :x="ageDataX"
        :y="ageDataY"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Nível de ensino"
        info="Quantidade de egressos por nível de ensino"
        :loading="studentData ? false : true"
        :data="studentData"
        :legend-data="studentLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Salário"
        info="Quantidade de egressos por faixa salárial"
        :loading="wageData ? false : true"
        :data="wageData"
        :legend-data="wageLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Pos-graduação"
        info="Quantidade de egressos que fizeram pós-graduação"
        :loading="postGraduateData ? false : true"
        :data="postGraduateData"
        :legend-data="postGraduateLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Cotistas"
        info="Quantidade de egressos que foram cotistas"
        :loading="shareHolderData ? false : true"
        :data="shareHolderData"
        :legend-data="shareHolderLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Cotas"
        info="Quantidade de egressos por cada conta"
        :loading="quotasData ? false : true"
        :data="quotasData"
        :legend-data="quotasLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Bolsista"
        info="Quantidade de egressos que foram bolsistas"
        :loading="scholarData ? false : true"
        :data="scholarData"
        :legend-data="scholarLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Área de atuação"
        info="Quantidade de egressos por cada área de atuação"
        :loading="actingData ? false : true"
        :data="actingData"
        :legend-data="actingLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Deseja realizar Pós-graduação"
        info="Quantidade de egressos que desejam realizar pós-graduação"
        :loading="interestInPostData ? false : true"
        :data="interestInPostData"
        :legend-data="interestInPostLegend"
      />
      <CustomBarGraph
        v-show="filters.all || filters.career"
        legend="Remuneração"
        info="Remuneração mensal média da bolsa do egresso"
        :loading="remunerationDataX.length ? false : true"
        :x="remunerationDataX"
        :y="remunerationDataY"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Tipo de bolsa"
        info="Quantidade de egressos por cada tipo de bolsa"
        :loading="scholarshipTypeData ? false : true"
        :data="scholarshipTypeData"
        :legend-data="scholarshipTypeLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Local de Pós-graduação"
        info="Quantidade de egressos por instituição de pós-graduação"
        :loading="postGraduateLocalData ? false : true"
        :data="postGraduateLocalData"
        :legend-data="postGraduateLocalLegend"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Curso de Pós-graduação"
        info="Quantidade de egressos por curso de pós graduação"
        :loading="postGraduateCourseData ? false : true"
        :data="postGraduateCourseData"
        :legend-data="postGraduateCourseLegend"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiFilterVariant, mdiPoll } from '@mdi/js'
import CustomPieGraph from 'src/components/CustomPieGraph.vue'
import CustomBarGraph from 'src/components/CustomBarGraph.vue'
import FilterChip from 'src/components/FilterChip.vue'
import { useGraficoStore } from 'src/store/GraficoStore'
import { models } from 'src/@types'
interface PieChartSeries extends models.Graphics.PieChartSeries {}

const store = useGraficoStore()

const genderData = ref<PieChartSeries[]>()
const genderDataLegend = ref<string[]>()
const activitySectorData = ref<PieChartSeries[]>()
const activitySectorLegend = ref<string[]>()
const ageDataX = ref<string[]>([])
const ageDataY = ref<number[]>([])
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
const interestInPostData = ref<PieChartSeries[]>()
const interestInPostLegend = ref<string[]>()
const remunerationDataX = ref<string[]>([])
const remunerationDataY = ref<number[]>([])
const scholarshipTypeData = ref<PieChartSeries[]>()
const scholarshipTypeLegend = ref<string[]>()
const postGraduateLocalData = ref<PieChartSeries[]>()
const postGraduateLocalLegend = ref<string[]>()
const postGraduateCourseData = ref<PieChartSeries[]>()
const postGraduateCourseLegend = ref<string[]>()

onMounted(async () => {
  await getGraphData()
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

  const interestInPostGraph = await store.getInterestInPostData()
  interestInPostData.value = interestInPostGraph?.interestInPostData
  interestInPostLegend.value = interestInPostGraph?.interestInPostLegend

  const remunerationGraph = await store.getRemunerationData()
  remunerationDataX.value = remunerationGraph?.remunerationDataX
  remunerationDataY.value = remunerationGraph?.remunerationDataY

  const scholarshipTypeGraph = await store.getScholarshipTypeData()
  scholarshipTypeData.value = scholarshipTypeGraph?.scholarshipTypeData
  scholarshipTypeLegend.value = scholarshipTypeGraph?.scholarshipTypeLegend

  const postGraduateLocalGraph = await store.getPostGraduateLocalData()
  postGraduateLocalData.value = postGraduateLocalGraph?.postGraduateLocalData
  postGraduateLocalLegend.value = postGraduateLocalGraph?.postGraduateLocalLegend

  const postGraduateCourseGraph = await store.getPostGraduateCourseData()
  postGraduateCourseData.value = postGraduateCourseGraph?.postGraduateCourseData
  postGraduateCourseLegend.value = postGraduateCourseGraph?.postGraduateCourseLegend
}

interface Filters {
  all: boolean
  general: boolean
  academic: boolean
  career: boolean
}
const filters = ref<Filters>({
  all: true,
  general: false,
  academic: false,
  career: false
})

type filterTypes = keyof Filters
function handleFilters (clicked: filterTypes) {
  Object.keys(filters.value).forEach((key) => {
    filters.value[(key as filterTypes)] = key === clicked
  })
}
</script>
