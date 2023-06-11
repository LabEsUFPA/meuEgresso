import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import LoginPage from 'src/pages/PaginaLogin.vue'

describe('LoadingPage', () => {
  it('renders properly', () => {
    const wrapper = mount(LoginPage)
    expect(wrapper.vm).toBeDefined()
  })
})
