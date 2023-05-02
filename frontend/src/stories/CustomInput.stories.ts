import type { Meta, StoryObj } from '@storybook/vue3'
import 'src/style.scss'

import CustomInput from 'src/components/CustomInput.vue'

const meta: Meta<typeof CustomInput> = {
  title: 'Custom Input',
  component: CustomInput,
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

type Story = StoryObj<typeof CustomInput>

export const Default: Story = {
  render: () => ({
    components: { CustomInput },
    template: '<CustomInput />'
  })
}
