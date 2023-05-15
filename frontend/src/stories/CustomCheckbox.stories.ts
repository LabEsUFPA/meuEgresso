import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'
import CustomCheckbox from 'src/components/CustomCheckbox.vue'
import 'src/style.scss'

const meta: Meta<typeof CustomCheckbox> = {
  title: 'Custom Checkbox',
  component: CustomCheckbox,
  argTypes: {
    label: {
      control: { type: 'text' }
    }
  }
}

export default meta

type Story = StoryObj<typeof CustomCheckbox>

export const Default: Story = {
  render: () => ({
    setup: () => {
      const value = ref(false)

      return {
        value
      }
    },
    components: { CustomCheckbox },
    template: '<CustomCheckbox v-model="value" />'
  })
}
