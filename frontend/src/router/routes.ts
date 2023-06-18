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
          shouldNotForce: true,
          requiresAuthAdmin: true,
          allowedScopes: ['EGRESSO']
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
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/cadastro-anuncio',
        component: async () => await import('src/pages/CadastroAnuncio.vue'),
        meta: {
          requiresAuth: true
        }
      },
      {
        path: '/notificacoes-admin',
        component: async () => await import('src/pages/NotificacoesAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
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
        path: '/email',
        component: async () => await import('src/pages/EmailAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/vagas/:id',
        component: async () => await import('src/pages/AnuncioVaga.vue')
      },
      {
        path: '/painel-admin',
        component: async () => await import('src/pages/PainelAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/registro-egressos',
        component: async () => await import('src/pages/RegistroEgressos.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: 'redefinir-senha',
        component: async () => await import('src/pages/RedefinirSenha.vue')
      }
    ]
  },
  { path: '/:pathMatch(.*)*', component: async () => await import('src/pages/PageNotFound.vue') }
]
