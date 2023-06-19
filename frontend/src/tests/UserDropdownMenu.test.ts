import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import UserDropdownMenu from 'src/components/UserDropdownMenu.vue'
import { beforeEach, describe, expect, it } from 'vitest'

describe('UserDropdownMenu', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('should toggle menu visibility', () => {
    const wrapper = mount(UserDropdownMenu)
    expect(wrapper.vm.userMenuIsOpen).toBe(false)
    wrapper.vm.toggleUserMenu()
    expect(wrapper.vm.userMenuIsOpen).toBe(true)
    wrapper.vm.toggleUserMenu()
    expect(wrapper.vm.userMenuIsOpen).toBe(false)
  })

  it('should render button', () => {
    const wrapper = mount(UserDropdownMenu)
    expect(wrapper.find('button').exists()).toBe(true)
  })

  it('should mount dropdown menu', () => {
    const wrapper = mount(UserDropdownMenu)
    expect(wrapper.get('#dropdown'))
  })

  it('should open dropdown menu', async () => {
    const wrapper = mount(UserDropdownMenu)
    await wrapper.trigger('click')
    expect(wrapper.get('#dropdown').isVisible()).toBe(true)
  })
})
