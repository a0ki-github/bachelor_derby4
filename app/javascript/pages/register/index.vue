<template lang="pug">
  #register-form.container.w-75
    .h3.mb-3.text-center ユーザー登録
    ValidationObserver(v-slot="{ handleSubmit }")
      form
        .form-group.my-2
          ValidationProvider(
            v-slot="{ errors }"
            :rules="`required|max:255|uniqueness:${existing_names}`"
          )
            label(for="name") ニックネーム
            input(
              id="name"
              v-model="user.name"
              type="text"
              name="ニックネーム"
              class="form-control"
              autocomplete="username"
              @input="fetchExistingNames"
            )
            span.text-danger {{ errors[0] }}
            p.small.text-info
              | Twitterのユーザー名を登録すると、
              br
              | 上位者発表の際にメンションします。
        .form-group.my-2
          ValidationProvider(
            v-slot="{ errors }"
            rules="required|min:3"
            vid="password"
          )
            label(for="password") パスワード
            input(
              id="password"
              v-model="user.password"
              type="password"
              name="パスワード"
              class="form-control"
              autocomplete="new-password"
            )
            span.text-danger {{ errors[0] }}
        .form-group.my-2
          ValidationProvider(
            v-slot="{ errors }"
            rules="required|min:3|password_confirmed:@password"
          )
            label(for="password_confirmation") パスワード（確認）
            input(
              id="password_confirmation"
              v-model="user.password_confirmation"
              type="password"
              name="パスワード"
              class="form-control"
              autocomplete="new-password"
            )
            span.text-danger {{ errors[0] }}
        .text-center
          button(
            type="submit"
            class="btn btn-primary m-2"
            @click.prevent="handleSubmit(createUser)"
          ) 登録
          router-link(
            :to="{name: 'TopIndex'}"
            class="btn btn-secondary m-2 d-inline-block mx-auto"
          ) 戻る
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'RegisterIndex',
  data() {
    return {
      user: {
        name: '@',
        password: '',
        password_confirmation: ''
      },
      existing_names: []
    }
  },
  methods: {
    ...mapActions('users', ['loginUser']),
    async fetchExistingNames() {
      try {
        const res = await this.$axios.get('users/name_index')
        this.existing_names = res.data
      } catch (error) {
        console.log(error)
      }
    },
    async createUser() {
      try {
        await this.$axios.post('users', { user: this.user })
        await this.loginUser({ name: this.user.name, password: this.user.password })
        this.$router.push({ name: 'TopIndex' })
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>