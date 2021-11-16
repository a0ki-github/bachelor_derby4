<template lang="pug">
  iframe(
    :src="`https://www.youtube-nocookie.com/embed/${identifier(youtube_url)}`"
    width="auto"
    flameboarder="0"
    allow="encrypted-media; fullscreen"
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