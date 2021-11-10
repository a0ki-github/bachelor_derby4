<template lang="pug">
  #betting-form.container.w-75
    .h3.mb-3.text-center BET
    ValidationObserver(v-slot="{ handleSubmit }")
      .form-group
        ValidationProvider(
            v-slot="{ errors }"
            rules="required"
          )
          p.text-danger.my-3 {{ errors[0] }}
          template(v-for="candidate in except_current_candidates")
            input(
              type="radio"
              name="候補者"
              :id="candidate.id"
              :value="candidate.id"
              v-model="betting.candidate_id"
            )
            label(:for="candidate.id") {{ candidate.name }}({{ candidate.age }}) {{ candidate.title }}
            br
          p.text-danger.my-3 {{ errors[0] }}
      button(
        type="submit"
        class="btn btn-primary my-2 d-block mx-auto"
        @click.prevent="handleSubmit(createBetting)"
      ) BETする
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'BettingIndex',
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
    ...mapActions('candidates', ['fetchCandidates']),
    async createBetting() {
      const res = await this.$axios.post('bettings', { betting: this.betting })
      this.$router.push({ name: 'TopIndex' })
    }
  }
}
</script>