import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomTextarea from 'src/components/CustomTextarea.vue'

describe('CustomTextarea', () => {
  it('Runs properly', () => {
    const wrapper = mount(CustomTextarea, {
      props: {
        label: 'Testing',
        value: 'Initial value',
        name: 'testing',
        'onUpdate:value': async (e: any) => { await wrapper.setProps({ value: e }) }
      }
    })

    expect(wrapper.vm).toBeDefined()
  })

  it('Changes v-model', async () => {
    const wrapper = mount(CustomTextarea, {
      props: {
        label: 'Testing',
        value: 'Initial value',
        name: 'testing',
        'onUpdate:value': async (e: any) => { await wrapper.setProps({ value: e }) }
      }
    })

    await wrapper.find('textarea').setValue('New value')
    expect(wrapper.props('value')).toBe('New value')
  })
})
