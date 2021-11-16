<template lang="pug">
  a(
    target="_blank"
    rel="nofollow"
    :href="url"
  )
    i.fab.fa-twitter.fa-2x
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  data() {
    return {
      url: '',
      sentence: '',
      link: window.location.protocol + window.location.hostname,
      hashTags: 'バチェラー4,バチェラーダービー4'
    }
  },
  computed: {
    ...mapGetters('users', ['authUser']),
    ...mapGetters('candidates', ['summary'])
  },
  created() {
    this.renderURL()
  },
  methods: {
    renderURL() {
      if (this.authUser?.current_candidate) {
        this.sentence = `${this.summary(this.authUser.current_candidate)}にBETしました！%0a`
      } else {
        this.sentence = "バチェラー4の優勝予想をして、人を見る目を試そう！%0a"
      }
      this.url = `https://twitter.com/share?text=${this.sentence}&url=${this.link}&hashtags=${this.hashTags}`
    }
  }
}
</script>