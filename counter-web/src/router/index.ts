import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    component: () => import('@/views/Home.vue'),
    meta: { title: '自述文件' },
    children: [
      {
        path:'/',
        component: () => import('@/views/CounterPage.vue')
      },
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
        path: '/Commodity',
        component: () => import('@/views/CommodityPage.vue'),
        meta: { title: 'commodity' }
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
      },
      {
        path: '/Healthy',
        component: () => import('@/views/HealthyPage.vue'),
        meta: { title: 'healthy' }
      },
      {
        path: '/Evaluation',
        component: () => import('@/views/EvaluationPage.vue'),
        meta: { title: 'evaluation' }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
