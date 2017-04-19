class Favorite < ApplicationRecord
  belongs_to :account
  belongs_to :restaurant

  validates :account_id, uniqueness: {scope: :restaurant_id, message: "already exists"}
end
