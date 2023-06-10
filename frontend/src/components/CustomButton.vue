<template>
  <span>
    <button
      v-if="tag === 'button'"
      :class="styles"
      @click="$emit('click')"
      :type="type"
    >
      <slot />
    </button>
    <RouterLink
      v-if="tag === 'router'"
      :to="link"
      :class="styles"
    >
      <slot />
    </RouterLink>
    <a
      v-if="tag === 'a'"
      :class="styles"
      :href="link"
      :rel="rel"
      :target="target"
    >
      <slot />
    </a>
  </span>
</template>

<script lang="ts" setup>
import { computed } from 'vue'

defineEmits(['click'])

interface Props {
  variant?: 'standard' | 'outlined' | 'flat'
  textClass?: string
  color?: 'sky' | 'blue' | 'red' | 'green' | 'emerald' | 'white' | 'black' | 'gray'
  type?: 'reset' | 'button' | 'submit'
  tag?: 'a' | 'button' | 'router'
  link?: string
  rel?: string
  target?: string
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'standard',
  textClass: 'text-white',
  color: 'sky',
  type: 'button',
  tag: 'button',
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
      hover: 'hover:bg-green-800'
    },
    text: 'text-green-600',
    outline: 'outline-green-600'
  },
  emerald: {
    background: {
      standard: 'bg-emerald-600',
      hoverLight: 'hover:bg-emerald-600/20',
      hover: 'hover:bg-emerald-800'
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
  black: {
    background: {
      standard: 'bg-black',
      hoverLight: 'hover:bg-gray-900/20',
      hover: 'hover:bg-gray-900'
    },
    text: 'text-black',
    outline: 'outline-black'
  },
  gray: {
    background: {
      standard: 'bg-gray-400',
      hoverLight: 'hover:bg-gray-500/20',
      hover: 'hover:bg-gray-500'
    },
    text: 'text-white',
    outline: 'outline-gray-400'
  }
}

const styles = computed(() => {
  const classes = ['rounded-md px-4 py-1 text-lg font-semibold hover:duration-200 inline-block flex flex-row items-center justify-center max-h-[32px]']
  switch (props.variant) {
    case 'standard':
      classes.push(colorClassNames[props.color].background.standard)
      classes.push(colorClassNames[props.color].background.hover)
      break
    case 'outlined':
      classes.push(`outline-1 focus:outline-3 outline ${colorClassNames[props.color].outline} ${colorClassNames[props.color].background.hoverLight} focus:outline-slate-900`)
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
