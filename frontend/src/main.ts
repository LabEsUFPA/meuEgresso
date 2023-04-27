import { createApp, watch } from 'vue'
import App from './App.vue'
import router from './router'
import { vMaska } from 'maska'
import { createPinia } from 'pinia'
import './style.scss'

const pinia = createPinia()
createApp(App).use(router).use(pinia).directive("maska", vMaska).mount('#app')

watch(
    pinia.state,
    (state) => {
      localStorage.setItem("auth", JSON.stringify(state.auth));
    },
    { deep: true }
    );

