require 'byebug'
class FavoritesController < ApplicationController

  def add_favorites
    account = @current_account
    restaurant_id = request.body.read
    restaurant = Restaurant.find_by(yelp_id: restaurant_id)
    account.restaurants << restaurant
  end

  def delete_favorites
    account = @current_account
    restaurant_id = request.body.read
    restaurant = Restaurant.find_by(yelp_id: restaurant_id)
    account.restaurants.delete(restaurant)
  end

  def retrieve_favorites
    account = @current_account
    render json: account.restaurants.all, each_serializer: RestaurantApiSerializer
  end

end
