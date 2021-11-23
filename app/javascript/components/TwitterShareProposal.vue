<template lang="pug">
  transition(name="fade")
    TwitterShareModal(
      v-if="isVisibleTwitterShareModal && authUser.current_candidate"
      @close-modal="handleCloseTwitterShareModal"
    )
</template>

<script>
import { mapGetters } from 'vuex'
import TwitterShareModal from './TwitterShareModal.vue'
export default {
  name: 'TwitterShareProposal',
  components: { TwitterShareModal },
  data() {
    return {
      isVisibleTwitterShareModal: true
    }
  },
  computed: {
    ...mapGetters('users', ['authUser'])
  },
  methods: {
    handleCloseTwitterShareModal() {
      this.isVisibleTwitterShareModal = false
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
