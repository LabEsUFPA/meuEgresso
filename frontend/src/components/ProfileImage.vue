<template>
  <section>
    <!-- class="file" -->
    <o-field
      class="file"
    >
      <o-upload
        :disabled="!isInput"
        v-model="file"
        drag-drop
        class="hidden"
      >
        <section
          :class="styleImageInput"
        >
          <div
            class="ml-[45px] mt-[45px]"
          >
            <img
              v-if="isInput"
              width="30"
              height="30"
              src="src/assets/round-upload.svg"
            >
          </div>
          <o-button
            tag="a"
            variant="primary"
            rounded
          />
        </section>
      </o-upload>
      <img
        v-if="imgUrl.value==='' && !file"
        class="
                     z-5
                     w-[120px]
                     h-[120px]
                    rounded-full"
        :src="imgDefault"
        alt=""
      >
      <img
        v-else-if="!file"
        class="
                     z-10
                     w-[120px]
                     h-[120px]
                    rounded-full"
        :src="imgUrl.value"
        alt="profileImage"
      >
      <span
        class="file-name"
        v-if="file"
      >
        <div>
          <img
            class="
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
    class="absolute z-20 ml-[90px] mt-[90px] rounded-full"
    icon-path="/src/assets/trashCan.svg"
    icon-size="20"
    custom-style="px-2 py-2"
    color="whiteDanger"
    @click="remove()"
  />
</template>

<script setup lang="ts">
import { ref, computed, watch, nextTick, getCurrentInstance } from 'vue'
import { OUpload, OSidebar, section, OField, OIcon, OButton } from '@oruga-ui/oruga-next'
import ButtonActionIcon from 'src/components/ButtonActionIcon.vue'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'
defineEmits(['remove', 'imgUrl', 'imageUploadBack'])

const egressoStore = usePerfilEgressoStore()
const renderComponent = ref(true)
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

const imgUrl = ref({
  value: props.imgUrl
})
const file = ref<File | null>(null)

let imageEgressoFile: any

function getObjectURL (file: File) {
  imageEgressoFile = file
  return URL.createObjectURL(file)
}

function imageUploadBack () {
  egressoStore.uploadImageEgresso(imageEgressoFile)
}

const styleImageInput = computed(() => {
  const imageStyle = [' hover:duration-200 w-[120px] h-[120px] absolute z-20 rounded-full']
  if (props.isInput) {
    imageStyle.push('bg-gray-700/70 hover:bg-gray-700/50')
  }
  return imageStyle
})

defineExpose({
  imageUploadBack
})

async function remove () {
  const removeResp = await egressoStore.removeImageEgresso()
  // dataEgresso.value.profileHead.image= ''
  imgUrl.value.value = ''
  file.value = null
  imageEgressoFile = ''
  console.log('removeimageresso')
  console.log(removeResp)
}

const forceRender = async () => {
  console.log('force')
  // Here, we'll remove MyComponent
  renderComponent.value = false

  // Then, wait for the change to get flushed to the DOM
  await nextTick()

  // Add MyComponent back in
  renderComponent.value = true
}
forceRender()
watch(() => props.imgUrl, (newValue) => {
  imgUrl.value.value = newValue
})

</script>
