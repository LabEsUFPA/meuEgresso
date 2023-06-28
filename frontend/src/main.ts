import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { vMaska } from 'maska'
import { createPinia } from 'pinia'
import money from 'v-money3'
import '@oruga-ui/oruga-next/dist/oruga.css'
import '@oruga-ui/oruga-next/dist/oruga-full.css'
import '@mdi/font/css/materialdesignicons.min.css'
import './style.scss'
import VueScrollTo from 'vue-scrollto'
const pinia = createPinia()

createApp(App).use(router).use(money).use(pinia).use(VueScrollTo).directive('maska', vMaska).mount('#app')
