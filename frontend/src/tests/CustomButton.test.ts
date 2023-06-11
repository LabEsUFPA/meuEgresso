import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomButton from 'src/components/CustomButton.vue'
import { createRouter, createWebHistory } from 'vue-router'
import routes from 'src/router/routes'

const router = createRouter({
  history: createWebHistory(),
  routes
})

describe('CustomButton', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomButton, {
      global: {
        plugins: [router]
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Has a slot', () => {
    const wrapper = mount(CustomButton, {
      global: {
        plugins: [router]
      },

      slots: {
        default: 'Testing 123'
      }
    })

    expect(wrapper.text()).toContain('Testing 123')
  })

  it('Renders diffrent tags', () => {
    const linkWrapper = mount(CustomButton, {
      global: {
        plugins: [router]
      },

      props: {
        tag: 'a'
      }
    })

    const buttonWrapper = mount(CustomButton, {
      global: {
        plugins: [router]
      },

      props: {
        tag: 'button'
      }
    })

    const routerWrapper = mount(CustomButton, {
      global: {
        plugins: [router]
      },

      props: {
        tag: 'router'
      }
    })

    // rounded-md existe em todo botão, independente da tag
    expect(linkWrapper.html()).toContain('a')
    expect(buttonWrapper.html()).toContain('button')
    expect(routerWrapper.html()).toContain('a')
  })
})
