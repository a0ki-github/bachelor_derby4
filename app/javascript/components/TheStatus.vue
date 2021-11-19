<template lang="pug">
  #status.text-center.my-5
    h1.text-center.fw-bold.text-white 成績
    template(v-if="authUser.current_candidate")
      .row.row-cols-3
        .card.my-5.m-auto
          .card-body
            .card-title 現在のポイント
            h1.card-text.fw-bold {{ authUser.points }}P
      .text-white
        span 現在のBET
        h3.fw-bold
          | {{ authUser.current_candidate.name }} ({{authUser.current_candidate.age}})
          br
          | {{ authUser.current_candidate.title }}
      TheYoutube(:youtube_url="authUser.current_candidate.youtube_url")
    template(v-else)
      span まだBETはありません。
    br
    router-link(
      :to="{ name: 'BettingIndex' }"
      class="btn btn-danger btn-lg m-3 router-link-active"
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