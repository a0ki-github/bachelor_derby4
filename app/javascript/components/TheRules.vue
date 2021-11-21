<template lang="pug">
  #rules.my-5
    h1.text-center.fw-bold.text-white ルール
    .row.row-cols-1.row-cols-md-2.row-cols-lg-4.g-4
      .col
        .card.h-100
          img(
            class="card-img-top h-50"
            src="~coins.svg"
          )
          .card-body.h-50
            p.card-title.fw-bold 1、スタート
            p.card-text
              | 持ち点として100P付与されます。
              br
              .fw-bold ※初回放送開始後は時期に応じて減点があります。
      .col
        .card.h-100
          img(
            class="card-img-top h-50"
            src="~select.svg"
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
            src="~chilling.svg"
          )
          .card-body.h-50
            p.card-title.fw-bold 3、減点法
            p.card-text
              | 初回放送以降にBETを変更すると一回につき-10P、BETしたメンバーが脱落すると一回につき-20Pです。
              br
              | （つまり、先見の明があるユーザーにとっては放置ゲームとなります）
      .col
        .card.h-100
          img(
            class="card-img-top h-50"
            src="~winners.svg"
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
    .row.row-cols-1.row-cols-md-2.row-cols-lg-3.mt-5
      .col.m-auto
        blockquote.twitter-tweet
          a(href="https://twitter.com/BachelorJapan/status/1443893459471962134")
</template>

<script>
import 'coins.svg'
import 'select.svg'
import 'chilling.svg'
import 'winners.svg'
export default {
  mounted () {
    const script = document.createElement('script');
    script.src = "https://platform.twitter.com/widgets.js";
    document.body.appendChild(script);
  }
}
</script>