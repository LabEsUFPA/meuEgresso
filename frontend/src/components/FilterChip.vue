<template>
    <button class="flex gap-3 px-4 py-2 rounded-3xl items-center text-indigo-800 bg-indigo-600/30 font-medium">
        <p class="text-sm">{{ title }}</p>
        <Icon icon="ic:round-close" width="16" height="16"/>
    </button>
</template>

<script setup lang="ts">

import { Icon } from '@iconify/vue';

defineProps<{
    title: string
}>()

</script>