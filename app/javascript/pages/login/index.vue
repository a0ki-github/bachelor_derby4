<template lang="pug">
  #login-form.container.w-75
    .h3.mb-3.text-center ログイン
    .form-group.my-2
      label(for="name") ニックネーム
      input(
        id="name"
        v-model="user.name"
        type="text"
        name="ニックネーム"
        placeholder="@"
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
    button(
      type="submit"
      class="btn btn-primary my-3 d-block mx-auto"
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
      }
    }
  }
}
</script>