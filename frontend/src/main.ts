import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { vMaska } from 'maska'
import { createPinia } from 'pinia'
import money from 'v-money3'
import '@oruga-ui/oruga-next/dist/oruga.css'
import './style.scss'
const pinia = createPinia()

createApp(App).use(router).use(money).use(pinia).directive('maska', vMaska).mount('#app')
