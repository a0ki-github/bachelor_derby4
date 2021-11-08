import Vue from 'vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required } from 'vee-validate/dist/rules'
import axios from './axios'

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

const veevalidates = [
  extend('required', {
    ...required,
    message: '{_field_}は必須項目です'
  }),
  extend('min', {
    validate(value, { length }) {
      return value.length >= length;
    },
    params: ['length'],
    message: '{_field_}は{length}文字以上で入力してください'
  }),
  extend('max', {
    validate(value, { length }) {
      return value.length <= length;
    },
    params: ['length'],
    message: '{_field_}は{length}文字以下で入力してください'
  }),
  extend('password_confirmed', {
    validate(value, { target }) {
      return value === target
    },
    params: ['target'],
    message: 'パスワードと一致しません'
  }),
  extend('uniqueness', {
    validate(value, { values }) {
      return values.indexOf(value) === -1;
    },
    params: ['values'],
    message: '既に存在するニックネームです'
  })
]
