module Api::UserAuthenticator
  def current_user
    return @current_user if @current_user
    return unless bearer_token

    decoded_token = JWT.decode bearer_token, Rails.application.credentials.secret_key_base, false
    @current_user = User.find(decoded_token[0]['user_id'])
  end

  def authenticate!
    head :unauthorized unless current_user
  end

  def bearer_token
    pattern = /^Bearer /
    header = request.headers['Authorization']

    header.gsub(pattern, '') if header&.match(pattern)
  end
end