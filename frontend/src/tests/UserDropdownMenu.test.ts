import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import UserDropdownMenu from 'src/components/UserDropdownMenu.vue'
import { beforeEach, describe, expect, it } from 'vitest'

describe('UserDropdownMenu', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('should render button', () => {
    const wrapper = mount(UserDropdownMenu, {
      props: {
        loggedIn: true
      }
    })
    expect(wrapper.find('button').exists()).toBe(true)
  })

  it('should render oruga dropdown', async () => {
    const wrapper = mount(UserDropdownMenu, {
      props: {
        loggedIn: true
      }
    })
    expect(wrapper.classes()).toContain('o-drop')
  })
})
