<template>
  <section>
    <o-field

      class="file
      "
    >
      <o-upload

        v-model="file"
        drag-drop
        class=" hidden"
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

      <!-- <ButtonActionIcon
        icon-path="/src/assets/trashCan.svg"
        icon-size="20"
        custom-style="px-2 py-2"
        color="whiteDanger"
      >
        <o-icon icon="upload" />
        <span>Click to upload</span>
      </ButtonActionIcon> -->
      </o-upload>
      <img
        v-if="imgUrl===''"
        class="
                     static
                     z-0
                     w-[120px]
                     h-[120px]
                    rounded-full"
        :src="imgDefault"
        alt="Uploaded image"
      >
      <img
        v-else
        class="
                     static
                     z-0
                     w-[120px]
                     h-[120px]
                    rounded-full"
        :src="imgUrl"
        alt="Uploaded image"
      >
      <span
        class="file-name"
        v-if="file"
      >

        <!-- <o-button
        icon-left="times"
        size="small"
        native-type="button"
        @click="deleteDropFile(index)"
      />
      <ButtonActionIcon
        icon-path="/src/assets/trashCan.svg"
        icon-size="20"
        custom-style="px-2 py-2"
        color="whiteDanger"
        @click="deleteDropFile(index)"
      /> -->
        <div>
          <img
            class="
            static
            z-0
            mt-[-120px]
            w-[120px]
            h-[120px]
            rounded-full"
            :src="getObjectURL(file)"
            alt="Uploaded image"
          >
        </div>

      </span>
    </o-field>
  </section>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { OUpload, OSidebar, section, OField, OIcon, OButton } from '@oruga-ui/oruga-next'
import ButtonActionIcon from 'src/components/ButtonActionIcon.vue'
import { usePerfilEgressoStore } from 'src/store/PerfilEgressoStore'

const egressoStore = usePerfilEgressoStore()

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
const file = ref(null)

let imageEgressoFile: File

function getObjectURL (file: File) {
  console.log(URL.createObjectURL(file))
  imageEgressoFile = file
  return URL.createObjectURL(file)
}

function imageUploadBack () {
  egressoStore.uploadImageEgresso(imageEgressoFile)
}
// if (props.triggerBackUpload) {
//   if (imageEgressoFile !== undefined) {
//     egressoStore.uploadImageEgresso(imageEgressoUrl)
//   }
// }
const styleImageInput = computed(() => {
  const imageStyle = [' hover:duration-200 w-[120px] h-[120px] absolute z-10 rounded-full']
  if (props.isInput) {
    imageStyle.push('bg-gray-700/70 hover:bg-gray-700/50')
  }
  return imageStyle
})

defineExpose({
  imageUploadBack
})
</script>
