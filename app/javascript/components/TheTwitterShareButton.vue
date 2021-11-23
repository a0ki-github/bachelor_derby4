<template lang="pug">
  #twitter-share-button
    .text-center.my-4
      a(
        target="_blank"
        rel="nofollow"
        :href="url"
        :class="sizeClass"
      )
        i.fab.fa-twitter.fa-2x.text-danger
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  props: {
    sizeClass: {
      type: String
    }
  },
  data() {
    return {
      url: '',
      sentence: '',
      link: window.location.protocol + '//' + window.location.hostname,
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
        this.sentence = `${this.summary(this.authUser.current_candidate)}にBETしました！`
      } else {
        this.sentence = "バチェラー4の優勝予想をして、人を見る目を試そう！"
      }
      this.url = `https://twitter.com/share?text=${this.sentence}%0a&url=${this.link}%0a&hashtags=${this.hashTags}`
    }
  }
}
</script>