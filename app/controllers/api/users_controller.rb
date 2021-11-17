class Api::UsersController < ApplicationController
  before_action :authenticate!, only: :me

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  def me
    render json: @current_user, methods: [:current_candidate, :points, :bettings_count]
  end

  def name_index
    render json: User.all.pluck(:name)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
