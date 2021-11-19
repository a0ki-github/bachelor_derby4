<template lang="pug">
  #top.container
    #rules.my-5
      h1.text-center Rules
      .row.row-cols-1.row-cols-sm-2.row-cols-md-2.row-cols-lg-4.g-4
        .col
          .card.h-100
            img(
              class="card-img-top h-50"
              src="/assets/coins.svg"
            )
            .card-body.h-50
              p.card-title.fw-bold 1、スタート
              p.card-text 持ち点として100P付与されます。
        .col
          .card.h-100
            img(
              class="card-img-top h-50"
              src="/assets/betting.svg"
            )
            .card-body.h-50
              p.card-title.fw-bold 2、BET
              p.card-text
                | ユーザーはバチェラー参加女性1名にBETできます。
                br
                | 後から変更することも可能です。
        .col
          .card.h-100
            img(
              class="card-img-top h-50"
              src="/assets/chilling.svg"
            )
            .card-body.h-50
              p.card-title.fw-bold 3、減点法
              p.card-text
                | 初回放送以降にBETを変更すると-10P、BETしたメンバーが脱落すると-20Pです。
                br
                | （つまり先見の明があるユーザーにとって、このアプリは放置ゲームとなります）
        .col
          .card.h-100
            img(
              class="card-img-top h-50"
              src="/assets/winners.svg"
            )
            .card-body.h-50
              p.card-title.fw-bold 4、結果発表
              p.card-text
                | 番組終了後、開発者の
                a(
                  href="https://twitter.com/aoki_engineer"
                  target="_blank"
                ) @aoki_engineer
                | から得点上位者の発表をします。

    div.my-5
      template(v-if="authUser")
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
      template(v-else)
        template(v-if="userRegisterd")
          LoginForm(@switch-form="switchForm")
        template(v-else)
          RegisterForm(@switch-form="switchForm")
    h3.my-3 みんなの予想ランキング
    template(v-for="candidate in candidates")
      p {{ summary(candidate) }} {{ candidate.votes }}票
    TheTwitterShareButton
</template>

<script>
import RegisterForm from '../../components/RegisterFrom.vue'
import LoginForm from '../../components/LoginForm.vue'
import TheYoutube from '../../components/TheYoutube.vue'
import TheTwitterShareButton from '../../components/TheTwitterShareButton.vue'
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'TopIndex',
  components: {
    RegisterForm,
    LoginForm,
    TheYoutube,
    TheTwitterShareButton
  },
  data() {
    return {
      userRegisterd: false
    }
  },
  created() {
    this.fetchCandidates()
  },
  computed: {
    ...mapGetters('users', ['authUser']),
    ...mapGetters('candidates', ['candidates', 'summary'])
  },
  methods: {
    ...mapActions('candidates', ['fetchCandidates']),
    switchForm() {
      this.userRegisterd = !this.userRegisterd
    }
  }
}
</script>
