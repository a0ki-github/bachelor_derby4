class Api::CandidatesController < ApplicationController
  before_action :authenticate!

  def index
    candidates = Candidate.all
    render json: candidates
  end
end
