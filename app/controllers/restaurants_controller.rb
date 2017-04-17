class RestaurantsController < ApplicationController
  def index

    restaurant = Restaurant.find(params[:id])
    render json: restaurant
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant, serializer: RestaurantApiSerializer
  end

end
