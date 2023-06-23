<template>
  <FolderSection>
    <template #title>
      <h1 class="text-lg text-cyan-800 font-semibold flex flex-row items-center">
        <SvgIcon
          type="mdi"
          size="20"
          class="inline mr-2"
          :path="mdiAccount"
        />
        Geral1
      </h1>
    </template>
    <template #default>
      <div>
        <CustomInput
          class="mb-5"
          name="geral.nome"
          label="Nome"
          :icon-path="mdiAccount"
          required
        />

        <CustomInput
          class="mb-5"
          name="geral.nascimento"
          type="date"
          label="Data de Nascimento"
          required
        />

        <CustomSelect
          class="mb-5"
          name="geral.genero"
          label="Gênero"
          :options="$store.generos"
          required
        />

        <CustomInput
          class="mb-5"
          name="geral.email"
          label="E-mail"
          placeholder="Ex: example@gov.br"
          helper-text="Use um email válido: hotmail, outlook, gmail, etc."
          :icon-path="mdiEmail"
          required
        />

        <CustomInput
          class="mb-5"
          name="geral.linkedin"
          label="linkedIn"
          :icon-path="svgPath.linkedin"
        />

        <CustomInput
          label="Curriculo Lattes"
          name="geral.lattes"
          icon-path="src/assets/lattesCinza.svg"
          img-icon
        />
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
import CustomInput from 'src/components/CustomInput.vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import SvgIcon from '@jamescoyle/vue-icon'
import { Form } from 'vee-validate'
import { ref, watch, onMounted } from 'vue'
import svgPath from 'src/assets/svgPaths.json'
import {
  mdiAccount,
  mdiEmail
} from '@mdi/js'
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

}

withDefaults(defineProps<Props>(), {
  isInput: true
})
const geral = ref({
  email: ''
})
onMounted(() => {
  watch(pais, () => {
    form.value?.setFieldValue('localizacao.cidade', '')
    form.value?.setFieldValue('localizacao.estado', '')
  })

  watch(estado, () => {
    form.value?.setFieldValue('localizacao.cidade', '')
  })

  if (storage.has('loggedUser')) {
    const userData = JSON.parse(storage.get('loggedUser'))
    geral.value.email = 'userData1'
    // form.value?.setFieldValue('geral.email', userData.email)
    form.value?.setFieldValue('geral.nome', userData.nome)
  }
})
</script>
