<template>
  <button
    :class="styles"
    :type="type"
    @click="$emit('click')"
  >
    <img
      :class="classimg"
      :src="iconPath"
      :width="iconSize"
      :height="iconSize"
    >
  </button>
</template>

<script lang="ts" setup>
import { computed, pushScopeId } from 'vue'

defineEmits(['click'])

interface Props {
  variant?: 'standard' | 'outlined' | 'flat' | 'round' | 'whiteDanger';
  hasShadow?: boolean;
  color?:
    | 'sky'
    | 'blue'
    | 'red'
    | 'green'
    | 'emerald'
    | 'whitesky'
    | 'transparentsky'
    | 'invisiblesky'
    | 'whiteDanger';
  iconPath?: string;
  type?: 'reset' | 'button' | 'submit';
  iconType?: string;
  classimg?: string;
  iconSize?: string;
  mode?: 'link' | 'input'
  customStyle?: string;
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'standard',
  hasShadow: true,
  color: 'sky',
  type: 'button',
  iconPath: '',
  url: '',
  iconType: 'mdi',
  classimg: 'normal',
  iconSize: '20',
  mode: 'link',
  customStyle: ''
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
  whiteDanger: {
    background: {
      standard: 'bg-white',
      hoverLight: 'hover:bg-red-300/50',
      hover: 'hover:bg-red-200'
    },
    text: 'text-sky-600',
    outline: 'outline-sky-600/20'

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
    'items-center rounded-full hover:duration-200'
  ]

  // const classes = ['items-rounded-md flex px-8 py-1.5 text-lg font-semibold hover:duration-200']
  classes.push(props.customStyle)
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
      break
  }
  return classes.join(' ')
})

</script>

<style>

</style>
