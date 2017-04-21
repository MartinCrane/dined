require 'byebug'
require 'json'
class FavoritesController < ApplicationController

  def add_favorites
    account = @current_account
    restaurant_id = request.body.read
    rest = JSON.parse(restaurant_id)
    rest.delete('distance')
    restaurant = Restaurant.find_by(yelp_id: rest["yelp_id"])
    restaurant ?  nil : restaurant = Restaurant.create(rest)
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
