<template lang="pug">
  #betting-form.container.w-75
    .h1.mb-5.text-center BET
    .h5.mb-5.text-center 現在のBET： {{ authUser.current_candidate.name }}({{ authUser.current_candidate.age }}) {{ authUser.current_candidate.title }}
    ValidationObserver(v-slot="{ handleSubmit }")
      .form-group
        ValidationProvider(
            v-slot="{ errors }"
            rules="required"
          )
          p.text-danger.my-3 {{ errors[0] }}
          div(
            v-for="candidate in except_current_candidates"
            class="mb-5"
          )
            input(
              type="radio"
              name="候補者"
              :id="candidate.id"
              :value="candidate.id"
              v-model="betting.candidate_id"
            )
            label(
              :for="candidate.id"
              class="h5"
            ) {{ candidate.name }}({{ candidate.age }}) {{ candidate.title }}
            br
            TheYoutube(:youtube_url="candidate.youtube_url")
            br
          p.text-danger.my-3 {{ errors[0] }}
      button(
        type="submit"
        class="btn btn-primary my-2 d-block mx-auto"
        data-confirm="-10Pとなりますが、よろしいですか？"
        @click.prevent="handleSubmit(handleCreateBetting)"
      ) BETする
</template>

<script>
import TheYoutube from '../../components/TheYoutube.vue'
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'BettingIndex',
  components: { TheYoutube },
  data() {
    return {
      betting: {
        candidate_id: ''
      }
    }
  },
  created() {
    this.fetchCandidates();
  },
  computed: {
    ...mapGetters('candidates', ['candidates']),
    ...mapGetters('users', ['authUser']),
    except_current_candidates() {
      return this.candidates.filter(candidate => candidate.id != this.authUser.current_candidate.id )
    }
  },
  methods: {
    ...mapActions('users', ['createBetting']),
    ...mapActions('candidates', ['fetchCandidates']),
    async handleCreateBetting() {
      this.createBetting(this.betting)
      await this.$router.push({ name: 'TopIndex' })
      //YouTube更新のため。（ドメインの異なるiframeは操作できないため、ページごとリロード）
      window.location.reload()
    }
  }
}
</script>