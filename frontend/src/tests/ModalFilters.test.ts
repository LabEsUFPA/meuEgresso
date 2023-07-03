import { mount } from '@vue/test-utils'
import ModalFilters from 'src/components/ModalFilters.vue'
import { describe, expect, it } from 'vitest'

describe('ModalFilters', () => {
  it('should render props', () => {
    const wrapper = mount(ModalFilters, {
      props: {
        modelValue: false,
        filters: [
          { id: 1, name: 'Filtro 1', selected: false, selectable: true },
          { id: 2, name: 'Filtro 2', selected: false, selectable: true },
          { id: 3, name: 'Filtro 3', selected: false, selectable: true }
        ]
      }
    })

    expect(wrapper.html()).toContain('Filtro 1')
    expect(wrapper.html()).toContain('Filtro 2')
    expect(wrapper.html()).toContain('Filtro 3')
  })

  it('should render buttons', () => {
    const wrapper = mount(ModalFilters, {
      props: {
        modelValue: false,
        filters: [
          { id: 1, name: 'Filtro 1', selected: false, selectable: true },
          { id: 2, name: 'Filtro 2', selected: false, selectable: true },
          { id: 3, name: 'Filtro 3', selected: false, selectable: true }
        ]
      }
    })

    expect(wrapper.html()).toContain('Fechar')
  })
})
