import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomPerfilData from 'src/components/CustomPerfilData.vue'

describe('CustomPerfilData Test', () => {
  it('CustomPerfilData Render Test', () => {
    const wrapper = mount(CustomPerfilData)
    expect(wrapper.vm).toBeDefined()
  })
})

describe('MyComponent', () => {
  it('CustomPerfilData renders properly when visible and enabled', () => {
    const wrapper = mount(CustomPerfilData, {
      props: {
        visible: true,
        enabled: true,
        vmodel: 'ModelValue'
      }
    })
    expect(wrapper.find('.opacity-50').exists()).toBe(false)
    expect(wrapper.find('h1.font-semibold').text()).toBe('')
    expect(wrapper.find('h1.font-regular').text()).toBe('ModelValue')
  })

  it('CustomPerfilData renders properly when visible and disabled', () => {
    const wrapper = mount(CustomPerfilData, {
      props: {
        visible: true,
        enabled: false
      }
    })
    expect(wrapper.find('.opacity-50').exists()).toBe(true)
    expect(wrapper.find('h1.font-semibold').text()).toBe('')
    expect(wrapper.find('h1.font-regular').text()).toBe('placeholder')
  })

  it('CustomPerfilData renders properly when invisible', () => {
    const wrapper = mount(CustomPerfilData, {
      props: {
        visible: false,
        enabled: true
      }
    })
    expect(wrapper.find('.opacity-50').exists()).toBe(false)
    expect(wrapper.find('h1.font-semibold').exists()).toBe(false)
    expect(wrapper.find('h1.font-regular').exists()).toBe(false)
  })

  it('CustomPerfilData renders label and value properly', () => {
    const wrapper = mount(CustomPerfilData, {
      props: {
        visible: true,
        enabled: true,
        label: 'My Label',
        vmodel: 'My Value'
      }
    })
    expect(wrapper.find('.opacity-50').exists()).toBe(false)
    expect(wrapper.find('h1.font-semibold').text()).toBe('My Label')
    expect(wrapper.find('h1.font-regular').text()).toBe('My Value')
  })

  it('CustomPerfilData renders input properly when isinput is true', () => {
    const wrapper = mount(CustomPerfilData, {
      props: {
        visible: true,
        enabled: true,
        isinput: true,
        vmodel: 'My Value'
      }
    })
    expect(wrapper.find('.opacity-50').exists()).toBe(false)
    expect(wrapper.find('h1.font-semibold').text()).toBe('')
    expect(wrapper.find('h1.font-regular').exists()).toBe(true)
    expect(wrapper.find('input[type="text"]').exists()).toBe(true)
  })
})

// describe('CustomPerfilButton', () => {
//   it('renders label text', () => {
//     const wrapper = mount(CustomPerfilData, {
//       props: {
//         label: 'My Profile'
//       }
//     })
//     expect(wrapper.text()).toContain('My Profile')
//   })

//   describe('CustomPerfilData', () => {
//     it('renders the correct props', async () => {
//       const modelValue = 'Marcelle'
//       const label = 'Name'
//       const type = 'text'
//       const iconPath = 'mdi-account'

//       const wrapper = mount(CustomPerfilData, {
//         props: {
//           modelValue,
//           label,
//           type,
//           iconPath
//         }
//       })
//       const input = wrapper.find('input')
//       expect(input.exists()).toBe(false)
//       expect(wrapper.find('.font-semibold').text()).toBe(label)
//       expect(wrapper.find('.LabelModeValue').text()).toBe(label + modelValue)
//       expect(wrapper.find('.flex-auto h1').text()).toBe(label)

//       await wrapper.setProps({ modelValue: '' })
//     })
//   })
// })
