import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    authUser: null
  },
  getters: {
    authUser: state => {
      return state.authUser
    }
  },
  mutations: {
    setUser(state, user) {
      state.authUser = user
    }
  },
  actions: {
    async fetchAuthUser({ commit, state }) {
      if (!localStorage.auth_token) return null;
      if (state.authUser) return state.authUser;

      const userResponse = await axios.get('users/me')
        .catch((_err) => {
          return null
        })
      if (!userResponse) return null;

      const authUser = userResponse.data
      if (authUser) {
        commit('setUser', authUser)
        return authUser
      } else {
        commit('setUser', null)
        return null
      }
    },
    async loginUser({ commit }, user) {
      const sesseionsResponse = await axios.post('sessions', user)
      localStorage.auth_token = sesseionsResponse.data.token
      axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.auth_token}`

      const userResponse = await axios.get('users/me')
      commit('setUser', userResponse.data)
    },
    async logoutUser({ commit }) {
      commit('setUser', null)
      localStorage.removeItem('auth_token')
      axios.defaults.headers.common['Authorization'] = ''
    }
  }
})

export default store