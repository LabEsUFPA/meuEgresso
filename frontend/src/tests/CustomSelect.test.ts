import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomSelect from 'src/components/CustomSelect.vue'
import { mdiViewDashboard } from '@mdi/js'

describe('CustomSelect', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomSelect, {
      props: {
        label: 'Select',
        options: [
          'Option 1',
          'Option 2',
          'Option 3'
        ],
        name: 'test'
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Renders style props', async () => {
    const wrapper = mount(CustomSelect, {
      props: {
        label: 'Testing',
        helperText: 'Helper Text',
        errorText: 'Error Text',
        iconPath: mdiViewDashboard,
        placeholder: 'Placeholder',
        required: true,
        options: [
          'Option 1',
          'Option 2',
          'Option 3'
        ],
        name: 'test',
        value: ''
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
