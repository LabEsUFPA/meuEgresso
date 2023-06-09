import { shallowMount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomBarGraph from '../components/CustomBarGraph.vue'

describe('CustomBarGraph Test', () => {
  it('CustomBarGraph component rendering test', () => {
    const wrapper = shallowMount(CustomBarGraph)
    expect(wrapper.vm).toBeDefined()
  })
})
