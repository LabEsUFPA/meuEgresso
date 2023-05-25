import { mount } from '@vue/test-utils'
import ShortPost from 'src/components/ShortPost.vue'
import { describe, expect, it } from 'vitest'

describe('ShortPost', () => {
  it('should render props', () => {
    const wrapper = mount(ShortPost, {
      props: {
        id: 1,
        nome: 'Usuário',
        titulo: 'Título',
        area: 'Área de emprego',
        descricao: 'Descrição da vaga',
        salario: '10.000,00'
      }
    })

    expect(wrapper.html()).toContain(1)
    expect(wrapper.html()).toContain('Usuário')
    expect(wrapper.html()).toContain('Título')
    expect(wrapper.html()).toContain('Área de emprego')
    expect(wrapper.html()).toContain('Descrição da vaga')
    expect(wrapper.html()).toContain('10.000,00')
  })

  it('should render button', () => {
    const wrapper = mount(ShortPost, {
      props: {
        id: 1,
        nome: 'Usuário',
        titulo: 'Título',
        area: 'Área de emprego',
        descricao: 'Descrição da vaga',
        salario: '10.000,00'
      }
    })

    expect(wrapper.html()).toContain('Ver mais')
  })
})
