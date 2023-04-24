import { mount } from '@vue/test-utils';
import { describe, expect, it } from 'vitest'
import ButtonEdit from 'src/components/ButtonEdit.vue';

describe('ButtonEdit Test', () => {
  it('ButtonEdit label render test', () => {
    const wrapper = mount(ButtonEdit, {
      props: {
        label: 'Salvar',
      },
    });
    expect(wrapper.find('button').text()).toBe('Salvar');
  });

  it('ButtonEdit expected to emit a toggle event on button click test', async () => {
    const wrapper = mount(ButtonEdit);
    await wrapper.find('button').trigger('click');
    expect(wrapper.emitted('toggle')).toBeTruthy();
  });

  it('ButtonEdit expected to use the correct class when isInput prop is true', () => {
    const wrapper = mount(ButtonEdit, {
      props: {
        isInput: false,
      },
    });
    expect(wrapper.find('button').classes('bg-sky-700')).toBe(true);
  });


  it('ButtonEdit expected to use the correct class when isInput prop is false', () => {
    const wrapper = mount(ButtonEdit, {
      props: {
        isInput: true,
      },
    });
    expect(wrapper.find('button').classes('bg-emerald-600')).toBe(true);
  });
});
