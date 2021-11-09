class Api::SessionsController < ApplicationController
  def create
    user = login(params[:name], params[:password])
    if user
      token = user.create_token

      render json: { token: token }
    else
      head :unauthorized
    end
  end

  def destroy
    logout
  end
end
