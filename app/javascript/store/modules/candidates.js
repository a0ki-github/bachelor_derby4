import axios from "../../plugins/axios"

const candidates = {
  namespaced: true,
  state: {
    candidates: []
  },
  getters: {
    candidates: state => {
      return state.candidates
    },
    identifier: (_state) => (url) => {
      return url.split('/').slice(-1)
    }
  },
  mutations: {
    setCandidates(state, candidates) {
      state.candidates = candidates
    }
  },
  actions: {
    async fetchCandidates({ commit }) {
      const res = await axios.get('candidates')
      commit('setCandidates', res.data)
    }
  }
}

export default candidates