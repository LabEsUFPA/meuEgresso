<template>
  <div>
    <CustomSelect
      name="carreira.pais"
      label="País"
      v-model:value="pais"
      ref="selectPais"
      @change="handleChangeLocal('pais', $event)"
      @typing="fetchCountries($event, true)"
      @infinite-scroll="fetchMoreCounties"
      :class="spacing"
      :options="countries"
      :is-fetching="pais.isFetching"
      :placeholder="placeHolder.paisHolder"
      :pre-filled="props.preFilled"
      lazy-emit
      infinite
      :required="available.required"
      :disabled="available.disabled"
    />
    <CustomSelect
      name="carreira.estado"
      label="Estado"
      v-model:value="estado"
      ref="selectEstado"
      @change="handleChangeLocal('estado', $event)"
      @typing="fetchStates($event, true)"
      @infinite-scroll="fetchMoreStates"
      :class="spacing"
      :options="states"
      :is-fetching="estado.isFetching"
      :placeholder="placeHolder.estadoHolder"
      :pre-filled="props.preFilled"
      lazy-emit
      infinite
      :required="available.required"
      :disabled="available.disabled"
    />
    <CustomSelect
      label="Cidade"
      name="carreira.cidade"
      v-model:value="cidade"
      ref="selectCidade"
      @change="handleChangeLocal('cidade', $event)"
      @infinite-scroll="fetchMoreCities"
      @typing="fetchCities($event, true)"
      :placeholder="placeHolder.cidadeHolder"
      :is-fetching="cidade.isFetching"
      :pre-filled="props.preFilled"
      :options="cities"
      lazy-emit
      infinite
      :required="available.required"
      :disabled="available.disabled"
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

const selectPais = ref()
const selectEstado = ref()
const selectCidade = ref()

function setPais (payload: string) {
  selectPais.value.setInitialValues(payload)
}

function setEstado (payload: string) {
  selectEstado.value.setInitialValues(payload)
}

function setCidade (payload: string) {
  selectCidade.value.setInitialValues(payload)
}

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
  spacing?: string
  preFilled?: boolean
  disabled: boolean,
  required: boolean,
}

const props = withDefaults(defineProps<Props>(), {
  isInput: true,
  paisHolder: '',
  estadoHolder: '',
  cidadeHolder: '',
  spacing: 'mb-2',
  preFilled: false,
  disabled: false,
  required: true

})

defineExpose({
  fetchMoreCounties,
  fetchMoreStates,
  fetchMoreCities,
  setPais,
  setEstado,
  setCidade
})
const available = ref({
  required: props.required,
  disabled: props.disabled
})
const placeHolder = ref({
  paisHolder: props.paisHolder,
  estadoHolder: props.estadoHolder,
  cidadeHolder: props.cidadeHolder
})

async function handleChangeLocal (name: string, event: any) {
  switch (name) {
    case 'pais':
      paisChange.value = !paisChange.value
      pais.value.id = event
      estado.value.query = ''
      cidade.value.query = ''
      fetchMoreStates(true)
      selectEstado.value.setInitialValues('')
      selectCidade.value.setInitialValues('')

      // $emit('paisChange')
      break
    case 'estado':
      estadoChange.value = !estadoChange.value
      estado.value.id = event
      cidade.value.query = ''
      fetchMoreCities(true)
      selectCidade.value.setInitialValues('')
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

  pais.value.query = query
  pais.value.isFetching = true
  const response = await apiEnderecos.getPaises(pais.value.query, pais.value.page)
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
  const response = await apiEnderecos.getEstados(estado.value.query, pais.value.id, estado.value.page)
  estado.value.isFetching = false

  if (response.status === 200) {
    states.value = [...states.value, ...response.data]
    estado.value.page++
  }
}

async function fetchMoreStates (clean = false) {
  fetchStates(estado.value.query, clean)
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
  const response = await apiEnderecos.getCidades(cidade.value.query, estado.value.id, cidade.value.page)
  cidade.value.isFetching = false

  if (response.status === 200) {
    cities.value = [...cities.value, ...response.data]
    cidade.value.page++
  }
}

async function fetchMoreCities (clean = false) {
  fetchCities(cidade.value.query, clean)
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
watch(() => props.required, (newValue) => {
  available.value.required = newValue
})
watch(() => props.disabled, (newValue) => {
  available.value.disabled = newValue
})
</script>
