import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import FolderSection from 'src/components/FolderSection.vue'

describe('FolderSection', () => {
  it('Runs properly', () => {
    const wrapper = mount(FolderSection)

    expect(wrapper.vm).toBeDefined()
  })

  it('Renders both slots', () => {
    const wrapper = mount(FolderSection, {
      slots: {
        title: 'Title slot',
        default: 'Body slot'
      }
    })

    expect(wrapper.find('.rounded-t-2xl').html()).toContain('Title slot')
    expect(wrapper.find('.rounded-b-2xl').html()).toContain('Body slot')
  })
})
