export default [
  { path: '/', component: () => import('../pages/HomePage.vue') },
  { path: '/test', component: () => import('../pages/RouterTest.vue') },
  { path: '/login', component: () => import('../pages/LoginPage.vue') },
  { path: '/register', component: () => import('../pages/RegisterPage.vue') },
  { path: '/admin-register', component: () => import('../pages/AdminRegistrationPage.vue') }
]
