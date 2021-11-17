<template lang="pug">
  footer.text-center.mt-auto
    small お問い合わせ
    router-link(
      :to="{ name: 'TermsIndex' }"
      class="mx-2 text-decoration-none"
    )
      small.text-muted 利用規約
    router-link(
      :to="{ name: 'PrivacyPolicyIndex' }"
      class="mx-2 text-decoration-none"
    )
      small.text-muted プライバシー
    br
    small Copyright © 2021. BachelorDerby
</template>