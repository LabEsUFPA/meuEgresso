export default [
  {
    path: '/',
    component: async () => await import('src/components/HeaderAndFooter.vue'),
    children: [
      { path: '/', component: async () => await import('src/pages/HomePage/HomePage.vue') },
      { path: '/entrar', component: async () => await import('src/pages/PaginaLogin/PaginaLogin.vue') },
      {
        path: '/cadastro',
        component: async () => await import ('src/components/HeaderAndFooter.vue'),
        children: [
          { path: '/', component: async () => await import ('src/pages/CadastroEgresso/CadastroEgresso.vue') }, // Redirecionar para /cadastro/egresso por padrão
          {
            path: '/egresso',
            component: async () => await import ('src/pages/CadastroEgresso/CadastroEgresso.vue'),
            meta: {
              shouldNotForce: true,
              requiresAuthAdmin: true,
              allowedScopes: ['EGRESSO']
            }
          },
          { path: '/perfil', component: async () => await import ('src/pages/CadastroPerfil/CadastroPerfil.vue') },
          {
            path: '/admin',
            component: async () => await import ('src/pages/CadastroAdmin/CadastroAdmin.vue'),
            meta: {
              requiresAuthAdmin: true,
              allowedScopes: ['ADMIN', 'SECRETARIO']
            }
          },
          {
            path: '/anuncio',
            component: async () => await import ('src/pages/CadastroAnuncio/CadastroAnuncio.vue'),
            meta: {
              requiresAuth: true
            }
          }
        ]
      },
      {
        path: '/admin',
        meta: {
          requiresAuthAdmin: true,
          allowedScopes: ['ADMIN', 'SECRETARIO']
        },
        children: [
          { path: '/', component: async () => await import ('src/pages/PainelAdmin/PainelAdmin.vue') },
          {
            path: '/painel',
            component: async () => await import ('src/pages/PainelAdmin/PainelAdmin.vue'),
            children: [
              {
                path: '/email',
                component: async () => await import ('src/pages/EmailAdmin/EmailAdmin.vue')
              },
              {
                path: '/registro',
                component: async () => await import ('src/pages/RegistroEgressos/RegistroEgressos.vue')
              },
              {
                path: '/notificacoes',
                component: async () => await import ('src/pages/NotificacoesAdmin/NotificacoesAdmin.vue')
              }
            ]
          }

        ]
      },
      {
        path: '/egresso/:id?',
        component: async () => await import ('src/pages/PerfilEgresso/PerfilEgresso.vue')
      },
      {
        path: '/conta-egresso',
        component: async () => await import ('src/pages/EdicaoContaEgresso/EdicaoContaEgresso.vue'),
        meta: {
          requiresAuth: true
        }
      },
      {
        path: '/conta-admin',
        component: async () => await import ('src/pages/EdicaoContaAdmin/EdicaoContaAdmin.vue'),
        meta: {
          requiresAuth: true
        }
      },
      {
        path: '/graficos',
        component: async () => await import ('src/pages/PaginaGraficos/PaginaGraficos.vue')
      },
      {
        path: '/vagas',
        component: async () => await import ('src/pages/FeedVagas/FeedVagas.vue'),
        children: [
          {
            path: '/:id',
            component: async () => await import ('src/pages/AnuncioVaga/AnuncioVaga.vue')
          }
        ]
      },

      {
        path: '/redefinir-senha',
        component: async () => await import ('src/pages/RedefinirSenha/RedefinirSenha.vue')
      }
    ]
  },
  { path: '/:pathMatch(.*)*', component: async () => await import ('src/pages/PageNotFound/PageNotFound.vue') }
]
