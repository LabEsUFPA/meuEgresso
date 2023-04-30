import type { Meta, StoryObj } from '@storybook/vue3'
import 'src/style.scss'

import CustomTextarea from 'src/components/CustomTextarea.vue'

const meta: Meta<typeof CustomTextarea> = {
  title: 'Custom Textarea',
  component: CustomTextarea,
  argTypes: {
    placeholder: {
      control: { type: 'text' },
      defaultValue: 'Placeholder'
    },

    label: {
      control: { type: 'text' },
      defaultValue: 'Label'
    }
  }
}

export default meta

type Story = StoryObj<typeof CustomTextarea>

export const Default: Story = {
  render: () => ({
    components: { CustomTextarea },
    template: '<CustomTextarea />'
  })
}
