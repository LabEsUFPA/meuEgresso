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
        status: 'completo',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.find('button').exists()).toBe(true)
  })

  it('should render options for completo status', async () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'completo',
        email: 'email@teste.com'
      }
    })
    console.log(wrapper.text())
    expect(wrapper.text()).toContain('Editar cadastro')
    expect(wrapper.text()).toContain('Enviar e-mail')
  })

  it('should render options for pendente status', async () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'pendente',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.text()).toContain('Aprovar cadastro')
    expect(wrapper.text()).toContain('Enviar e-mail')
  })

  it('should render options for incompleto status', async () => {
    const wrapper = mount(AdminOptionsDropdown, {
      props: {
        id: 1,
        idEgresso: 1,
        status: 'incompleto',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.text()).toContain('Enviar e-mail')
  })
})
