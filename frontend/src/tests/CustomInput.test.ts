import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiViewDashboard } from '@mdi/js'

describe('CustomInput', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        name: 'testing',
        value: 'Initial value',
        'onUpdate:value': (e: any) => wrapper.setProps({ value: e })
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Changes v-model', async () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        name: 'testing',
        value: 'Initial value',
        'onUpdate:value': (e: any) => wrapper.setProps({ value: e })
      }
    })

    await wrapper.find('input').setValue('New value')
    expect(wrapper.props('value')).toBe('New value')
  })

  it('Renders style props', async () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        name: 'testing',
        helperText: 'Helper Text',
        errorText: 'Error Text',
        iconPath: mdiViewDashboard,
        placeholder: 'Placeholder',
        required: true,
        value: 'Initial value',
        'onUpdate:value': (e: any) => wrapper.setProps({ value: e })
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
