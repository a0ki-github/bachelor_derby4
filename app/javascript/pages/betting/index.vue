<template lang="pug">
  #betting-form.container.w-75.text-center
    img.w-100(src="~betting.svg")
    .fw-bold.text-white(style="font-size: 72px")
      | BET
    p.text-white.pb-5 新たにBETする候補者を選択してください
    template(v-for="candidate in except_current_candidates")
      .text-white.py-5(@click="handleShowBettingCreateModal(candidate)")
        h2.card-title.fw-bold {{ summary(candidate) }}
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
import 'betting.svg'
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
    scrollTo(0, 0)
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