export default [
  {
    path: '/',
    component: async () => await import('src/components/HeaderAndFooter.vue'),
    children: [
      { path: '/', component: async () => await import('src/pages/HomePage/HomePage.vue') },
      { path: '/entrar', component: async () => await import('src/pages/PaginaLogin/PaginaLogin.vue') },
      {
        path: '/cadastro',
        component: async () => await import('src/pages/CadastroEgresso/CadastroEgresso.vue'),
        meta: {
          shouldNotForce: true,
          requiresAuthAdmin: true,
          allowedScopes: ['EGRESSO']
        }
      },
      {
        path: '/cadastro/:id',
        component: async () => await import('src/pages/CadastroEgresso/CadastroEgresso.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['SECRETARIO', 'ADMIN']
        }
      },
      {
        path: '/cadastro-perfil',
        component: async () => await import('src/pages/CadastroPerfil/CadastroPerfil.vue')
      },
      {
        path: '/cadastro-admin',
        component: async () => await import('src/pages/CadastroAdmin/CadastroAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/cadastro-anuncio',
        component: async () => await import('src/pages/CadastroAnuncio/CadastroAnuncio.vue'),
        meta: {
          requiresAuth: true
        }
      },
      {
        path: '/notificacoes-admin',
        component: async () => await import('src/pages/NotificacoesAdmin/NotificacoesAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/egresso',
        component: async () => await import('src/pages/PerfilEgresso/PerfilEgresso.vue')
      },
      {
        path: '/egresso/:id',
        component: async () => await import('src/pages/PerfilEgresso/PerfilEgresso.vue')
      },
      {
        path: '/conta-egresso',
        component: async () => await import('src/pages/EdicaoContaEgresso/EdicaoContaEgresso.vue')
      },
      {
        path: '/conta-admin',
        component: async () => await import('src/pages/EdicaoContaAdmin/EdicaoContaAdmin.vue')
      },
      {
        path: '/graficos',
        component: async () => await import('src/pages/PaginaGraficos/PaginaGraficos.vue')
      },
      {
        path: '/vagas',
        component: async () => await import('src/pages/FeedVagas/FeedVagas.vue')
      },
      {
        path: '/email',
        component: async () => await import('src/pages/EmailAdmin/EmailAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/vagas/:id',
        component: async () => await import('src/pages/AnuncioVaga/AnuncioVaga.vue')
      },
      {
        path: '/painel-admin',
        component: async () => await import('src/pages/PainelAdmin/PainelAdmin.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: '/registro-egressos',
        component: async () => await import('src/pages/RegistroEgressos/RegistroEgressos.vue'),
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        }
      },
      {
        path: 'redefinir-senha',
        component: async () => await import('src/pages/RedefinirSenha/RedefinirSenha.vue')
      }
    ]
  },
  { path: '/:pathMatch(.*)*', component: async () => await import('src/pages/PageNotFound/PageNotFound.vue') }
]
