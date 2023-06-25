<template>
  <div>
    <CustomSelect
      class="mb-2"
      name="localizacao.pais"
      label="País"
      :options="countries"
      v-model:value="pais"
      @change="handleChangeLocal('pais', $event)"
      :is-fetching="pais.isFetching"
      @typing="fetchCountries($event, true)"
      @infinite-scroll="fetchMoreCounties"
      infinite
      required
      :placeholder="placeHolder.paisHolder"
    />
    <CustomSelect
      class="mb-2"
      name="localizacao.estado"
      label="Estado"
      :options="states"
      v-model:value="estado"
      @change="handleChangeLocal('estado', $event)"
      :is-fetching="estado.isFetching"
      @typing="fetchStates($event, true)"
      @infinite-scroll="fetchMoreStates"
      infinite
      required
      :placeholder="placeHolder.estadoHolder"
    />
    <CustomSelect
      name="localizacao.cidade"
      label="Cidade"
      :options="cities"
      v-model:value="cidade"
      @change="handleChangeLocal('cidade', $event)"
      :is-fetching="cidade.isFetching"
      @typing="fetchCities($event, true)"
      @infinite-scroll="fetchMoreCities"
      infinite
      required
      :placeholder="placeHolder.cidadeHolder"
    />
  </div>
</template>

<script lang="ts" setup>

import CustomSelect from 'src/components/CustomSelect.vue'

import { ref, watch, onMounted } from 'vue'
import apiEnderecos from 'src/services/apiEnderecos'

import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
import { type models } from 'src/@types'

interface ComplexOpts extends models.ComplexOpts {}
const $store = useCadastroEgressoStore()
const storage = new LocalStorage()
const paisChange = ref(false)
const estadoChange = ref(false)

// const $emit = defineEmits(['paisChange', 'estadoChange'])

if (storage.has('loggedEgresso')) {
  $store.fetchAll()
}

const pais = ref({
  id: 0,
  page: 0,
  isFetching: false,
  query: ''
})
const estado = ref({
  id: 0,
  page: 0,
  isFetching: false,
  query: ''
})

const cidade = ref({
  id: 0,
  page: 0,
  isFetching: false,
  query: ''
})

  interface Props {
    isInput?: boolean
    paisHolder?: string
    estadoHolder?: string
    cidadeHolder?: string
  }

const props = withDefaults(defineProps<Props>(), {
  isInput: true,
  paisHolder: '',
  estadoHolder: '',
  cidadeHolder: ''
})
defineExpose({
  fetchMoreCounties,
  fetchMoreStates,
  fetchMoreCities
})

const placeHolder = ref({
  paisHolder: props.paisHolder,
  estadoHolder: props.estadoHolder,
  cidadeHolder: props.cidadeHolder
})

async function handleChangeLocal (name: string, event: any) {
  console.log('handleChange')
  switch (name) {
    case 'pais':
      paisChange.value = !paisChange.value
      pais.value.id = event

      console.log('local')
      console.log(pais.value)
      fetchMoreStates()

      // $emit('paisChange')
      break
    case 'estado':
      estadoChange.value = !estadoChange.value
      estado.value.id = event
      console.log('state')
      fetchMoreCities()
      // $emit('estadoChange')
      break
  }
}

const countries = ref<ComplexOpts[]>([])
async function fetchCountries (query: string, clean: boolean) {
  if (clean) {
    // $emit('paisChange')
    pais.value.id = 0
    pais.value.page = 0

    countries.value = []
    if (query === 'event') {
      query = ''
    }
  }

  console.log(pais.value)
  pais.value.query = query
  pais.value.isFetching = true
  const response = await apiEnderecos.getPaises(query, pais.value.page)
  pais.value.isFetching = false

  if (response.status === 200) {
    countries.value = [...countries.value, ...response.data]
    pais.value.page++
  }
}

async function fetchMoreCounties () {
  fetchCountries(pais.value.query, false)
}

const states = ref<ComplexOpts[]>([])
async function fetchStates (query: string, clean: boolean) {
  if (clean) {
    // $emit('estadoChange')

    estado.value.id = 0
    estado.value.page = 0
    states.value = []
    if (query === 'event') {
      query = ''
    }
  }

  estado.value.query = query
  estado.value.isFetching = true
  const response = await apiEnderecos.getEstados(query, pais.value.id, estado.value.page)
  estado.value.isFetching = false

  if (response.status === 200) {
    states.value = [...states.value, ...response.data]
    estado.value.page++
  }
}

async function fetchMoreStates () {
  fetchStates(estado.value.query, false)
}
const cities = ref<ComplexOpts[]>([])
async function fetchCities (query: string, clean: boolean) {
  if (clean) {
    cidade.value.id = 0
    cidade.value.page = 0
    cities.value = []
    if (query === 'event') {
      query = ''
    }
  }

  cidade.value.query = query
  cidade.value.isFetching = true
  const response = await apiEnderecos.getCidades(query, estado.value.id, cidade.value.page)
  cidade.value.isFetching = false

  if (response.status === 200) {
    cities.value = [...cities.value, ...response.data]
    cidade.value.page++
  }
}

async function fetchMoreCities () {
  console.log('123')
  fetchCities(cidade.value.query, false)
}

onMounted(() => {
  fetchMoreCounties()
  const estadoInput = document.querySelector('.localizacao-estado') as HTMLInputElement

  const cidadeInput = document.querySelector('.localizacao-cidade') as HTMLInputElement

  watch(paisChange, () => {
    setTimeout(() => {
      if (cidadeInput?.value) {
        cidadeInput.value = ''
        estadoInput.value = ''
      }
    }, 10)
  })

  watch(estadoChange, () => {
    setTimeout(() => {
      if (cidadeInput?.value) {
        cidadeInput.value = ''
      }
    }, 10)
  })
})
watch(() => props.paisHolder, (newValue) => {
  placeHolder.value.paisHolder = newValue
})
watch(() => props.estadoHolder, (newValue) => {
  placeHolder.value.estadoHolder = newValue
})
watch(() => props.cidadeHolder, (newValue) => {
  placeHolder.value.cidadeHolder = newValue
})
</script>
