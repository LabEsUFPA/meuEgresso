export default [
  { path: '/', component: () => import('pages/HomePage.vue') },
  { path: '/test', component: () => import('pages/RouterTest.vue') }
]