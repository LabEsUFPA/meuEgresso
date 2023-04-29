import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'

describe('CustomCheckbox', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomCheckbox, {
      props: {
        label: 'Testing',
        value: false,
        name: 'testing',
        'onUpdate:value': (e: any) => wrapper.setProps({ value: !wrapper.props('value') })
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Has a label', () => {
    const wrapper = mount(CustomCheckbox, {
      props: {
        label: 'Testing',
        value: false,
        name: 'testing',
        'onUpdate:value': (e: any) => wrapper.setProps({ value: !wrapper.props('value') })
      }
    })

    expect(wrapper.html()).toContain("Testing")
  })

  it('Changes v-model', async () => {
    const wrapper = mount(CustomCheckbox, {
      props: {
        label: 'Testing',
        value: false,
        name: 'testing',
        'onUpdate:value': (e: any) => wrapper.setProps({ value: !wrapper.props('value') })
      }
    })

    expect(wrapper.props('value')).toBe(false)
    await wrapper.find('button').trigger('click')
    expect(wrapper.props('value')).toBe(true)
    await wrapper.find('button').trigger('click')
    expect(wrapper.props('value')).toBe(false)
  })
})
