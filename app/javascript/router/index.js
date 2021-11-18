import Vue from 'vue'
import VueRouter from 'vue-router'
import TopIndex from '../pages/top/index.vue'
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

router.beforeEach((to, _from, next) =>{
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requireAuth) && !authUser) {
      next({ name: 'TopIndex' });
    } else {
      next();
    }
  }),
  history.pushState(null, '', null)
})

export default router