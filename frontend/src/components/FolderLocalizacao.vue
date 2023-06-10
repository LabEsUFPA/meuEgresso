<template>
  <FolderSection class="mt-6">
    <template #title>
      <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
        <SvgIcon
          type="mdi"
          size="20"
          class="inline mr-2"
          :path="mdiMapMarker"
        />
        Localização
      </h1>
    </template>

    <template #default>
      <div v-show="isInput">
        <div>
          <CustomSelect
            class="mb-5"
            name="localizacao.pais"
            label="País"
            :options="countries"
            v-model:value="pais"
            @change="pais = $event"
            required
            :placeholder="placeHolder.paisHolder"
          />

          <CustomSelect
            class="mb-5"
            name="localizacao.estado"
            label="Estado"
            :options="states"
            v-model:value="estado"
            @change="estado = $event"
            required
            :placeholder="placeHolder.estadoHolder"
          />

          <CustomSelect
            name="localizacao.cidade"
            label="Cidade"
            :options="cities"
            required
            :placeholder="placeHolder.cidadeHolder"
          />
        </div>
      </div>
      <div v-show="!isInput">
        <slot name="NonInputData" />
      </div>
    </template>
    <template
      #EditButton
    >
      <slot name="EditButton" />
    </template>
  </FolderSection>
</template>

<script lang="ts" setup>
import FolderSection from 'src/components/FolderSection.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, computed, watch, onMounted } from 'vue'
import { Country, State, City } from 'country-state-city'
import { mdiMapMarker } from '@mdi/js'
import { useCadastroEgressoStore } from 'src/store/CadastroEgresso'
import LocalStorage from 'src/services/localStorage'
const $store = useCadastroEgressoStore()
const storage = new LocalStorage()

if (storage.has('loggedEgresso')) {
  $store.fetchAll()
}

const pais = ref('')
const estado = ref('')
const form = ref<typeof Form | null>(null)

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

const placeHolder = ref({
  paisHolder: props.paisHolder,
  estadoHolder: props.estadoHolder,
  cidadeHolder: props.cidadeHolder
})

const countries = computed(() => {
  const countries = Country.getAllCountries()
  const filteredCountries = []
  for (const country of countries) {
    filteredCountries.push({
      label: country.name,
      value: country.isoCode
    })
  }

  return filteredCountries
})

const states = computed(() => {
  const states = State.getStatesOfCountry(pais.value)
  const filteredStates = []

  for (const state of states) {
    filteredStates.push({
      label: state.name,
      value: state.isoCode
    })
  }
  return filteredStates
})

const cities = computed(() => {
  const cities = City.getCitiesOfState(pais.value, estado.value)
  const filteredCities = []

  for (const city of cities) {
    filteredCities.push(city.name)
  }
  return filteredCities
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
