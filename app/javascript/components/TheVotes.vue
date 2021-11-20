<template lang="pug">
  #votes
    h1.text-center.fw-bold.text-white 得票数ランキング
    .row.row-cols-1.row-cols-md-2
      .col.m-auto
        .card.h-100.m-auto.text-center
          img(
            class="card-img-top w-50 m-auto"
            src="/assets/votes.svg"
          )
          .card-body.h-75
            template(v-for="candidate in candidates")
              p {{ summary(candidate) }} {{ candidate.votes }}票
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  created() {
    this.fetchCandidates()
  },
  computed: {
    ...mapGetters('candidates', ['candidates', 'summary'])
  },
  methods: {
    ...mapActions('candidates', ['fetchCandidates'])
  }
}
</script>