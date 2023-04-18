export default [
  { path: '/', component: () => import('../pages/HomePage.vue') },
  { path: '/test', component: () => import('../pages/RouterTest.vue') },
  { path: '/entrar', component: () => import('../pages/PaginaLogin.vue') },
  { path: '/cadastro-perfil', component: () => import('../pages/CadastroPerfil.vue') },
  { path: '/cadastro-admin', component: () => import('../pages/CadastroAdmin.vue') }
]
