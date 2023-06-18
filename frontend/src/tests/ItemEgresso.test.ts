import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import ItemEgresso from 'src/components/ItemEgresso.vue'
import { beforeEach, describe, expect, it } from 'vitest'

describe('ItemEgresso', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('should render props data', () => {
    const wrapper = mount(ItemEgresso, {
      props: {
        id: 1,
        idEgresso: 1,
        nome: 'Nome',
        dataCadastro: '2023-05-01',
        status: 'Completo',
        foto: 'urlFoto',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.text()).toContain(wrapper.vm.nome)
    expect(wrapper.text()).toContain(wrapper.vm.dataCadastro.split('-').reverse().join('/'))
    expect(wrapper.text()).toContain(wrapper.vm.status)
  })

  it('should render options for completo status', async () => {
    const wrapper = mount(ItemEgresso, {
      props: {
        id: 1,
        idEgresso: 1,
        nome: 'Nome',
        dataCadastro: '2023-05-01',
        status: 'completo',
        foto: 'urlFoto',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.find('#status').classes()).toContain('bg-emerald-500')
  })

  it('should render options for pendente status', async () => {
    const wrapper = mount(ItemEgresso, {
      props: {
        id: 1,
        idEgresso: 1,
        nome: 'Nome',
        dataCadastro: '2023-05-01',
        status: 'pendente',
        foto: 'urlFoto',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.find('#status').classes()).toContain('bg-amber-500')
  })

  it('should render options for incompleto status', async () => {
    const wrapper = mount(ItemEgresso, {
      props: {
        id: 1,
        idEgresso: 1,
        nome: 'Nome',
        dataCadastro: '2023-05-01',
        status: 'incompleto',
        foto: 'urlFoto',
        email: 'email@teste.com'
      }
    })
    expect(wrapper.find('#status').classes()).toContain('bg-indigo-800')
  })
})
