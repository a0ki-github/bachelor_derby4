module JwtToken
  def create_token
    exp = Time.current + 1.month
    payload = { user_id: id, exp: exp.to_i }

    JWT.encode payload, nil, 'none'
  end
end