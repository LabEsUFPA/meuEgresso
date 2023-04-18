export default [
  { path: '/', component: () => import('../pages/HomePage.vue') },
  { path: '/test', component: () => import('../pages/RouterTest.vue') },
  { path: '/login', component: () => import('../pages/PaginaLogin.vue') },
  { path: '/register', component: () => import('../pages/CadastroPerfil.vue') },
  { path: '/admin-register', component: () => import('../pages/CadastroAdmin.vue') }
]
