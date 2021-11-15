<template lang="pug">
  #top.container
    h3.mt-3 ルール
    ul
      li ユーザーは登録時に100Pが付与され、<br> バチェラー参加女性1名にBET。
      li BETするメンバーは変更可能だが、 <br> 番組開始(11/25 22:00)後は1回につき-10P
      li 各放送日時点で脱落メンバーにBETしているユーザー、または誰にもBETしていないユーザーには-20P
      li 番組終了時に得点上位者を発表
    .text-center.mt-5(v-if="authUser")
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
      ) BET
    .text-center(v-else)
      router-link(
        :to="{ name: 'LoginIndex' }"
        class="btn btn-dark m-3 router-link-active"
      ) ログイン
      router-link(
        :to="{ name: 'RegisterIndex' }"
        class="btn btn-dark m-3 router-link-active"
      ) ユーザー登録
</template>

<script>
import TheYoutube from '../../components/TheYoutube.vue'
import { mapGetters } from 'vuex'
export default {
  name: 'TopIndex',
  components: { TheYoutube },
  computed: {
    ...mapGetters('users', ['authUser']),
    ...mapGetters('candidates', ['summary'])
  }
}
</script>