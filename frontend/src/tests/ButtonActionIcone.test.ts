import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import ButtonActionIcon from 'src/pages/PerfilEgresso/components/ButtonActionIcon.vue'

describe('ButtonActionIcon', () => {
  it('renders a button element', () => {
    const wrapper = mount(ButtonActionIcon)
    expect(wrapper.find('button').exists()).toBe(true)
  })

  it('emits a click event when clicked', async () => {
    const wrapper = mount(ButtonActionIcon)
    const button = wrapper.find('button')

    await button.trigger('click')
    expect(wrapper.emitted('click')).toBeTruthy()
  })

  it('applies the default variant and color classes', () => {
    const wrapper = mount(ButtonActionIcon)
    const button = wrapper.find('button')

    expect(button.classes()).toContain('bg-sky-700')
  })

  it('applies the outlined variant classes', () => {
    const wrapper = mount(ButtonActionIcon, {
      props: {
        variant: 'outlined',
        color: 'blue'
      }
    })
    const button = wrapper.find('button')

    expect(button.classes()).toContain('outline-blue-400')
    expect(button.classes()).toContain('hover:bg-blue-600/20')
  })

  it('applies the flat variant classes', () => {
    const wrapper = mount(ButtonActionIcon, {
      props: {
        variant: 'flat',
        color: 'green'
      }
    })
    const button = wrapper.find('button')

    expect(button.classes()).toContain('hover:bg-green-600/20')
  })

  it('applies the custom style class', () => {
    const wrapper = mount(ButtonActionIcon, {
      props: {
        customStyle: 'custom-class'
      }
    })
    const button = wrapper.find('button')

    expect(button.classes()).toContain('custom-class')
  })
})
