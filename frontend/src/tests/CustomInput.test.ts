import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiViewDashboard } from '@mdi/js'

describe('CustomInput', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        modelValue: 'Initial value',
        'onUpdate:modelValue': (e: any) => wrapper.setProps({ modelValue: e })
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Changes v-model', async () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        modelValue: 'Initial value',
        'onUpdate:modelValue': (e: any) => wrapper.setProps({ modelValue: e })
      }
    })

    await wrapper.find('input').setValue('New value')
    expect(wrapper.props('modelValue')).toBe('New value')
  })

  it('Renders style props', async () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        helperText: 'Helper Text',
        errorText: 'Error Text',
        iconPath: mdiViewDashboard,
        placeholder: 'Placeholder',
        required: true,
        modelValue: 'Initial value',
        'onUpdate:modelValue': (e: any) => wrapper.setProps({ modelValue: e })
      }
    })

    expect(wrapper.html()).toContain('Testing')
    expect(wrapper.html()).toContain('Helper Text')
    expect(wrapper.html()).toContain('Error Text')
    expect(wrapper.html()).toContain('svg')
    expect(wrapper.html()).toContain('Placeholder')
    expect(wrapper.html()).toContain('*')
  })
})
