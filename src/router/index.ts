import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/Home',
    component: () => import('@/views/Home.vue'),
    meta: { title: '自述文件' },
    children: [
      {
        path: '/Info',
        component: () => import('@/views/InfoPage.vue'),
        meta: { title: 'Info' }
      },
      {
        path: '/course',
        component: () => import('@/views/CoursePage.vue'),
        meta: { title: 'Course' }
      },
      {
        path: '/singerCourse',
        component: () => import('@/views/SingerCoursePage.vue'),
        meta: { title: 'SingerCourse' }
      },
      {
        path: '/score',
        component: () => import('@/views/ScorePage.vue'),
        meta: { title: 'Song' }
      },
      {
        path: '/exam',
        component: () => import('@/views/ExamPage.vue'),
        meta: { title: 'Exam' }
      },
      {
        path: '/music',
        component: () => import('@/views/ConsumerPage.vue'),
        meta: { title: 'Consumer' }
      },
      {
        path: '/Consumer',
        component: () => import('@/views/ConsumerPage.vue'),
        meta: { title: 'Consumer' }
      },
      // {
      //   path: '/song',
      //   component: () => import('@/views/SongPage.vue'),
      //   meta: { title: 'Song' }
      // },
      // {
      //   path: '/singer',
      //   component: () => import('@/views/SingerPage.vue'),
      //   meta: { title: 'Singer' }
      // },
      // {
      //   path: '/SongList',
      //   component: () => import('@/views/SongListPage.vue'),
      //   meta: { title: 'SongList' }
      // },
      // {
      //   path: '/ListSong',
      //   component: () => import('@/views/ListSongPage.vue'),
      //   meta: { title: 'ListSong' }
      // },
      // {
      //   path: '/Comment',
      //   component: () => import('@/views/CommentPage.vue'),
      //   meta: { title: 'Comment' }
      // },
      // {
      //   path: '/Collect',
      //   component: () => import('@/views/CollectPage.vue'),
      //   meta: { title: 'Collect' }
      // }
    ]
  },
  {
    path: '/',
    component: () => import('@/views/Login.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
