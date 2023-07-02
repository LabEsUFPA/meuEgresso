import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import PaginaLogin from 'src/pages/PaginaLogin/PaginaLogin.vue'

describe('PaginaLogin', () => {
  it('renders properly', () => {
    const wrapper = mount(PaginaLogin)
    expect(wrapper.vm).toBeDefined()
  })
})
