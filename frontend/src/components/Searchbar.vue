<template>
    <div class="flex w-full gap-2 items-center border-[1px] border-indigo-300 p-1 rounded-md"
        :class="{ ['border-[2px]']: searchbarFocused }">

        <Icon icon="material-symbols:search-rounded" width="24" height="24" class="text-indigo-300 ml-2" />

        <OField :rootClass="classNames(['flex h-full w-full'])">
            <OInput 
                override
                :v-model="refPesquisa" 
                expanded
                placeholder="Pesquisar vaga" :rootClass="classNames(['flex h-full w-full'])"
                :inputClass="classNames(['flex w-full h-full focus:outline-0 text-zinc-700'])"
                @focus="toggleSearchbarFocus()" @blur="toggleSearchbarFocus()"></OInput>


        </OField>
        <CustomButton type="submit" color="blue">
            Buscar
        </CustomButton>
    </div>
</template>

<script setup lang="ts">

import { Icon } from '@iconify/vue';
import { onMounted, ref, watch } from 'vue'
import { OField, OInput } from '@oruga-ui/oruga-next'
import classNames from 'classnames';

import CustomButton from 'src/components/CustomButton.vue'

interface Props {
    pesquisaValue: string
}

const props = withDefaults(defineProps<Props>(), {
    pesquisaValue: '',
})

const searchbarFocused = ref(false)

const toggleSearchbarFocus = () => {
    searchbarFocused.value = !searchbarFocused.value
}

const refPesquisa = ref('')

onMounted(() => {
    refPesquisa.value = props.pesquisaValue
    console.log(refPesquisa)

    watch(refPesquisa, ()=> {
        console.log(refPesquisa)
    })
})

</script>