<template lang="pug">
  #top.container
    template(v-if="authUser")
      TheStatus
      TheVotes
      TheRules
    template(v-else)
      TopImage
      TheRules
      TheVotes
      UserForms
    TheTwitterShareButton
</template>

<script>
import TopImage from '../../components/TopImage.vue'
import TheRules from '../../components/TheRules.vue'
import TheVotes from '../../components/TheVotes.vue'
import UserForms from '../../components/UserForms.vue'
import TheStatus from '../../components/TheStatus.vue'
import TheTwitterShareButton from '../../components/TheTwitterShareButton.vue'
import { mapGetters } from 'vuex'
export default {
  name: 'TopIndex',
  components: {
    TopImage,
    TheRules,
    TheVotes,
    UserForms,
    TheStatus,
    TheTwitterShareButton
  },
  computed: {
    ...mapGetters('users', ['authUser'])
  }
}
</script>
