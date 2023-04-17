export default [
  {
    path: '/',
    component: () => import('src/components/HeaderAndFooter.vue'),
    children: [
      { path: '/', component: () => import('src/pages/HomePage.vue') },
      { path: '/test', component: () => import('src/pages/RouterTest.vue') },
      { path: '/cadastro', component: () => import('src/pages/CadastroEgresso.vue')}
    ]
  }
]
