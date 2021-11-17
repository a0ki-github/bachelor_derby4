import Vue from 'vue'
import VueRouter from 'vue-router'
import TopIndex from '../pages/top/index.vue'
import LoginIndex from '../pages/login/index.vue'
import RegisterIndex from '../pages/register/index.vue'
import BettingIndex from '../pages/betting/index.vue'
import TermsIndex from '../pages/terms/index.vue'
import PrivacyPolicyIndex from '../pages/privacy_policy/index.vue'
import store from '../store'

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
    {
      path: '/register',
      component: RegisterIndex,
      name: 'RegisterIndex'
    },
    {
      path: '/login',
      component: LoginIndex,
      name: 'LoginIndex'
    },
    {
      path: '/bettings',
      component: BettingIndex,
      name: 'BettingIndex',
      meta: { requireAuth: true }
    },
    {
      path: '/terms',
      component: TermsIndex,
      name: 'TermsIndex'
    },
    {
      path: '/privacy_policy',
      component: PrivacyPolicyIndex,
      name: 'PrivacyPolicyIndex'
    }
  ]
})

router.beforeEach((to, from, next) =>{
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requireAuth) && !authUser) {
      next({ name: 'LoginIndex' });
    } else {
      next();
    }
  }),
  history.pushState(from, '')
})

export default router