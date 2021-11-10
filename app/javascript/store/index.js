import Vue from 'vue'
import Vuex from 'vuex'
import users from './modules/users'
import candidates from './modules/candidates'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    users,
    candidates
  }
})

export default store