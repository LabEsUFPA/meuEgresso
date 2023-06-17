import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'
import LocalStorage from 'src/services/localStorage'

const router = createRouter({
  history: createWebHistory(),
  scrollBehavior () {
    // always scroll to top
    return { top: 0 }
  },
  routes
})

const storage = new LocalStorage()
router.beforeEach((to, from) => {
  const unauthenticatedUser = storage.get('loggedUser') === undefined
  const loggedUser = storage.getLoggedUser()
  if (to.meta.requiresAuth === true && unauthenticatedUser) {
    return {
      path: '/'
    }
  }

  if (to.path !== '/cadastro' && loggedUser !== null && !loggedUser.isEgresso && (to.meta?.shouldNotForce !== true) && loggedUser.scope === 'EGRESSO') {
    return {
      path: '/cadastro'
    }
  } else if (!unauthenticatedUser) {
    if (to.path === '/cadastro' && loggedUser !== null && loggedUser.scope === 'EGRESSO' && loggedUser.isEgresso) {
      return {
        path: from.path
      }
    }
  }

  try {
    if (to.meta.requiresAuthAdmin === true && loggedUser?.scope !== 'ADMIN') {
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
