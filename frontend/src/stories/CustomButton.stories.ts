import type { Meta, StoryObj } from "@storybook/vue3"

import CustomButton from "src/components/CustomButton.vue"

const meta: Meta<typeof CustomButton> = {
  title: "Custom button",
  component: CustomButton,
  argTypes: {
    color: {
      options: {
        Sky: "sky",
        Blue: "blue",
        Red: "red",
        Green: "green",
        Emerald: "emerald",
        White: "white",
      },
      control: { type: "select" },
    },
    textClass: {
      control: { type: "text" },
      defaultValue: "text-white",
    },
    variant: {
      options: {
        Standard: "standard",
        Outlined: "outlined",
        Flat: "flat",
      },
      control: { type: "select" },
    },
    type: {
      options: ["submit", "reset", "button"],
      control: { type: "select" },
    },
  },
};

export default meta

type Story = StoryObj<typeof CustomButton>

export const Default: Story = {
  render: () => ({
    components: { CustomButton },
    slotcontent: "oi",
    template:
      '<CustomButton :text-class="textClass" :type="type" :variant="variant" :color="color">Botão</CustomButton>',
  }),
};
