import { mount } from '@vue/test-utils'
import NotificationItem from 'src/components/NotificationItem.vue'
import { describe, expect, it } from 'vitest'

describe('NotificationItem', () => {
  it('should render props', () => {
    const wrapper = mount(NotificationItem, {
      props: {
        id: 1,
        idUsuario: 1,
        status: 'concluido',
        nomeUsuario: 'Nome',
        data: 'dd/mm/aaaa'
      }
    })

    expect(wrapper.html()).toContain(1)
    expect(wrapper.html()).toContain(1)
    expect(wrapper.html()).toContain('Nome')
    expect(wrapper.html()).toContain('dd/mm/aaaa')
  })
})
