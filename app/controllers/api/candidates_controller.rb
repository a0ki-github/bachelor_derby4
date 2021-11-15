class Api::CandidatesController < ApplicationController
  before_action :authenticate!

  def index
    candidates = Candidate.all
    render json: candidates
  end

  def best3
    render json: Candidate.best3
  end
end
