<template lang="pug">
  #youtube
    iframe(
      :src="`https://www.youtube-nocookie.com/embed/${identifier(youtube_url)}`"
      :class="widthClass"
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
    },
    widthClass: {
      type: String
    }
  },
  computed: {
    ...mapGetters('candidates', ['identifier'])
  }
}
</script>