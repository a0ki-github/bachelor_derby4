<template lang="pug">
  #status.text-center.my-5
    h1.text-center.fw-bold.text-white 成績
    img.w-50(src="/assets/status.svg")
    template(v-if="authUser.current_candidate")
      .row.row-cols-1.row-cols-md-2
        .col.m-auto
          .card.my-5
            .card-body
              .card-title 現在のポイント
              h1.card-text.fw-bold {{ authUser.points }}P
      TheYoutube(:youtube_url="authUser.current_candidate.youtube_url")
      .text-white
        span 現在のBET
        h3.fw-bold
          | {{ authUser.current_candidate.name }} ({{authUser.current_candidate.age}})
          br
          | {{ authUser.current_candidate.title }}
    template(v-else)
      p.text-white まだBETはありません。
    .my-5
      img.w-25(src="/assets/betting.svg")
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