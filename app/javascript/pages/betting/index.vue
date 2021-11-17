<template lang="pug">
  #betting-form.container.w-75
    .h1.mb-5.text-center BET
    .h5.mb-5.text-center(v-if="authUser.current_candidate")
      | 現在のBET
      h3.mb-5 {{ summary(authUser.current_candidate) }}
      div(
        v-for="candidate in except_current_candidates"
        @click="handleShowBettingCreateModal"
      )
        h5.mt-5 {{ summary(candidate) }}
        img(
          :src="`//i.ytimg.com/vi/${identifier(candidate.youtube_url)}/mqdefault.jpg`"
          width="100%"
        )
</template>

<script>
import TheYoutube from '../../components/TheYoutube.vue'
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'BettingIndex',
  components: { TheYoutube },
  data() {
    return {
      betting: {
        candidate_id: ''
      },
      isVisibleBettingCreateModal: false
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
    ...mapActions('users', ['createBetting']),
    ...mapActions('candidates', ['fetchCandidates']),
    handleShowBettingCreateModal() {
      this.isVisibleBettingCreateModal = true
    },
    async handleCreateBetting() {
      if (new Date > new Date(2021, 10, 25, 22)) {
        if (window.confirm('-10Pとなりますが、よろしいですか？')) {
          this.createBetting(this.betting)
          await this.$router.push({ name: 'TopIndex' })
          //YouTube更新のため。（ドメインの異なるiframeは操作できないため、ページごとリロード）
          window.location.reload()
        }
      } else {
        this.createBetting(this.betting)
        await this.$router.push({ name: 'TopIndex' })
        window.location.reload()
      }
    }
  }
}
</script>