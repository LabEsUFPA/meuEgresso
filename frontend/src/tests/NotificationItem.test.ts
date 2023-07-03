import { mount } from '@vue/test-utils'
import NotificationItem from 'src/pages/NotificacoesAdmin/components/NotificationItem.vue'
import { describe, expect, it } from 'vitest'

describe('NotificationItem', () => {
  it('should render props', () => {
    const wrapper = mount(NotificationItem, {
      props: {
        nome: 'nome',
        usuarioId: 1,
        status: 'concluido',
        dataModificacao: 'dd/mm/aaaa'
      }

    })

    expect(wrapper.html()).toContain(1)
    expect(wrapper.html()).toContain(1)
    expect(wrapper.html()).toContain('nome')
    expect(wrapper.html()).toContain('dd/mm/aaaa')
  })
})
