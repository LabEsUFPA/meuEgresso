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
  <div class="flex w-full justify-center px-3">
    <div class="w-full min-w-[250px] max-w-[1400px] grid grid-cols-1 lg:grid-cols-2 gap-12 mb-14 py-10">
      <CustomPieGraph
        v-show="filters.all || filters.general"
        legend="Gênero"
        info="Quantidade de egressos por cada gênero"
        :loading="gender ? false : true"
        :data="gender"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Área de atuação"
        info="Quantidade de egressos pro cada área de atuação"
        :loading="sector ? false : true"
        :data="sector"
      />
      <CustomBarGraph
        v-show="filters.all || filters.general"
        legend="Idade"
        info="Quantidade de egressos por idade"
        :loading="age ? false : true"
        :data="age"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Nível de ensino"
        info="Quantidade de egressos por nível de ensino"
        :loading="student ? false : true"
        :data="student"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Salário"
        info="Quantidade de egressos por faixa salárial"
        :loading="wage ? false : true"
        :data="wage"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Pos-graduação"
        info="Quantidade de egressos que fizeram pós-graduação"
        :loading="postGraduate ? false : true"
        :data="postGraduate"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Cotistas"
        info="Quantidade de egressos que foram cotistas"
        :loading="shareHolder ? false : true"
        :data="shareHolder"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Cotas"
        info="Quantidade de egressos por cada conta"
        :loading="quotas ? false : true"
        :data="quotas"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Bolsista"
        info="Quantidade de egressos que foram bolsistas"
        :loading="scholar ? false : true"
        :data="scholar"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Área de atuação"
        info="Quantidade de egressos por cada área de atuação"
        :loading="acting ? false : true"
        :data="acting"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Deseja realizar Pós-graduação"
        info="Quantidade de egressos que desejam realizar pós-graduação"
        :loading="interestInPost ? false : true"
        :data="interestInPost"
      />
      <CustomBarGraph
        v-show="filters.all || filters.career"
        legend="Remuneração"
        info="Remuneração mensal média da bolsa do egresso"
        :loading="remuneration ? false : true"
        :data="remuneration"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Tipo de bolsa"
        info="Quantidade de egressos por cada tipo de bolsa"
        :loading="scholarshipType ? false : true"
        :data="scholarshipType"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Local de Pós-graduação"
        info="Quantidade de egressos por instituição de pós-graduação"
        :loading="postGraduateLocal ? false : true"
        :data="postGraduateLocal"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Curso de Pós-graduação"
        info="Quantidade de egressos por curso de pós graduação"
        :loading="postGraduateCourse ? false : true"
        :data="postGraduateCourse"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Vínculo empregatício"
        info="Onde os egressos estão trabalhando"
        :loading="company ? false : true"
        :data="company"
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
interface BarChartSeries extends models.Graphics.BarChartSeries {}

const store = useGraficoStore()

interface dataGraph {
  values: PieChartSeries[]
  legend: string[]
}

const company = ref<dataGraph | null>(null)
const postGraduateCourse = ref<dataGraph | null>(null)
const postGraduateLocal = ref<dataGraph | null>(null)
const scholarshipType = ref<dataGraph | null>(null)
const remuneration = ref<BarChartSeries | null>(null)
const interestInPost = ref<dataGraph | null>(null)
const acting = ref<dataGraph | null>(null)
const scholar = ref<dataGraph | null>(null)
const quotas = ref<dataGraph | null>(null)
const shareHolder = ref<dataGraph | null>(null)
const postGraduate = ref<dataGraph | null>(null)
const student = ref<dataGraph | null>(null)
const wage = ref<dataGraph | null>(null)
const sector = ref<dataGraph | null>(null)
const gender = ref<dataGraph | null>(null)
const age = ref<BarChartSeries | null>(null)

onMounted(async () => {
  await getGraphData()
})

const getGraphData = async () => {
  const loadedData = await store.fetchAll()
  company.value = loadedData.company
  postGraduateCourse.value = loadedData.postGraduateCourse
  postGraduateLocal.value = loadedData.postGraduateLocal
  scholarshipType.value = loadedData.scholarshipType
  remuneration.value = loadedData.remuneration
  interestInPost.value = loadedData.interestInPost
  acting.value = loadedData.acting
  scholar.value = loadedData.scholar
  quotas.value = loadedData.quotas
  shareHolder.value = loadedData.shareHolder
  postGraduate.value = loadedData.postGraduate
  student.value = loadedData.student
  wage.value = loadedData.wage
  sector.value = loadedData.sector
  gender.value = loadedData.gender
  age.value = loadedData.age
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
