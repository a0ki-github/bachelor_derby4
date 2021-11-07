import Vue from 'vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required } from 'vee-validate/dist/rules'

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

const veevalidates = [
  extend('required', {
    ...required,
    message: '{_field_}は必須項目です'
  })
]

export default veevalidates