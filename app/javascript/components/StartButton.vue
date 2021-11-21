<template lang="pug">
  #start-button.text-center
    button(
      type="button"
      class="btn btn-danger btn-lg my-5"
      @click="handleScrollToUserForm"
    ) はじめる
</template>

<script>
export default {
  methods: {
    handleScrollToUserForm() {
      const userFormsPosition = document.getElementById('user-forms').offsetTop - 50
      scrollTo({top: userFormsPosition, behavior: 'smooth'})
    }
  }
}
</script>