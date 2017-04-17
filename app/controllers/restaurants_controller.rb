class RestaurantsController < ApplicationController
  def index

    restaurant = Restaurant.find(params[:id])
    render json: restaurant
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant, serializer: RestaurantApiSerializer
  end

  def zip_view
    id = params[:id].to_i
    restaurant = Restaurant.find_by_zipcode(id)
    render json: restaurant, each_serializer: RestaurantApiSerializer
  end

end
