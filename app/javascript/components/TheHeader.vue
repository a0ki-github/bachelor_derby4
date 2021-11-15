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
        li.nav-item.active
          p.text-white.m-2.d-inline-block {{ authUser.name }}
          a(@click="handleLogoutUser")
            router-link(
              :to="{ name: 'TopIndex' }"
              class="nav-link text-white"
              @click="handleLogoutUser"
            ) ログアウト
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters('users', ['authUser'])
  },
  methods: {
    ...mapActions('users', ['logoutUser']),
    handleLogoutUser() {
      this.logoutUser()
    }
  }
}
</script>