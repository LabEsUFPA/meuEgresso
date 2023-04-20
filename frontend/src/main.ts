import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { vMaska } from 'maska'
import './style.scss'
createApp(App).use(router).directive("maska", vMaska).mount('#app')

