<template lang="pug">
  #register-form.container.w-75
    .h3.mb-3.text-center ユーザー登録
    .form-group.my-2
      label(for="name") ニックネーム
      input(
        id="name"
        v-model="user.name"
        type="text"
        name="ニックネーム"
        class="form-control"
      )
    .form-group.my-2
      label(for="password") パスワード
      input(
        id="password"
        v-model="user.password"
        type="password"
        name="パスワード"
        class="form-control"
      )
    .form-group.my-2
      label(for="password_confirmation") パスワード（確認）
      input(
        id="password_confirmation"
        v-model="user.password_confirmation"
        type="password"
        name="パスワード"
        class="form-control"
      )
    button(
      type="submit"
      class="btn btn-primary my-2 d-block mx-auto"
      @click="handleCreateUser"
    ) 登録
</template>

<script>
export default {
  name: 'RegisterIndex',
  data() {
    return {
      user: {
        name: '',
        password: '',
        password_confirmation: ''
      }
    }
  },
  methods: {
    async handleCreateUser() {
      try {
        await this.$axios.post('users', { user: this.user })
        this.$router.push('/login')
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>