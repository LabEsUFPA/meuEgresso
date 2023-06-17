import { mount } from '@vue/test-utils'
import PageSelector from 'src/components/PageSelector.vue'
import { describe, expect, it } from 'vitest'

describe('PageSelector', () => {
  it('renders the correct number of buttons', () => {
    const wrapper = mount(PageSelector, {
      props: {
        currentPage: 0,
        totalPages: 5
      }
    })

    // Check the number of buttons when totalPages is less than or equal to 5
    const buttons = wrapper.findAll('button')
    expect(buttons.length).toBe(7)
  })

  it('emits the correct event when a button is clicked', async () => {
    const wrapper = mount(PageSelector, {
      props: {
        currentPage: 0,
        totalPages: 5
      }
    })

    const buttons = wrapper.findAll('button')
    await buttons[2].trigger('click') // Click the third button

    // Check if the emitted event has the correct payload
    const emittedEvent = wrapper.emitted('update:currentPage')
    expect(emittedEvent).toBeTruthy()
    if (emittedEvent != null) {
      expect(emittedEvent[0][0]).toBe(1) // Or any other expected value
    }
  })
})
