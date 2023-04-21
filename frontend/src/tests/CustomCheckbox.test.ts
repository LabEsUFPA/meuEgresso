import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'

describe('CustomCheckbox', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomCheckbox, {
      props: {
        label: 'Testing',
        modelValue: false,
        'onUpdate:modelValue': (e: any) => wrapper.setProps({ modelValue: !wrapper.props('modelValue') })
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Has a label', () => {
    const wrapper = mount(CustomCheckbox, {
      props: {
        label: 'Testing',
        modelValue: false,
        'onUpdate:modelValue': (e: any) => wrapper.setProps({ modelValue: !wrapper.props('modelValue') })
      }
    })

    expect(wrapper.html()).toContain("Testing")
  })

  it('Changes v-model', async () => {
    const wrapper = mount(CustomCheckbox, {
      props: {
        label: 'Testing',
        modelValue: false,
        'onUpdate:modelValue': (e: any) => wrapper.setProps({ modelValue: !wrapper.props('modelValue') })
      }
    })

    expect(wrapper.props('modelValue')).toBe(false)
    await wrapper.find('button').trigger('click')
    expect(wrapper.props('modelValue')).toBe(true)
    await wrapper.find('button').trigger('click')
    expect(wrapper.props('modelValue')).toBe(false)
  })
})
