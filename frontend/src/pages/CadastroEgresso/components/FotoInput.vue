<template>
  <div>
    <o-field
      :root-class="classNames({
        ['outline outline-red-500']: meta.touched && !meta.valid
      })"
    >
      <template #default>
        <o-upload
          v-model="file"
          accept="image/png, image/jpg, image/jpeg, image/gif"
          @update:model-value="handleUpload"
          drag-drop
        >
          <div class="text-gray-600 flex flex-row items-center border w-64 px-4 py-2 text-sm rounded-md bg-gray-200 cursor-pointer">
            <img
              v-if="file"
              :src="fileUrl"
              class="w-7 h-7 rounded-full object-cover"
            >

            <SvgIcon
              v-else
              type="mdi"
              class="inline text-gray-600"
              :path="mdiUpload"
            />

            <div class="ml-4">
              <div class="w-52 truncate">
                {{ file ? file.name : 'Clique para selecionar foto' }}
              </div>
              <div>{{ file ? fileSize : 'Máximo de 5 MB' }}</div>
            </div>

            <div
              v-if="file"
              @click.prevent="handleClean"
              class="ml-auto"
            >
              <SvgIcon
                type="mdi"
                class="inline text-gray-600"
                :path="mdiClose"
              />
            </div>
          </div>
        </o-upload>
      </template>
      <template #message>
        <div
          v-if="meta.validated"
          class="text-red-500"
        >
          {{ meta.valid ? null : errorMessage }}
        </div>
      </template>
    </o-field>
  </div>
</template>

<script lang="ts" setup>
import { OField, OUpload } from '@oruga-ui/oruga-next'
import { useField } from 'vee-validate'
import SvgIcon from '@jamescoyle/vue-icon'
import { ref, computed, toRef } from 'vue'
import { mdiClose, mdiUpload } from '@mdi/js'
import classNames from 'classnames'

interface Props {
  name: string
}

const props = defineProps<Props>()
const $emit = defineEmits(['upload', 'clean'])

const file = ref<File | null>()
const fileUrl = computed(() => {
  return file.value ? URL.createObjectURL(file.value) : ''
})

const name = toRef(props, 'name')

const fileSize = computed(() => {
  if (!file.value) {
    return '0 MB'
  } else {
    const size = file.value.size / 1000

    if (Math.floor(size / 1000) > 0) {
      return `${(size / 1000).toFixed(2)} MB`
    }

    return `${size.toFixed(2)} KB`
  }
})

const {
  handleChange,
  meta,
  errorMessage
} = useField(name, undefined)

function handleUpload () {
  handleChange(file.value)
  $emit('upload')
}

function handleClean () {
  file.value = null
  $emit('clean')
}
</script>
