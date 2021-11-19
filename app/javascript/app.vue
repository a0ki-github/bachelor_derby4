<template lang="pug">
  .d-flex.flex-column.min-vh-100.bg-dark
    TheHeader
    router-view
    TheFooter
</template>

<script>
import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'

export default {
  components: {
    TheHeader,
    TheFooter
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
