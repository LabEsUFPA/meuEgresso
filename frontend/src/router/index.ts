import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'

const router = createRouter({
  history: createWebHistory(),
  scrollBehavior () {
    // always scroll to top
    return { top: 0 }
  },
  routes
})

router.beforeEach((to) => {
  const loggedUser = JSON.parse(localStorage.getItem('loggedUser') ?? '{}')
  try {
    if (to.meta.requiresAuth === true && loggedUser.grupos[0].nomeGrupo !== 'ADMIN') {
      return {
        path: '/'
      }
    }
  } catch {
    return {
      path: '/'
    }
  }
})

export default router
