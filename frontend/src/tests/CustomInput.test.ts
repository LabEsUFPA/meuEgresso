import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomInput from 'src/components/CustomInput.vue'
import { mdiViewDashboard } from '@mdi/js'

describe('CustomInput', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        name: 'testing'
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Renders style props', async () => {
    const wrapper = mount(CustomInput, {
      props: {
        label: 'Testing',
        name: 'testing',
        helperText: 'Helper Text',
        iconPath: mdiViewDashboard,
        placeholder: 'Placeholder',
        required: true
      }
    })

    expect(wrapper.html()).toContain('Testing')
    expect(wrapper.html()).toContain('Helper Text')
    expect(wrapper.html()).toContain('svg')
    expect(wrapper.html()).toContain('Placeholder')
    expect(wrapper.html()).toContain('*')
  })
})
