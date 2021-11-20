<template lang="pug">
  transition(name="fade")
    #contact
      .modal(@click.self="handleCloseModal")
        .modal-dialog
          .modal-content
            .modal-header
              h4.modal-title お問い合わせ
            .modal-body
              p お問い合わせはTwitterの
                a(
                  href="https://twitter.com/aoki_engineer"
                  target="_blank"
                ) @aoki_engineer
                | までDMをお願いいたします。
            .modal-footer
              button(
                type="button"
                class="btn btn-secondary"
                @click="handleCloseModal"
              ) 閉じる
      .modal-backdrop.show  
</template>

<script>
export default {
  name: 'TheContactModal',
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