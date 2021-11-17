<template lang="pug">
  #betting-form.container.w-75
    .h1.mb-5.text-center BET
    .h5.mb-5.text-center(v-if="authUser.current_candidate")
      | 現在のBET
      h3.mb-5 {{ summary(authUser.current_candidate) }}
    template(v-for="candidate in except_current_candidates")
      .mt-5(@click="handleShowBettingCreateModal(candidate)")
        h5.mt-5 {{ summary(candidate) }}
        img(
          :src="`//i.ytimg.com/vi/${identifier(candidate.youtube_url)}/mqdefault.jpg`"
          width="100%"
        )
    transition(name="fade")
      BettingCreateModal(
        v-if="isVisibleBettingCreateModal"
        :candidate="bettingCandidate"
        @close-modal="handleCloseBettingCreateModal"
      )
</template>

<script>
import TheYoutube from '../../components/TheYoutube.vue'
import BettingCreateModal from './components/BettingCreateModal.vue'
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'BettingIndex',
  components: { TheYoutube, BettingCreateModal },
  data() {
    return {
      betting: {
        candidate_id: ''
      },
      isVisibleBettingCreateModal: false,
      bettingCandidate: {}
    }
  },
  created() {
    this.fetchCandidates();
  },
  computed: {
    ...mapGetters('candidates', ['candidates', 'summary', 'identifier']),
    ...mapGetters('users', ['authUser']),
    except_current_candidates() {
      if (this.authUser.current_candidate) {
        return this.candidates.filter(candidate => candidate.id != this.authUser.current_candidate.id )
      } else {
        return this.candidates
      }
    }
  },
  methods: {
    ...mapActions('candidates', ['fetchCandidates']),
    handleShowBettingCreateModal(candidate) {
      this.isVisibleBettingCreateModal = true;
      this.bettingCandidate = candidate;
    },
    handleCloseBettingCreateModal() {
      this.isVisibleBettingCreateModal = false;
    }
  }
}
</script>

<style scoped>
  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to {
    opacity: 0;
  }
</style>