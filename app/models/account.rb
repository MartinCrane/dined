class Account < ApplicationRecord
  has_many :favorites
  has_many :restaurants, through: :favorites

  validates :email, presence: true, uniqueness: true, length: {maximum: 75}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {in: 8..50}

  has_secure_password
end
