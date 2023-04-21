import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import ProfilePage from '../pages/PerfilEgresso.vue'

describe('LoadingPage', () => {
  it('renders properly', () => {
    const wrapper = mount(ProfilePage)
    expect(wrapper.vm).toBeDefined()
  })

  it('renders properly', () => {
    const wrapper = mount(ProfilePage)
    console.log(wrapper.vm.CustomInput)
    console.log(wrapper.vm.CustomButtonLink)
    console.log(wrapper.vm.CustomPerfilData)
  })
})
