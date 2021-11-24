<template lang="pug">
  #top.container
    template(v-if="authUser")
      TheStatus
      BettingButton
      TheVotes
      BettingButton
      TheRules
      TwitterShareProposal
    template(v-else)
      TopImage
      StartButton
      TheRules
      StartButton
      TheVotes
      UserForms
    TwitterShareButton
</template>

<script>
import TopImage from '../../components/TopImage.vue'
import TheRules from '../../components/TheRules.vue'
import TheVotes from '../../components/TheVotes.vue'
import StartButton from '../../components/StartButton.vue'
import UserForms from '../../components/UserForms.vue'
import TheStatus from '../../components/TheStatus.vue'
import BettingButton from '../../components/BettingButton.vue'
import TwitterShareButton from '../../components/TwitterShareButton.vue'
import TwitterShareProposal from '../../components/TwitterShareProposal.vue'
import { mapGetters } from 'vuex'
export default {
  name: 'TopIndex',
  components: {
    TopImage,
    TheRules,
    TheVotes,
    StartButton,
    UserForms,
    TheStatus,
    BettingButton,
    TwitterShareProposal,
    TwitterShareButton
  },
  computed: {
    ...mapGetters('users', ['authUser'])
  }
}
</script>
