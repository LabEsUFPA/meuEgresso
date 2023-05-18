<template>
    <Form
      ref="form"
      @submit="handleSubmit"
      @invalid-submit="onInvalid"
      :validation-schema="schema"
    >
      <div class="flex w-full justify-center bg-gradient-to-b from-sky-200 to-indigo-200">
        <div class="flex justify-strech w-[960px] border-2 border-b-0 border-white rounded-tl-2xl rounded-tr-2xl py-8 mt-10 mx-6 shadow-md">
          <h1 class="text-cyan-800 text-3xl font-bold">
            <SvgIcon
              type="mdi"
              size="50"
              class="ml-10 mr-5 inline"
              :path="mdiBullhorn"
            />
            Feed de anúncios
          </h1>
          <CustomButton type="submit" color="emerald">
                Anuncie uma vaga
                <SvgIcon
              type="mdi"
              size="24"
              class="ml-5 inline"
              :path="mdiArrowRight"
            />
            </CustomButton>
        </div>
      </div>
      <div class="w-full flex items-center justify-center bg-neutral-100 mb-10 ">
        <div
          v-if="!submitSuccess"
          class="flex flex-col items-center bg-white w-[960px] py-10 mx-6 rounded-bl-2xl rounded-br-2xl shadow-md"
        >
          <InvalidInsert
            :text="errorText"
            :show-alert="error"
          />
  
          <div class="mb-8 mx-4 sm:mx-0">
            <div class="flex flex-col gap-y-4 sm:gap-y-6">
                <CustomInput
                  class="w-full"
                  name="pesquisar"
                  label=""
                  placeholder="Pesquisar"
                  :icon-path="mdiSearchWeb"
                  :required="true"
                />
                <CustomButton type="submit" color="blue">
                    Buscar
                </CustomButton>
          </div>
        </div>
       </div>
      </div>
    </Form>
  
    <CustomDialog v-model="submitSuccess">
      <div class="h-full flex justify-center items-center">
        <div class="w-1/2">
          <div class="text-green-500 text-center mb-3">
            <SvgIcon
              type="mdi"
              size="100"
              class="inline"
              :path="mdiCheckCircle"
            />
          </div>
          <h1 class="text-blue-900 text-center text-2xl font-semibold mb-8">
            Dados atualizados com sucesso!
          </h1>
        </div>
      </div>
    </CustomDialog>
  
  </template>
  
  <script setup lang="ts">
  
  import { ref, watch, onMounted } from 'vue'
  import SvgIcon from '@jamescoyle/vue-icon'
  import CustomInput from 'src/components/CustomInput.vue'
  import CustomButton from 'src/components/CustomButton.vue'
  import CustomDialog from 'src/components/CustomDialog.vue'
  import InvalidInsert from 'src/components/InvalidInsert.vue'
  import { Form } from 'vee-validate'
  import { object, string, date, ref as refYup } from 'yup'
  import { mdiCheckCircle, mdiBullhorn, mdiLink, mdiArrowRight, mdiSearchWeb } from '@mdi/js'

  
  
  
  const form = ref<typeof Form | null>(null)
  const titulo = ref('')
  const area = ref('')
  const dataExpiracao = ref('')
  const salario = ref('')
  const contato = ref('')
  const descricao = ref('')
  
  
  
  let dataAnuncioPost = {
      id: 0,
      titulo: "",
      area: "",
      dataExpiracao: "",
      salario: "",
      contato: "",
      descricao:"",
  }
  const error = ref(false)
  
  const errorMessages = ref({
    errorRequest: 'Requisição não aceita',
    userNotFound: 'Usuario não cadastrado pela faculdade'
  })
  
  const errorText = ref('')
  const submitSuccess = ref(false)
  
  const schema = object().shape({
    titulo: string().required(),
    area: string().required(),
    dataExpiracao: date().required(),
    salario: string().required(),
    contato: string().required(),
    descricao: string().required(),
  })
  
 // const $store = useAnuncioVagaStore()
  
  
  //Post Usuario
  const handleSubmit = async (submitData: any) => {
    /*const responseValidation = await $store.cadastraAnuncio({
      titulo:dataAnuncioPost.titulo,
      area:dataAnuncioPost.area,
      dataExpiracao:dataAnuncioPost.dataExpiracao.toString(),
      salario:dataAnuncioPost.salario,
      contato:dataAnuncioPost.contato,
      descricao:dataAnuncioPost.descricao
    })
  
    if (responseValidation===201) {
      error.value = false
      console.log("Usuário atualizado: " + responseValidation)
      submitSuccess.value = true
    }
   */
  }
  const onInvalid = (e: any) => {
    console.log(e)
  }
  
  
  onMounted(() => {
    console.log("onMounted front iniciado...")
    watch(titulo, () => {
      console.log("watch front titulo:", titulo.value)
      form.value?.setFieldValue('titulo', titulo.value)
    })
    watch(area, () => {
      console.log("watch front area:", area.value)
      form.value?.setFieldValue('area', area.value)
    })
    watch(dataExpiracao, () => {
      console.log("watch front dataExpiracao:", dataExpiracao.value)
      form.value?.setFieldValue('dataExpiracao', dataExpiracao.value)
    })
    watch(salario, () => {
      console.log("watch front salario:", salario.value)
      form.value?.setFieldValue('salario', salario.value)
    })
    watch(contato, () => {
      console.log("watch front contato:", contato.value)
      form.value?.setFieldValue('contato', contato.value)
    })
    watch(descricao, () => {
      console.log("watch front descricao:", descricao.value)
      form.value?.setFieldValue('descricao', descricao.value)
    })
  
  })
  </script>