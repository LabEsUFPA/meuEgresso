export default [
  {
    path: '/',
    component: () => import('src/components/HeaderAndFooter.vue'),
    children: [
      { path: '/', component: () => import('src/pages/HomePage.vue') },
      { path: '/test', component: () => import('src/pages/RouterTest.vue') },
      { path: '/entrar', component: () => import('src/pages/PaginaLogin.vue') },
      {
        path: '/cadastro',
        component: () => import('src/pages/CadastroEgresso.vue'),
      },
      {
        path: '/cadastro-perfil',
        component: () => import('src/pages/CadastroPerfil.vue'),
      },
      {
        path: '/cadastro-admin',
        component: () => import('src/pages/CadastroAdmin.vue'),
      },
    ],
  },
];

