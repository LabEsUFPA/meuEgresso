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
          title="Acadêmico"
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
        :loading="loadedData?.gender ? false : true"
        :data="loadedData.gender"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Área de atuação"
        info="Quantidade de egressos por cada área de atuação"
        :loading="loadedData.sector ? false : true"
        :data="loadedData.sector"
      />
      <CustomBarGraph
        v-show="filters.all || filters.general"
        legend="Idade"
        info="Quantidade de egressos por idade"
        :loading="loadedData.age ? false : true"
        :data="loadedData.age"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Nível de ensino"
        info="Quantidade de egressos por nível de ensino"
        :loading="loadedData.student ? false : true"
        :data="loadedData.student"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Salário"
        info="Quantidade de egressos por faixa salarial"
        :loading="loadedData.wage ? false : true"
        :data="loadedData.wage"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Pós-graduação"
        info="Quantidade de egressos que fizeram pós-graduação"
        :loading="loadedData.postGraduate ? false : true"
        :data="loadedData.postGraduate"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Cotistas"
        info="Quantidade de egressos que foram cotistas"
        :loading="loadedData.shareHolder ? false : true"
        :data="loadedData.shareHolder"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Cotas"
        info="Quantidade de egressos por cada cota"
        :loading="loadedData.quotas ? false : true"
        :data="loadedData.quotas"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Bolsista"
        info="Quantidade de egressos que foram bolsistas"
        :loading="loadedData.scholar ? false : true"
        :data="loadedData.scholar"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Área de atuação"
        info="Quantidade de egressos por cada área de atuação"
        :loading="loadedData.acting ? false : true"
        :data="loadedData.acting"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Deseja realizar Pós-graduação"
        info="Quantidade de egressos que desejam realizar pós-graduação"
        :loading="loadedData.interestInPost ? false : true"
        :data="loadedData.interestInPost"
      />
      <CustomBarGraph
        v-show="filters.all || filters.career"
        legend="Remuneração"
        info="Remuneração mensal média da bolsa do egresso"
        :loading="loadedData.remuneration ? false : true"
        :data="loadedData.remuneration"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Tipo de bolsa"
        info="Quantidade de egressos por cada tipo de bolsa"
        :loading="loadedData.scholarshipType ? false : true"
        :data="loadedData.scholarshipType"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Local de pós-graduação"
        info="Quantidade de egressos por instituição de pós-graduação"
        :loading="loadedData.postGraduateLocal ? false : true"
        :data="loadedData.postGraduateLocal"
      />
      <CustomPieGraph
        v-show="filters.all || filters.academic"
        legend="Curso de pós-graduação"
        info="Quantidade de egressos por curso de pós-graduação"
        :loading="loadedData.postGraduateCourse ? false : true"
        :data="loadedData.postGraduateCourse"
      />
      <CustomPieGraph
        v-show="filters.all || filters.career"
        legend="Vínculo empregatício"
        info="Onde os egressos estão trabalhando"
        :loading="loadedData.company ? false : true"
        :data="loadedData.company"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiFilterVariant, mdiPoll } from '@mdi/js'
import CustomPieGraph from './components/CustomPieGraph.vue'
import CustomBarGraph from 'src/components/CustomBarGraph.vue'
import FilterChip from 'src/components/FilterChip.vue'
import { useGraficoStore } from 'src/store/GraficoStore'
import { models } from 'src/@types'
interface AllChartSeries extends models.Graphics.AllChartSeries {}

const $store = useGraficoStore()

const loadedData = ref<AllChartSeries>({
  company: null,
  postGraduateCourse: null,
  postGraduateLocal: null,
  scholarshipType: null,
  remuneration: null,
  interestInPost: null,
  acting: null,
  scholar: null,
  quotas: null,
  shareHolder: null,
  postGraduate: null,
  student: null,
  wage: null,
  sector: null,
  gender: null,
  age: null
})

onMounted(async () => {
  loadedData.value = await $store.fetchAll()
})

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
