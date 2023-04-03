import type { Meta, StoryObj } from '@storybook/vue3'
import 'src/style.css'

import HelloWorld from 'components/HelloWorld.vue'
import { RouterLink } from 'vue-router';

const meta: Meta<typeof HelloWorld> = {
  /* 👇 The title prop is optional.
   * See https://storybook.js.org/docs/7.0/vue/configure/overview#configure-story-loading
   * to learn how to generate automatic titles
   */
  title: 'Hello World',
  component: HelloWorld,
};

export default meta;
type Story = StoryObj<typeof HelloWorld>;

/*
 *👇 Render functions are a framework specific feature to allow you control on how the component renders.
 * See https://storybook.js.org/docs/7.0/vue/api/csf
 * to learn how to use render functions.
 */
export const Primary: Story = {
  render: () => ({
    components: { HelloWorld, RouterLink },
    template: '<HelloWorld msg="Hello, World!" />',
  }),
};
