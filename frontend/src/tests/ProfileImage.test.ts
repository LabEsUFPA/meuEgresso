import { mount } from '@vue/test-utils'
import { createPinia, setActivePinia } from 'pinia'
import { beforeEach, describe, expect, it } from 'vitest'
import ProfileImage from 'src/pages/PerfilEgresso/components/ProfileImage.vue'

describe('ProfileImage', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })
  it('renders default profile image when no imgUrl or file is provided', () => {
    const wrapper = mount(ProfileImage, {
      props: {
        imgDefault: 'default-image.jpg',
        imgUrl: '',
        isInput: false
      }
    })

    const defaultImage = wrapper.find('.defaultImage')
    expect(defaultImage.exists()).toBe(true)
    expect(defaultImage.attributes('src')).toBe('default-image.jpg')
  })

  it('renders profile image from imgUrl when imgUrl is provided', () => {
    const wrapper = mount(ProfileImage, {
      props: {
        imgDefault: 'default-image.jpg',
        isInput: false,
        imgUrl: 'user-image.jpg'
      }
    })

    const profileImage = wrapper.find('.profileImage')
    expect(profileImage.exists()).toBe(true)
    expect(profileImage.attributes('src')).toBe('user-image.jpg')
  })

  it('triggers the "remove" event when the remove button is clicked', async () => {
    const wrapper = mount(ProfileImage, {
      props: {
        imgDefault: 'default-image.jpg',
        isInput: true
      },
      data () {
        return {
          file: new File([], 'user-image.jpg')
        }
      }
    })

    const removeButton = wrapper.findComponent({ name: 'ButtonActionIcon' })
    await removeButton.trigger('click')

    expect(wrapper.emitted('remove')).toBeTruthy()
  })
})
