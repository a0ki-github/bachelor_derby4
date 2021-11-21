<template lang="pug">
  footer.text-center.mt-auto
    a(
      role="button"
      class="text-decoration-none text-muted"
      @click="handleShowContactModal"
    )
      small お問い合わせ
    router-link(
      :to="{ name: 'TermsIndex' }"
      class="mx-2 text-decoration-none"
    )
      small.text-muted 利用規約
    router-link(
      :to="{ name: 'PrivacyPolicyIndex' }"
      class="mx-2 text-decoration-none"
    )
      small.text-muted プライバシー
    br
    small Copyright © 2021. BachelorDerby
    transition(name="fade")
      ContactModal(
        v-if="isVisibleContactModal"
        @close-modal="handleCloseContactModal"
      )
</template>

<script>
import ContactModal from '../components/ContactModal.vue'
export default {
  components: { ContactModal },
  data() {
    return {
      isVisibleContactModal: false
    }
  },
  methods: {
    handleShowContactModal() {
      this.isVisibleContactModal = true
    },
    handleCloseContactModal() {
      this.isVisibleContactModal = false
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