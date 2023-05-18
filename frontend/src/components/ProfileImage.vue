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
          class="
          bg-black
          relative
          hover:duration-200
          w-[120px]
          h-[120px]
          z-0

          rounded-full"
        >
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

        <img
          class="
          absolute
          inset-0
          z-10
          w-[120px]
          h-[120px]
          rounded-full"
          :src="getObjectURL(file)"
          alt="Uploaded image"
        >
      </span>
    </o-field>
  </section>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { OUpload, OSidebar, section, OField, OIcon, OButton } from '@oruga-ui/oruga-next'
import ButtonActionIcon from 'src/components/ButtonActionIcon.vue'

interface Props {
  imgUrl?: string
  width?: string
  height?: string

}
const props = withDefaults(defineProps<Props>(), {
  imgUrl: 'src/assets/profile-pic.png',
  width: 'w-[120px]',
  height: 'h-[120px]'
})
const file = ref(null)

function getObjectURL (file: File) {
  if (file === undefined) {
    return 'src/assets/profile-pic.png'
  } else {
    console.log(URL.createObjectURL(file))
    return URL.createObjectURL(file)
  }
}
</script>
