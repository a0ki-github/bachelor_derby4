<template lang="pug">
  #login-form.container.w-75
    .h3.mb-3.text-center ログイン
    ValidationObserver(v-slot="{ handleSubmit }")
      form
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
              autocomplete="username"
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
              autocomplete="current-password"
            )
            span.text-danger {{ errors[0] }}
        .text-center
          a(
            role="button"
            class="d-block"
            @click="handleSwitchForm"
          ) 新規登録＞
          button(
            type="submit"
            class="btn btn-primary m-2"
            @click.prevent="handleSubmit(handleLoginUser)"
          ) ログイン
          router-link(
            :to="{ name: 'TopIndex' }"
            class="btn btn-secondary m-2"
          ) 戻る
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'LoginIndex',
  data() {
    return {
      user: {
        name: '',
        password: ''
      }
    }
  },
  methods: {
    ...mapActions('users', ['loginUser']),
    handleSwitchForm() {
      this.$emit('switch-form')
    },
    async handleLoginUser() {
      try {
        await this.loginUser(this.user)
      } catch(error) {
        alert('ニックネームかパスワードが間違っています')
        console.log(error)
      }
    }
  }
}
</script>