<template>
  <section>
    <o-field
      override
      class="file"
      :root-class="classNames({
        ['outline outline-red-500']: !isValid
      })"
    >
      <o-upload
        override
        :disabled="!isInput"
        v-model="file"
        drag-drop
        accept="image/png, image/jpg, image/jpeg, image/gif"
        class="hidden"
      >
        <section
          :class="styleImageInput"
        >
          <div
            v-if="isInput"
            class="mt-3 w-45 h-55 px-5 py-5"
          >
            <img
              class="ml-6"
              width="30"
              height="30"
              src="/img/round-upload.svg"
              alt="Ícone Usuário"
            >

            <h1 class="mt-1 text-white text-[10px] ">
              Máximo de 5MB
            </h1>
          </div>
          <o-button
            override
            tag="a"
            variant="primary"
            rounded
          />
        </section>
      </o-upload>
      <template #message>
        <div
          v-if="!isValid.value"
          class="text-red-500 absolute ml-[-60px] mt-[-5px]"
        >
          O arquivo deve ser menor que 5 MB
          <!-- {{ meta.valid ? null : errorMessage }} -->
        </div>
      </template>
      <img
        v-if="imgUrl.value==='' && !file"
        class="     defaultImage
                     z-5
                     w-[120px]
                     h-[120px]
                    rounded-full"
        :src="imgDefault"
        alt=""
      >
      <img
        v-else-if="!file"
        class="     profileImage
                     z-5
                     w-[120px]
                     h-[120px]
                    rounded-full"
        :src="imgUrl.value"
        alt=""
      >
      <span
        class="file-name"
        v-if="file"
      >
        <div>
          <img
            class="
            uploadedFile
            static
            z-0
            w-[120px]
            h-[120px]
            rounded-full"
            :src="getObjectURL(file)"
            alt=""
          >
        </div>

      </span>
    </o-field>
  </section>
  <ButtonActionIcon
    v-if="isInput"
    class="buttonTrash absolute z-5 ml-[90px] mt-[90px] rounded-full"
    icon-path="/img/trashCan.svg"
    icon-size="20"
    custom-style="px-2 py-2"
    color="whiteDanger"
    @click="$emit('remove')"
  />
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { OUpload, OField, OButton } from '@oruga-ui/oruga-next'
import ButtonActionIcon from './ButtonActionIcon.vue'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
import classNames from 'classnames'
// import { useField } from 'vee-validate'

const $emit = defineEmits(['remove', 'clean', 'imageUploadBack'])

const egressoStore = usePerfilEgressoStore()
// const renderComponent = ref(true)
interface Props {
  imgUrl?: string
  imgDefault: string
  width?: string
  height?: string
  isInput?: boolean
  triggerBackUpload?: boolean
  clearUpload?: boolean

}
const props = withDefaults(defineProps<Props>(), {
  imgUrl: '',
  width: 'w-[120px]',
  height: 'h-[120px]',
  isInput: false,
  triggerBackUpload: false,
  clearUpload: false
})

const isValid = ref({
  value: true
})
const imgUrl = ref({
  value: props.imgUrl
})
const file = ref<File | null>(null)

let imageEgressoFile: any

function getObjectURL (file: File) {
  imageEgressoFile = file
  return URL.createObjectURL(file)
}

async function imageUploadBack () {
  const response = await egressoStore.uploadImageEgresso(imageEgressoFile)
  if (response === 201) {
    isValid.value.value = true
  } else {
    isValid.value.value = false
  }
  return response
}
async function imageUploadBackAdmin (egressoId : number) {
  const response = await egressoStore.uploadImageEgressoAdmin(imageEgressoFile, egressoId)
  if (response === 201) {
    isValid.value.value = true
  } else {
    isValid.value.value = false
  }
  return response
}

const styleImageInput = computed(() => {
  const imageStyle = [' hover:duration-200 w-[120px] h-[120px] absolute z-5 rounded-full']
  if (props.isInput) {
    imageStyle.push('bg-gray-700/70 hover:bg-gray-700/50')
  }
  return imageStyle
})

defineExpose({
  imageUploadBack,
  imageUploadBackAdmin
})

function cleanImageState () {
  imgUrl.value.value = ''
  file.value = null
  imageEgressoFile = null
  isValid.value.value = true
  console.log('clean')
  $emit('clean')
}

watch(() => props.imgUrl, (newValue) => {
  if (newValue === '' || newValue === ' ') {
    cleanImageState()
    imgUrl.value.value = newValue
    return
  }
  imgUrl.value.value = newValue
})
// watch(() => props.imgUrl, (newValue) => {

// }

</script>
