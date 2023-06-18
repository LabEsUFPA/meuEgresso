import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import AdminOptionsDropdown from 'src/components/AdminOptionsDropdown.vue'
import { beforeEach, describe, expect, it } from 'vitest'

describe('AdminOptionsDropdown', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('should render menu button', () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'Ativo',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.find('button').exists()).toBe(true)
  })

  it('should render options for Ativo status', async () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'Ativo',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.html()).toContain('Editar cadastro')
    expect(wrapper.html()).toContain('Excluir cadastro')
    expect(wrapper.html()).toContain('Enviar e-mail')
  })

  it('should render options for Pendente status', async () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'Pendente',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.html()).toContain('Aprovar cadastro')
    expect(wrapper.html()).toContain('Excluir cadastro')
    expect(wrapper.html()).toContain('Enviar e-mail')
  })

  it('should render options for Incompleto status', async () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'Incompleto',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.html()).toContain('Excluir cadastro')
    expect(wrapper.html()).toContain('Enviar e-mail')
  })
})
