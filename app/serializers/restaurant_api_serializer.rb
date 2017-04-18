class RestaurantApiSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :price, :yelp_id, :latitude, :longitude, :image_url, :address, :city, :state, :country, :zip_code
end
