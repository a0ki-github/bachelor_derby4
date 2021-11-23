<template lang="pug">
  transition(name="fade")
    #contact
      .modal(@click.self="handleCloseModal")
        .modal-dialog
          .modal-content
            .modal-header
              h4.modal-title Twitterシェア
            .modal-body
              p.fw-bold あなたのBETをTwitterでシェアすると開発者からめちゃくちゃ感謝されます。
              TheTwitterShareButton(size-class="fa-2x")
              img.w-100(src="~pray.svg")
            .modal-footer
              button(
                type="button"
                class="btn btn-secondary"
                @click="handleCloseModal"
              ) シェアしない
      .modal-backdrop.show
</template>

<script>
import 'pray.svg'
import TheTwitterShareButton from './TheTwitterShareButton.vue'
export default {
  name: '',
  components: { TheTwitterShareButton },
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  }
</style>