require 'byebug'
class RestaurantsController < ApplicationController

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant, serializer: RestaurantApiSerializer
  end

  def zip_view
    id = params[:id].to_i
    restaurant = Restaurant.find_by_zipcode(id)

    render json: restaurant, each_serializer: RestaurantApiSerializer
  end

  def price_view
    id = params[:id].to_i
    restaurant = Restaurant.find_by_price(id)
    render json: restaurant, each_serializer: RestaurantApiSerializer
  end

  def rating_view
    id = params[:id].to_i
    restaurant = Restaurant.find_by_zipcode(id).order(rating: :desc)
    render json: restaurant, each_serializer: RestaurantApiSerializer
  end

end
