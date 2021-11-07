<template lang="pug">
  div
    h3.text-center ルール
    ul
      li ユーザーは登録時に100Pが付与され、<br> バチェラー参加女性1名にBET。
      li BETするメンバーは変更可能だが、 <br> 番組開始(11/25 22:00)後は1回につき-10P
      li 各放送日時点で脱落メンバーにBETしているユーザー、または誰にもBETしていないユーザーには-20P
      li 番組終了時に得点上位者を発表
    .link.text-center
      router-link(
        class="btn btn-dark m-5 router-link-active"
        :to="{ name: 'LoginIndex' }"
      ) ログイン
      router-link(
        class="btn btn-dark m-5 router-link-active"
        :to="{ name: 'RegisterIndex' }"
      ) ユーザー登録
</template>