<template lang="pug">
  #status.text-center.my-5
    h1.text-center.fw-bold 成績
    template(v-if="authUser.current_candidate")
      .d-inline-block.m-4
        | 現在のポイント
        h3 {{ authUser.points }}P
      .d-inline-block.m-4
        | 現在のBET
        h3 {{ authUser.current_candidate.name }}
      TheYoutube(
        id="topIframe"
        :youtube_url="authUser.current_candidate.youtube_url"
        class="d-block m-auto"
      )
    template(v-else)
      span まだBETはありません。
    br
    router-link(
      :to="{ name: 'BettingIndex' }"
      class="btn btn-dark m-3 router-link-active"
    ) BET画面へ
</template>

<script>
import TheYoutube from './TheYoutube.vue'
import { mapGetters } from 'vuex'
export default {
  components: {
    TheYoutube
  },
  computed: {
  ...mapGetters('users', ['authUser'])
  }
}
</script>