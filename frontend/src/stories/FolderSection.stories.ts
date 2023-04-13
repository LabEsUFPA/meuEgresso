import type { Meta, StoryObj } from '@storybook/vue3'
import FolderSection from 'src/components/FolderSection.vue'
import 'src/style.scss'

const meta: Meta<typeof FolderSection> = {
  title: 'Folder Section',
  component: FolderSection
}

export default meta

type Story = StoryObj<typeof FolderSection>

export const Default: Story = {
  render: () => ({
    components: { FolderSection },
    template: `<FolderSection>
                <template #title>
                  <h1 class="text-lg text-cyan-800 font-semibold">
                    Lorem Ipsum...
                  </h1>
                </template>
                <template #default>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis gravida vulputate. Duis dictum ante vel purus rhoncus, sed
                  bibendum mauris malesuada. Pellentesque sodales eget urna vel vehicula. Donec egestas ipsum erat, eget efficitur ex congue in.
                  Quisque hendrerit, neque sed porta posuere, dui nisi semper felis, ac mollis erat tellus nec lorem. In interdum consequat est,
                  imperdiet lobortis tortor aliquet ut. Aenean ultrices nisi ut erat suscipit interdum accumsan vel nulla. Vivamus quis 
                  sollicitudin quam. Fusce aliquam ligula vel semper tristique. Maecenas a arcu tempus, imperdiet tellus ut, lacinia ante. Ut 
                  eu nibh ac mauris iaculis placerat id id est. Cras at ex sed lorem volutpat eleifend ac quis tortor. Curabitur mi justo, 
                  eleifend ac condimentum ut, consectetur nec arcu. Sed ac neque mattis, iaculis elit sed, scelerisque ligula. Quisque ut 
                  sollicitudin velit, ac gravida ex.

                  Etiam sit amet leo massa. Vivamus sapien lacus, luctus vel eros ac, eleifend iaculis lacus. Integer pulvinar lacus ante, ac
                  suscipit sem sollicitudin sit amet. Vivamus ornare turpis vitae viverra convallis. Praesent dapibus hendrerit velit non
                  blandit. Aliquam ac eros id augue accumsan euismod elementum sed mi. In condimentum tellus eu placerat mattis. Ut feugiat
                  maximus nulla, mollis sagittis massa tempor id. Maecenas viverra ipsum et quam cursus, sed tempor felis rhoncus. Aliquam nec
                  laoreet magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer metus
                  neque, porttitor in tempus eget, pulvinar sit amet orci.
                </template>
              </FolderSection>`
  }),
}
