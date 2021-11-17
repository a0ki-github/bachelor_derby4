<template lang="pug">
  transition(name="fade")
    div(:id="`betting-create-modal-${candidate.id}`")
      .modal(@click.self="handleCloseModal")
        .modal-dialog
          .modal-content
            .modal-header
              h4.modal-title {{ candidate.name }}
              button(
                type="button"
                class="btn btn-danger"
                @click="handleCloseModal"
              ) x
            .modal-body
              TheYoutube(:youtube_url="candidate.youtube_url")
            .modal-footer
              button(
                type="button"
                class="btn btn-success"
                @click="handleCreateBetting(candidate.id)"
              ) BET
              button(
                type="button"
                class="btn btn-secondary"
                @click="handleCloseModal"
              ) 閉じる
      .modal-backdrop.show
</template>

<script>
import TheYoutube from '../../../components/TheYoutube.vue'
import { mapActions } from 'vuex'
export default {
  name: "BettingCreateModal",
  components: { TheYoutube },
  props: {
    candidate: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true
      },
      name: {
        type: String,
        required: true
      },
      age: {
        type: Number,
        required: true
      },
      title: {
        type: String,
        required: true
      }
    }
  },
  methods: {
    ...mapActions('users', ['createBetting']),
    handleCloseModal() {
      this.$emit('close-modal')
    },
    async handleCreateBetting(candidate_id) {
      if (new Date > new Date(2021, 10, 25, 22)) {
        if (window.confirm('-10Pとなりますが、よろしいですか？')) {
          this.createBetting(candidate_id)
          await this.$router.push({ name: 'TopIndex' })
          //YouTube更新のため。（ドメインの異なるiframeは操作できないため、ページごとリロード）
          window.location.reload()
        }
      } else {
        this.createBetting(candidate_id)
        await this.$router.push({ name: 'TopIndex' })
        window.location.reload()
      }
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  }
</style>