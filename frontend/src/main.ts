import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { vMaska } from 'maska'
import { createPinia } from 'pinia'
import './style.scss'
const pinia = createPinia()

createApp(App).use(router).use(pinia).directive("maska", vMaska).mount('#app')
