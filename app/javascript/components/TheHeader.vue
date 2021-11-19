<template lang="pug">
  header.mb-auto
    nav.navbar.navbar-expand.navbar-dark.bg-dark.justify-content-between
      router-link(
        :to="{name: 'TopIndex'}"
        class="navbar-brand mx-3 fs-3 fw-bold"
      ) BachelorDerby4
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
    async handleLogoutUser() {
      await this.logoutUser()
      alert('ログアウトしました')
    }
  }
}
</script>