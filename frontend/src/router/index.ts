import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'
import LocalStorage from 'src/services/localStorage'
import { parseToken } from 'src/store/LoginStore'

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
  const loggedUser = JSON.parse(storage.get('loggedUser') ?? '{}')
  const userData = parseToken(storage.getToken())
  if (to.meta.requiresAuth === true && unauthenticatedUser) {
    return {
      path: '/'
    }
  }

  if (to.path !== '/cadastro' && userData !== null && !userData.isEgresso && (to.meta?.shouldNotForce !== true) && loggedUser.scope === 'EGRESSO') {
    return {
      path: '/cadastro'
    }
  } else if (!unauthenticatedUser) {
    if (to.path === '/cadastro' && loggedUser.scope === 'EGRESSO' && userData !== null && userData.isEgresso) {
      return {
        path: from.path
      }
    }
  }

  try {
    if (to.meta.requiresAuthAdmin === true && loggedUser.scope !== 'ADMIN') {
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
