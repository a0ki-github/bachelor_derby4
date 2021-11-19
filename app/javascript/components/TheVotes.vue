<template lang="pug">
  #votes
    .row.row-cols-1.row-cols-md-2
      .card.h-100.d-block.m-auto
        img(
          class="card-img-top h-25"
          src="/assets/votes.svg"
        )
        .card-body.text-center.h-75
          h3.card-title.fw-bold 得票数ランキング
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