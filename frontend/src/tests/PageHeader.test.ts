import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import PageHeader from 'src/components/PageHeader.vue'
import { beforeEach, describe, expect, it } from 'vitest'

describe('PageHeader', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('should render props data', () => {
    const wrapper = mount(PageHeader, {
      props: {
        iconPath: 'Icon',
        titulo: 'Título',
        backTo: '/'
      }
    })
    expect(wrapper.html()).toContain(wrapper.vm.iconPath)
    expect(wrapper.html()).toContain(wrapper.vm.titulo)
  })
})
