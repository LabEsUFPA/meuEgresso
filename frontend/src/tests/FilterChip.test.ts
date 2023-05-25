import { mount } from '@vue/test-utils'
import FilterChip from 'src/components/FilterChip.vue'
import { describe, expect, it } from 'vitest'

describe('FilterChip', () => {
  it('should render props', () => {
    const wrapper = mount(FilterChip, {
      props: {
        title: 'Título do chip',
        applied: false
      }
    })

    expect(wrapper.html()).toContain('Título do chip')
  })
})
