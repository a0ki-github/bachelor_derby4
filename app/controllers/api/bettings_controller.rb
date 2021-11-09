class Api::BettingsController < ApplicationController
  def create
    betting = current_user.bettings.new(betting_params)
    if betting.save
      render json: betting.candidate
    else
      render json: betting.errors, status: :bad_request
    end
  end

  private

  def betting_params
    params.require(:betting).permit(:candidate_id)
  end
end
