export default [
  {
    path: '/',
    component: async () => await import('src/components/HeaderAndFooter.vue'),
    children: [
      { path: '/', component: async () => await import('src/pages/HomePage.vue') },
      { path: '/entrar', component: async () => await import('src/pages/PaginaLogin.vue') },
      {
        path: '/cadastro',
        component: async () => await import('src/pages/CadastroEgresso.vue'),
        meta: {
          shouldNotForce: true
        }
      },
      {
        path: '/cadastro-perfil',
        component: async () => await import('src/pages/CadastroPerfil.vue')
      },
      {
        path: '/cadastro-admin',
        component: async () => await import('src/pages/CadastroAdmin.vue'),
        meta: {
          requiresAuth: true
        }
      },
      {
        path: '/painel-admin',
        component: async () => await import('src/pages/PainelAdmin.vue'),
        meta: {
          requiresAuth: true
        }
      },
      {
        path: '/cadastro-anuncio',
        component: async () => await import('src/pages/CadastroAnuncio.vue')
      },
      {
        path: '/egresso',
        component: async () => await import('src/pages/PerfilEgresso.vue')
      },
      {
        path: '/egresso/:id',
        component: async () => await import('src/pages/PerfilEgresso.vue')
      },
      {
        path: '/conta-egresso',
        component: async () => await import('src/pages/EdicaoContaEgresso.vue')
      },
      {
        path: '/conta-admin',
        component: async () => await import('src/pages/EdicaoContaAdmin.vue')
      },
      {
        path: '/graficos',
        component: async () => await import('src/pages/PaginaGraficos.vue')
      },
      {
        path: '/vagas',
        component: async () => await import('src/pages/FeedVagas.vue')
      },
      {
        path: '/vagas/:id',
        component: async () => await import('src/pages/AnuncioVaga.vue')
      }
    ]
  },
  { path: '/:pathMatch(.*)*', component: async () => await import('src/pages/PageNotFound.vue') }
]
