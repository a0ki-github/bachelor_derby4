import Vue from 'vue'
import VueRouter from 'vue-router'
import TopIndex from '../pages/top/index.vue'
import LoginIndex from '../pages/login/index.vue'

Vue.config.productionTip = false
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: TopIndex,
      name: "TopIndex" 
    },
    // {
    //   path: '/register',
    //   component: RegisterIndex,
    //   name: 'RegisterIndex'
    // },
    {
      path: '/login',
      component: LoginIndex,
      name: 'LoginIndex'
    }
  ]
})

export default router