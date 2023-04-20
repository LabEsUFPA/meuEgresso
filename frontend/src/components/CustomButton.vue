<template>
  <button
    v-if="isButton"
    :class="styles"
    @click="$emit('click')"
    :type="type"
  >
    <slot />
  </button>
  <RouterLink
    v-if="isRouter"
    :to="link"
    :class="styles"
  >
    <slot />
  </RouterLink>
  <a
    v-if="isAnchor"
    :class="styles"
    :href="link"
    :rel="rel"
    :target="target"
  >
    <slot />
  </a>
</template>

<script lang="ts" setup>
import { computed } from 'vue'

defineEmits(['click'])

interface Props {
  variant?: 'standard' | 'outlined' | 'flat'
  textClass?: string
  color?: 'sky' | 'blue' | 'red' | 'green' | 'emerald' | 'white'
  type?: 'reset' | 'button' | 'submit'
  isButton?: boolean
  isRouter?: boolean
  isAnchor?: boolean
  link?: string
  rel?: string
  target?: string
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'standard',
  textClass: 'text-white',
  color: 'sky',
  type: 'button',
  isButton: true,
  isRouter: false,
  isAnchor: false,
  link: '/',
  rel: 'noreferrer',
  target: '_self'
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
  }
}

const styles = computed(() => {
  const classes = [
    'rounded-md px-4 py-1 text-lg font-semibold hover:duration-200'
  ]

  switch (props.variant) {
    case 'standard':
      classes.push(colorClassNames[props.color].background.standard)
      classes.push(colorClassNames[props.color].background.hover)
      break
    case 'outlined':
      classes.push(
        `outline-1 focus:outline-3 outline ${
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
    classes.push(props.textClass)
  } else {
    classes.push(colorClassNames[props.color].text)
  }

  return classes.join(' ')
})
</script>
