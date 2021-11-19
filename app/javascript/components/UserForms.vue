<template lang="pug">
  #user-forms
    .card.h-100
      template(v-if="userRegisterd")
        LoginForm(
          @switch-form="switchForm")
      template(v-else)
        RegisterForm(@switch-form="switchForm")
</template>

<script>
import RegisterForm from './RegisterFrom.vue'
import LoginForm from './LoginForm.vue'
export default {
  components: {
    RegisterForm,
    LoginForm
  },
  data() {
    return {
      userRegisterd: false
    }
  },
  methods: {
    switchForm() {
      this.userRegisterd = !this.userRegisterd
    }
  }
}
</script>