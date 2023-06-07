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
  const loggedUser = JSON.parse(localStorage.getItem('loggedUser') ?? '{}')
  const userData = parseToken(storage.getToken())

  if (to.path !== '/cadastro' && userData !== null && !userData.isEgresso && !(to.meta?.shouldNotForce === true) && loggedUser.grupos[0].nomeGrupo === 'EGRESSO') {
    alert('É necessário realizar o cadastro completo para usar o sistema')
    return {
      path: '/cadastro'
    }
  } else if (to.path === '/cadastro' && loggedUser.grupos[0].nomeGrupo === 'EGRESSO' && userData !== null && userData.isEgresso) {
    console.log(from)
    return {
      path: from.path
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
