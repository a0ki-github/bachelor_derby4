<template lang="pug">
  #top.container
    TheRules
    TheStatus(v-if="authUser")      
    TheVotes
    UserForms
    TheTwitterShareButton
</template>

<script>
import TheRules from '../../components/TheRules.vue'
import TheVotes from '../../components/TheVotes.vue'
import UserForms from '../../components/UserForms.vue'
import TheStatus from '../../components/TheStatus.vue'
import TheTwitterShareButton from '../../components/TheTwitterShareButton.vue'
import { mapGetters } from 'vuex'
export default {
  name: 'TopIndex',
  components: {
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
