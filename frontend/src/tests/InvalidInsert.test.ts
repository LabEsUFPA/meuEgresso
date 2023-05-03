import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import InvalidInsert from '../components/InvalidInsert.vue'

describe('InvalidInsert Test', () => {
  it('InvalidInsert component rendering test', () => {
    const wrapper = mount(InvalidInsert, {
      props: {
        showAlert: true,
        text: 'Error'
      }
    })
    expect(wrapper.find('div').exists()).toBe(true)
  })

  it('InvalidInsert component non-rendering test', () => {
    const wrapper = mount(InvalidInsert, {
      props: {
        showAlert: false,
        text: 'Error'
      }
    })
    expect((wrapper.find('div')).exists()).toBe(false)
  })

  it('teste with default props settings', () => {
    const wrapper = mount(InvalidInsert)
    expect(wrapper.find('div').exists()).toBe(false)
    expect(wrapper.find('p').exists()).toBe(false)
    expect(wrapper.find('SvgIcon').exists()).toBe(false)
  })

  it('teste with showAlert = true and with the text and icon properties defined', () => {
    const wrapper = mount(InvalidInsert, {
      props: {
        showAlert: true,
        text: 'error text',
        iconPath: 'M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z'
      }
    })
    expect(wrapper.find('div').exists()).toBe(true)
    expect(wrapper.find('p').text()).toEqual('error text')
    expect(wrapper.find('.text-white').exists()).toBe(true)
    expect(wrapper.props().iconPath).toEqual('M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z')
  })
})
