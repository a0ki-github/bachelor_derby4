<template lang="pug">
  header.mb-auto
    nav.navbar.navbar-expand.navbar-dark.bg-dark.justify-content-between
      router-link(
        :to="{name: 'TopIndex'}"
        class="navbar-brand mb-0 h1"
      ) バチェラーダービー4
      ul(
        v-if="authUser"
        class="navbar-nav"
      )
        li
          p.text-white.m-2 {{ authUser.name }}
        li(
          @click="handleLogoutUser"
          class="nav-item active"
        )
          router-link(
            :to="{ name: 'TopIndex' }"
            class="nav-link"
          ) ログアウト
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters(['authUser'])
  },
  methods: {
    ...mapActions(['logoutUser']),
    handleLogoutUser() {
      this.logoutUser()
    }
  }
}
</script>