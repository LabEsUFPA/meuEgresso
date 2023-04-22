import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import ProfilePage from '../pages/PerfilEgresso.vue'

describe('PerfilEgresso Page Test', () => {
  it('PerfilEgresso rendering test', () => {
    const wrapper = mount(ProfilePage)
    expect(wrapper.vm).toBeDefined()
    console.log(wrapper.vm.CustomInput)
  })
})
