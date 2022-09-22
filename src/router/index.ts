import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    component: () => import('@/views/Home.vue'),
    meta: { title: '自述文件' },
    children: [
      {
        path: '/Counter',
        component: () => import('@/views/CounterPage.vue'),
        meta: { title: 'counter' }
      },
      {
        path: '/Rate',
        component: () => import('@/views/RatePage.vue'),
        meta: { title: 'counter' }
      },
      {
        path: '/Base',
        component: () => import('@/views/BasePage.vue'),
        meta: { title: 'base' }
      },
      {
        path: '/Financial',
        component: () => import('@/views/FinancialPage.vue'),
        meta: { title: 'financial' }
      },
      {
        path: '/Unit',
        component: () => import('@/views/UnitPage.vue'),
        meta: { title: 'unit' }
      },
      {
        path: '/Function',
        component: () => import('@/views/FunctionPage.vue'),
        meta: { title: 'function' }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
