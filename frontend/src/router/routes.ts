import HeaderAndFooter from 'src/components/HeaderAndFooter.vue'
import HomePage from 'src/pages/HomePage/HomePage.vue'
import PaginaLogin from 'src/pages/PaginaLogin/PaginaLogin.vue'
import CadastroEgresso from 'src/pages/CadastroEgresso/CadastroEgresso.vue'
import CadastroPerfil from 'src/pages/CadastroPerfil/CadastroPerfil.vue'
import CadastroAdmin from 'src/pages/CadastroAdmin/CadastroAdmin.vue'
import CadastroAnuncio from 'src/pages/CadastroAnuncio/CadastroAnuncio.vue'
import NotificacoesAdmin from 'src/pages/NotificacoesAdmin/NotificacoesAdmin.vue'
import PerfilEgresso from 'src/pages/PerfilEgresso/PerfilEgresso.vue'
import EdicaoConta from 'src/pages/EdicaoConta/EdicaoConta.vue'
import PaginaGraficos from 'src/pages/PaginaGraficos/PaginaGraficos.vue'
import FeedVagas from 'src/pages/FeedVagas/FeedVagas.vue'
import EmailAdmin from 'src/pages/EmailAdmin/EmailAdmin.vue'
import AnuncioVaga from 'src/pages/AnuncioVaga/AnuncioVaga.vue'
import PainelAdmin from 'src/pages/PainelAdmin/PainelAdmin.vue'
import RegistroEgressos from 'src/pages/RegistroEgressos/RegistroEgressos.vue'
import RedefinirSenha from 'src/pages/RedefinirSenha/RedefinirSenha.vue'
import PageNotFound from 'src/pages/PageNotFound/PageNotFound.vue'

export default [
  {
    path: '/',
    component: HeaderAndFooter,
    children: [
      { path: '/', component: HomePage },
      { path: '/entrar', component: PaginaLogin },
      {
        path: 'cadastro',
        redirect: '/',
        children: [
          {
            path: 'egresso',
            component: CadastroEgresso,
            meta: {
              shouldNotForce: true,
              requiresAuthAdmin: true,
              allowedScopes: ['EGRESSO']
            }
          },
          { path: 'perfil', component: CadastroPerfil },
          {
            path: 'admin',
            component: CadastroAdmin,
            meta: {
              requiresAuthAdmin: true,
              allowedScopes: ['ADMIN', 'SECRETARIO']
            }
          },
          {
            path: 'anuncio',
            component: CadastroAnuncio,
            meta: {
              requiresAuth: true
            }
          }
        ]
      },
      {
        path: 'admin',
        redirect: '/',
        children: [
          {
            path: 'painel',
            component: PainelAdmin,
            meta: {
              requiresAuthAdmin: true,
              allowedScopes: ['ADMIN', 'SECRETARIO']
            }
          },
          {
            path: 'email',
            component: EmailAdmin,
            meta: {
              requiresAuthAdmin: true,
              allowedScopes: ['ADMIN', 'SECRETARIO']
            }
          },
          {
            path: 'registro',
            component: RegistroEgressos,
            meta: {
              requiresAuthAdmin: true,
              allowedScopes: ['ADMIN', 'SECRETARIO']
            }
          },
          {
            path: 'notificacoes',
            component: NotificacoesAdmin,
            meta: {
              requiresAuthAdmin: true,
              allowedScopes: ['ADMIN', 'SECRETARIO']
            }
          }
        ]
      },
      {
        path: 'egresso/:id?',
        component: PerfilEgresso
      },
      {
        path: 'conta',
        component: EdicaoConta,
        meta: {
          requiresAuth: true
        }
      },
      {
        path: 'graficos',
        component: PaginaGraficos
      },
      {
        path: '/vagas/:id',
        component: AnuncioVaga
      },
      {
        path: '/vagas',
        component: FeedVagas
      },
      {
        path: '/redefinir-senha',
        component: RedefinirSenha
      }
    ]
  },
  { path: '/:pathMatch(.*)*', component: PageNotFound }
]
