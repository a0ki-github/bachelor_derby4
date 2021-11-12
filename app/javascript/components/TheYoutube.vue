<template lang="pug">
  iframe(
    :src="`https://www.youtube-nocookie.com/embed/${identifier(youtube_url)}`"
    width="560"
    height="315"
    flameboarder="0"
    allow="encrypted-media; autoplay; fullscreen"
    class="d-block m-auto"
  )
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  props: {
    youtube_url: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapGetters('candidates', ['identifier'])
  }
}
</script>