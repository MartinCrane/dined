require 'byebug'
class RestaurantsController < ApplicationController

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant, serializer: RestaurantApiSerializer
  end

  def yelpApiSearch
    yelp_api = Restaurant.new
    token = regex_parse(params[:id])
    results = yelp_api.customSearch(token)
    render json: results
  end

  private

  def regex_parse(string)
    string_array = string.split("@$@$@")
    token = {}
    ix = 0
    while ix < string_array.length
      token[string_array[ix]] = string_array[ix+1]
      ix += 2
    end
    token
  end

end
