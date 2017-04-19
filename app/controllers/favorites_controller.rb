require 'byebug'
class FavoritesController < ApplicationController

  def add_favorites
    account_id = @current_account
    restaurant_id = 0

    account = Account.find_by_id(account_id)
    restaurant = Restaurant.find_by_id(restaurant_id)
    account.restaurants << restaurant

  end



end
