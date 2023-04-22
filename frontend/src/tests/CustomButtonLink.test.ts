// import { mount } from '@vue/test-utils'
// import { describe, expect, it } from 'vitest'
// import CustomButtonLink from '../components/CustomButtonLink.vue'

// describe('CustomButtonLink Render Test', () => {
//   it('renders properly', () => {
//     const wrapper = mount(CustomButtonLink)
//     expect(wrapper.vm).toBeDefined()
//   })
// })
import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import ButtonLink from 'components/CustomButtonLink.vue'

describe('ButtonLink', () => {
  it('CustomButtonLink Render Test 1', () => {
    const wrapper = mount(ButtonLink, {
      props: {
        label: 'Click me!',
        url: ''
      }
    })
    const button = wrapper.find('button')
    expect(button.exists()).toBe(true)
    expect(button.text()).toBe('Click me!')
  })

  it('renders link with placeholder when url is provided', () => {
    const wrapper = mount(ButtonLink, {
      props: {
        label: 'Click me!',
        url: 'https://example.com',
        placeholder: 'https://placeholder.com'
      }
    })
    // :href="'' + placeholder"
    const link = wrapper.find('a')
    expect(link.exists()).toBe(true)

    expect(link.attributes('href')).toBe('https://example.com')
  })

  it('emits click event when button is clicked', async () => {
    const wrapper = mount(ButtonLink, {
      props: {
        label: 'Click me!',
        url: ''
      }
    })
    const button = wrapper.find('button')
    await button.trigger('click')
    expect(wrapper.emitted('click')).toBeTruthy()
  })
})
