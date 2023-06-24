import { shallowMount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'
import CustomPieGraph from 'src/pages/PaginaGraficos/components/CustomPieGraph.vue'

describe('CustomPieGraph Test', () => {
  it('CustomPieGraph component rendering test', () => {
    const wrapper = shallowMount(CustomPieGraph)
    expect(wrapper.vm).toBeDefined()
  })
})
