import { mount } from '@vue/test-utils'
import SearchBar from 'src/components/SearchBar.vue'
import { describe, expect, it } from 'vitest'

describe('SearchBar', () => {
  it('should render props', () => {
    const wrapper = mount(SearchBar, {
      props: {
        modelValue: 'Pesquisa',
        placeholder: 'Placeholder'
      }
    })

    expect(wrapper.vm.modelValue).toEqual('Pesquisa')
    expect(wrapper.vm.placeholder).toEqual('Placeholder')
  })

  it('should render button', () => {
    const wrapper = mount(SearchBar, {
      props: {
        modelValue: 'Pesquisa',
        placeholder: 'Placeholder'
      }
    })

    expect(wrapper.html()).toContain('Buscar')
  })
})
