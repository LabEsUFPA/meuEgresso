import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import ShortPost from 'src/pages/FeedVagas/components/ShortPost.vue'
import { describe, expect, it, beforeEach } from 'vitest'

describe('ShortPost', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })
  it('should render props', () => {
    const wrapper = mount(ShortPost, {
      props: {
        id: 1,
        nome: 'Usuário',
        titulo: 'Título',
        area: 'Área de emprego',
        descricao: 'Descrição da vaga',
        salario: '10.000,00',
        foto: ''
      }
    })

    expect(wrapper.html()).toContain('Usuário')
    expect(wrapper.html()).toContain('Título')
    expect(wrapper.html()).toContain('Área de emprego')
    expect(wrapper.html()).toContain('Descrição da vaga')
  })

  it('should render button', () => {
    const wrapper = mount(ShortPost, {
      props: {
        id: 1,
        nome: 'Usuário',
        titulo: 'Título',
        area: 'Área de emprego',
        descricao: 'Descrição da vaga',
        salario: '10.000,00',
        foto: ''
      }
    })

    expect(wrapper.html()).toContain('Ver mais')
  })
})
