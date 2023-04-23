<template>
  <button
    v-if="isInput"

    :class="styles"
    :type="type"
    @click="$emit('toggle')"
  >
    <!-- <div v-if="isInput">
      "isInputOff"
    </div>
    <div v-else>
      <CustomButton
        color="emerald"
        type="submit"
      >
        Salvar
      </CustomButton>
    </div> -->
    <img
      :class="classimg"
      :src="iconPath"
      :width="iconSize"
      :height="iconSize"
    >
    <h1
      :class="textClass"
    >
      <slot>{{ label }}</slot>
    </h1>
  </button>
  <button
    v-else

    :class="1"
    :type="type"
    @click="$emit('toggle')"
  >
    <!-- <div v-if="isInput">
      "isInputOff"
    </div>
    -->
    <div>
      <CustomButton
        color="emerald"
        type="submit"
      >
        Salvar
      </CustomButton>
    </div>
    <!-- <img
      :class="classimg"
      :src="iconPath"
      :width="iconSize"
      :height="iconSize"
    >
    <h1
      :class="textClass"
    >
      <slot>{{ label }}</slot>
    </h1> -->
  </button>
</template>

<script lang="ts" setup>
import { computed } from 'vue'
import CustomButton from './CustomButton.vue'
defineEmits(['toggle', 'localToggle'])

interface Props {
  isInput: boolean
  label?: string;
  variant?: 'standard' | 'outlined' | 'flat';
  hasShadow?: boolean;
  color?:
    | 'sky'
    | 'blue'
    | 'red'
    | 'green'
    | 'emerald'
    | 'whitesky'
    | 'transparentsky'
    | 'invisiblesky';
  url?: string;
  iconPath?: string;
  type?: 'reset' | 'button' | 'submit';
  iconType?: string;
  classimg?: string;
  placeholder?: string;
  iconSize?: string
  textClass?: string;
}

const props = withDefaults(defineProps<Props>(), {
  isInput: false,
  label: '',
  variant: 'standard',
  hasShadow: true,
  textClassW: 'text-white',
  color: 'sky',
  type: 'button',
  iconPath: '',
  url: '',
  iconType: 'mdi',
  classimg: 'normal',
  placeholder: '',
  iconSize: '20',
  textClass: 'text-sky-600 outline-sky-600 text-base font-bold ml-3 mb mr-2'

})

// objeto mapeia a props 'color' para as classes tailwind correspondentes
// NOTA - NÃO CRIAR NOMES DE CLASSES PROGRAMATICAMENTE: https://tailwindcss.com/docs/content-configuration#dynamic-class-names
const colorClassNames = {
  sky: {
    background: {
      standard: 'bg-sky-700',
      hoverLight: 'hover:bg-sky-600/20',
      hover: 'hover:bg-sky-600'
    },
    text: 'text-sky-700',
    outline: 'outline-sky-700'
  },
  blue: {
    background: {
      standard: 'bg-blue-700',
      hoverLight: 'hover:bg-blue-600/20',
      hover: 'hover:bg-blue-600'
    },
    text: 'text-blue-700',
    outline: 'outline-blue-400'
  },
  red: {
    background: {
      standard: 'bg-red-700',
      hoverLight: 'hover:bg-red-600/20',
      hover: 'hover:bg-red-600'
    },
    text: 'text-red-700',
    outline: 'outline-red-400'
  },
  green: {
    background: {
      standard: 'bg-green-600',
      hoverLight: 'hover:bg-green-600/20',
      hover: 'hover:bg-green-600'
    },
    text: 'text-green-600',
    outline: 'outline-green-600'
  },
  emerald: {
    background: {
      standard: 'bg-emerald-600',
      hoverLight: 'hover:bg-emerald-600/20',
      hover: 'hover:bg-emerald-600'
    },
    text: 'text-emerald-600',
    outline: 'outline-emerald-600'
  },
  white: {
    background: {
      standard: 'bg-white',
      hoverLight: 'hover:bg-sky-300/20',
      hover: 'hover:bg-sky-300'
    },
    text: 'text-white',
    outline: 'outline-white'
  },
  whitesky: {
    background: {
      standard: 'bg-white',
      hoverLight: 'hover:bg-sky-600/20',
      hover: 'hover:bg-sky-600/20'
    },
    text: 'text-sky-600',
    outline: 'outline-sky-600/20'
  },
  transparentsky: {
    background: {
      standard: 'bg-transparent',
      hoverLight: 'hover:bg-sky-600/20',
      hover: 'hover:bg-sky-600/20'
    },
    text: 'text-sky-600',
    outline: 'outline-sky-600'
  },
  invisiblesky: {
    background: {
      standard: 'bg-transparent',
      hoverLight: 'hover:bg-sky-600/20',
      hover: 'hover:bg-sky-600/20'
    },
    text: 'text-sky-600',
    outline: 'outline-sky-600'
  }
}

const styles = computed(() => {
  // const classes = ['items-center rounded-lg flex ml- px-2.5 py-1 relative text-lg font-semibold hover:duration-200']
  const classes = [
    'items-center rounded-md flex px-[7px] py-[7px] relative text-lg font-semibold hover:duration-200'
  ]

  // const classes = ['items-rounded-md flex px-8 py-1.5 text-lg font-semibold hover:duration-200']

  switch (props.variant) {
    case 'standard':
      classes.push(colorClassNames[props.color].background.standard)
      classes.push(colorClassNames[props.color].background.hover)
      if (props.hasShadow === true) {
        classes.push('shadow-md')
      }

      break
    case 'outlined':
      classes.push(
        `outline-2 focus:outline-4 outline ${
          colorClassNames[props.color].outline
        } ${
          colorClassNames[props.color].background.hoverLight
        } focus:outline-slate-900`
      )
      break
    case 'flat':
      classes.push(colorClassNames[props.color].background.hoverLight)
  }

  if (props.variant === 'standard') {
    classes.push(props.textClassW)
  } else {
    classes.push(colorClassNames[props.color].text)
  }

  return classes.join(' ')
})
</script>
