require 'byebug'
class FavoritesController < ApplicationController

  def add_favorites
    account = @current_account
    restaurant_id = 0
    restaurant = Restaurant.find_by_id(restaurant_id)
    account.restaurants << restaurant
  end

  def retrieve_favorites
    account = @current_account
    render json: account.restaurants.all, each_serializer: RestaurantApiSerializer
  end

end
