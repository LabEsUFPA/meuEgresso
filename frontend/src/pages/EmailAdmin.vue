<template>
  <div class="flex flex-col">
    <div class="flex justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
      <div class="flex flex-col gap-4 sm:flex-row w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl p-6 sm:p-8 mt-10 mx-4 sm:mx-6 items-start sm:items-center justify-between">
        <div class="flex gap-6 text-cyan-800 items-center">
          <RouterLink
            to="/"
            class="flex items-center hover:bg-sky-600/20 rounded-md"
          >
            <div class="flex-1" />

            <SvgIcon
              type="mdi"
              size="32"
              class="inline"
              :path="mdiChevronLeft"
            />
          </RouterLink>

          <SvgIcon
            type="mdi"
            size="32"
            :path="mdiEmail"
            class="ml-2"
          />

          <h1 class="text-2xl sm:text-3xl font-bold ml-2 ">
            E-mail de atualização
          </h1>
        </div>
      </div>
    </div>
    <div class="flex flex-col gap-4 sm:gap-8 mb-5">
      <Form
        ref="form"
        @submit="handleSubmit"
        @invalid-submit="handleFail"
        :validation-schema="schema"
      >
        <div class="flex justify-center">
          <div class="flex flex-col w-[960px] bg-white rounded-bl-2xl rounded-br-2xl overflow-hidden mx-4 sm:mx-6">
            <div class="p-6 sm:p-8 container mx-auto items-start border-b ml-4 ">
              <h1 class=" w-[193%]">
                <h2 class="text-2xl font-semibold text-neutral-900">
                  Assunto
                </h2>
                <CustomInput
                  class="mt-1.5"
                  type="textarea"
                  name="assunto"
                />

                <div class="mt-10 mb-10">
                  <h2 class="text-2xl font-semibold text-neutral-900">
                    Conteúdo
                  </h2>

                  <CustomInput
                    class="mt-1.5"
                    type="textarea"
                    name="conteudo"
                  />
                </div>
              </h1>
              <div class="mt-10 mb-10 ">
                <h1 class="text-lg font-medium text-neutral-900 ml-1">
                  Data do próximo envio
                </h1>

                <CustomInput
                  class="mb-5 mt-1.5"
                  name="dataEnvio"
                  type="date"
                  required
                />
              </div>
            </div>
            <div class="flex flex-col items-start sm:flex-row justify-end gap-4 p-4 mt-10">
              <CustomButton variant="flat">
                Cancelar
              </CustomButton>

              <CustomButton
                color="emerald"
                type="submit"
              >
                Salvar
              </CustomButton>
            </div>
          </div>
        </div>
      </Form>
    </div>
  </div>
</template>

<script setup lang="ts">
import SvgIcon from '@jamescoyle/vue-icon'
import {
  mdiEmail,
  mdiChevronLeft

} from '@mdi/js'
import CustomButton from 'src/components/CustomButton.vue'
import CustomInput from 'src/components/CustomInput.vue'
// import { ref } from 'vue'
import { object, string } from 'yup'

async function handleSubmit (values: any) {
  console.log('sub')
}
async function handleFail (values: any) {
  console.log('fail')
}
// botar data no futuro
const schema = object().shape({
  assunto: string().required('Insira o Assunto do email'),
  conteudo: string().required('Insira o Conteudo do email'),
  dataEnvio: string().required('Insira no valida futuro para o envio do email').test('Data', 'Data inválida', (value) => {
    if (value) {
      const date = value.split('/').reverse().join('-') // Convert date to ISO format (YYYY-MM-DD)
      const inputDate = new Date(date)
      const minDate = new Date() // Use the current date as the minimum date

      return inputDate >= minDate
    }
    return true
  })
})
</script>
