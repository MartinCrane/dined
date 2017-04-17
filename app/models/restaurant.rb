class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :accounts, through: :favorites

  include YelpAPI

end
