import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomPerfilData from '../components/CustomPerfilData.vue'

describe('CustomPerfilData Test', () => {
  it('CustomPerfilData Render Test', () => {
    const wrapper = mount(CustomPerfilData)
    expect(wrapper.vm).toBeDefined()
  })
})

describe('CustomPerfilButton', () => {
  it('renders label text', () => {
    const wrapper = mount(CustomPerfilData, {
      props: {
        label: 'My Profile'
      }
    })
    expect(wrapper.text()).toContain('My Profile')
  })

  describe('CustomPerfilData', () => {
    it('renders the correct props', async () => {
      const modelValue = 'Marcelle'
      const label = 'Name'
      const type = 'text'
      const iconPath = 'mdi-account'

      const wrapper = mount(CustomPerfilData, {
        props: {
          modelValue,
          label,
          type,
          iconPath
        }
      })
      const input = wrapper.find('input')
      expect(input.exists()).toBe(false)
      expect(wrapper.find('.font-semibold').text()).toBe(label)
      expect(wrapper.find('.LabelModeValue').text()).toBe(label + modelValue)
      expect(wrapper.find('.flex-auto h1').text()).toBe(label)

      await wrapper.setProps({ modelValue: '' })
    })
  })
})
