class Api::CandidatesController < ApplicationController
  before_action :authenticate!, only: :index

  def index
    candidates = Candidate.all
    render json: candidates, methods: [:votes]
  end

  def ranking
    render json: Candidate.best3
  end
end
