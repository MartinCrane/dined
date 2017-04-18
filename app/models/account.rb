class Account < ApplicationRecord
  has_many :favorites
  has_many :restaurants, through: :favorites

  validates :email, presence: true, uniqueness: true, length: {maximum: 75}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {in: 8..50}

  has_secure_password

  def self.from_token(token)
    account_id = Auth.decode(token)["account_id"]
    Account.find(account_id)
  end

  def self.authenticate(email, password)
    account = Account.find_by(email: email)
    account && account.authenticate(password)
  end

end
