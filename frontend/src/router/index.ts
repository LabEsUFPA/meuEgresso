import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'
import LocalStorage from 'src/services/localStorage'
import { parseToken } from 'src/store/LoginStore'

const router = createRouter({
  history: createWebHistory(),
  routes
})

const storage = new LocalStorage()

router.beforeEach((to) => {
  const loggedUser = JSON.parse(localStorage.getItem('loggedUser') ?? '{}')
  const userData = parseToken(storage.getToken())

  if (userData !== null && !userData.isEgresso && !(to.meta?.shouldNotForce === true) && loggedUser.grupos[0].nomeGrupo === 'EGRESSO') {
    return {
      path: '/cadastro'
    }
  }

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
