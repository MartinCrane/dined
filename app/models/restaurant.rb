class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :accounts, through: :favorites

  include YelpAPI


  def self.find_by_zipcode(zip)
      self.where(zip_code: zip)
  end

  def self.find_by_price(price)
    self.where(price: price)
  end





end
