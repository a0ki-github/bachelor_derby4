<template lang="pug">
  #login-form.container.w-75
    .h3.mb-3.text-center ログイン
    ValidationObserver(v-slot="{ handleSubmit }")
      .form-group.my-2
        ValidationProvider(
          v-slot="{ errors }"
          rules="required|max:255"
        )
          label(for="name") ニックネーム
          input(
            id="name"
            v-model="user.name"
            type="text"
            name="ニックネーム"
            class="form-control"
          )
          span.text-danger {{ errors[0] }}
      .form-group.my-2
        ValidationProvider(
          v-slot="{ errors }"
          rules="required|min:3"
        )
          label(for="password") パスワード
          input(
            id="password"
            v-model="user.password"
            type="password"
            name="パスワード"
            class="form-control"
          )
          span.text-danger {{ errors[0] }}
      button(
        type="submit"
        class="btn btn-primary my-3 d-block mx-auto"
        @click.prevent="handleSubmit(loginUser)"
      ) ログイン
</template>

<script>
export default {
  name: 'LoginIndex',
  data() {
    return {
      user: {
        name: '',
        password: ''
      },
      authUser: null
    }
  },
  methods: {
    async loginUser() {
      const sesseionsResponse = await this.$axios.post('sessions', this.user)
      localStorage.auth_token = sesseionsResponse.data.token
      this.$axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.auth_token}`

      const userResponse = await this.$axios.get('users/me')
      this.authUser = userResponse.data

      this.$router.push
    }
  }
}
</script>