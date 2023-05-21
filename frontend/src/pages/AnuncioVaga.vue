<template>
    <DetailedPost :id="anuncio.id" :nome="anuncio.nome" :titulo="anuncio.titulo" :area="anuncio.area"
        :descricao="anuncio.titulo" :salario="anuncio.salario" />
</template>

<script setup lang="ts">

import { ref, watch } from 'vue';
import { onMounted } from 'vue';
import { useRoute } from 'vue-router'

import DetailedPost from 'src/components/DetailedPost.vue';

const $route = useRoute()
const { id } = $route.params;

interface Props {
    id: number,
    nome: string
    titulo: string
    area: string
    descricao: string
    salario: number
}

const defaultProps = {
    id: 0,
    nome: 'Nome Completo',
    titulo: 'Título da vaga',
    area: 'Área de emprego',
    descricao: 'Descrição da vaga',
    salario: 0
}


const anuncio = ref(defaultProps)

const fetchAnuncio = (id: number) => {
    return anuncios[1]
}

onMounted(() => {
    anuncio.value = fetchAnuncio(Number(id))

    console.log(anuncio.value)
    
})

const anuncios = [
    {
        id: 1,
        nome: 'Victor Silva',
        titulo: 'Vaga Front-end',
        area: 'Programador',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        salario: 1000.0,
    },
    {
        id: 2,
        nome: 'Marcus Loureiro',
        titulo: 'Vaga Back-end',
        area: 'Programador',
        descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        salario: 1200.0,
    }
]

</script>