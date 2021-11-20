<template lang="pug">
  transition(name="fade")
    div(:id="`betting-create-modal-${candidate.id}`")
      .modal(@click.self="handleCloseModal")
        .modal-dialog
          .modal-content
            .modal-header
              h4.modal-title {{ candidate.name }}
            .modal-body
              p(
                v-if="minusPointsTarget"
                class="text-danger"
              ) -10Pとなります。よろしいですか？
              TheYoutube(
                :youtube_url="candidate.youtube_url"
                width-class="w-100"
              )
            .modal-footer
              button(
                type="button"
                class="btn btn-danger"
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
import { mapActions, mapGetters } from 'vuex'
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
  computed: {
    ...mapGetters('users', ['authUser']),
    minusPointsTarget() {
      return new Date > new Date(2021, 10, 25, 22) && this.authUser.bettings_count >1
    }
  },
  methods: {
    ...mapActions('users', ['createBetting']),
    handleCloseModal() {
      this.$emit('close-modal')
    },
    async handleCreateBetting(candidate_id) {
      this.createBetting(candidate_id)
      await this.$router.push({ name: 'TopIndex' })
      window.location.reload()
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  }
</style>