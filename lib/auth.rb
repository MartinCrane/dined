class Auth
  SECRET = Rails.application.secrets.jwt_secret
  ALGORITHM = 'HS256'

  def self.issue(payload)
    JWT.encode(payload, SECRET, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, SECRET, ALGORITHM).first
  end
end
