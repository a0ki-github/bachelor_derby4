<template lang="pug">
  #top.container
    TheRules

    div.my-5
      template(v-if="authUser")
        template(v-if="authUser.current_candidate")
          .d-inline-block.m-4
            | 現在のポイント
            h3 {{ authUser.points }}P
          .d-inline-block.m-4
            | 現在のBET
            h3 {{ authUser.current_candidate.name }}
          TheYoutube(
            id="topIframe"
            :youtube_url="authUser.current_candidate.youtube_url"
            class="d-block m-auto"
          )
        template(v-else)
          span まだBETはありません。
        br
        router-link(
          :to="{ name: 'BettingIndex' }"
          class="btn btn-dark m-3 router-link-active"
        ) BET
      template(v-else)
        template(v-if="userRegisterd")
          LoginForm(@switch-form="switchForm")
        template(v-else)
          RegisterForm(@switch-form="switchForm")
    h3.my-3 みんなの予想ランキング
    template(v-for="candidate in candidates")
      p {{ summary(candidate) }} {{ candidate.votes }}票
    TheTwitterShareButton
</template>

<script>
import TheRules from '../../components/TheRules.vue'
import RegisterForm from '../../components/RegisterFrom.vue'
import LoginForm from '../../components/LoginForm.vue'
import TheYoutube from '../../components/TheYoutube.vue'
import TheTwitterShareButton from '../../components/TheTwitterShareButton.vue'
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'TopIndex',
  components: {
    TheRules,
    RegisterForm,
    LoginForm,
    TheYoutube,
    TheTwitterShareButton
  },
  data() {
    return {
      userRegisterd: false
    }
  },
  created() {
    this.fetchCandidates()
  },
  computed: {
    ...mapGetters('users', ['authUser']),
    ...mapGetters('candidates', ['candidates', 'summary'])
  },
  methods: {
    ...mapActions('candidates', ['fetchCandidates']),
    switchForm() {
      this.userRegisterd = !this.userRegisterd
    }
  }
}
</script>
