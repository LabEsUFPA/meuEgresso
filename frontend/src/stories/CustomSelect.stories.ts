import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'
import CustomSelect from 'src/components/CustomSelect.vue'
import 'src/style.scss'

const meta: Meta<typeof CustomSelect> = {
  title: 'Custom Select',
  component: CustomSelect,
  argTypes: {
    label: {
      control: { type: 'text' }
    }
  }
}

export default meta

type Story = StoryObj<typeof CustomSelect>

export const Default: Story = {
  render: () => ({
    setup: () => {
      const value = ref('')

      const options = ref(['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4'])

      return {
        value, options
      }
    },
    components: { CustomSelect },
    template: '<CustomSelect v-model="value" :options="options" />'
  })
}
