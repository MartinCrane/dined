require 'byebug'

namespace :update_db do
  desc "pull information from JSON file and update DB"
  task :seed_restaurant_api => :environment do
    require 'open-uri'
    require 'json'

    neighborhood_zips =
    [10453, 10457, 10460, 11205,
      11217, 11231, 11201, 11215, 11220,
      11232, 11206, 11221, 11237, 10026,
      10027, 10030, 10037, 10039, 10001,
      10011, 10018, 10019, 10020, 10036,
      10010, 10016, 10017, 10022, 10012,
      10013, 10014, 10004, 10005, 10006,
      10007, 10038, 10280, 10002, 10003,
      10009, 10021, 10028, 10044, 10065,
      10075, 10128, 10023, 10024, 10025]

      counter = 0

      neighborhood_zips.uniq.each do |zip|
        api = Restaurant.new
        search = api.search("restaurant","#{zip}")

        search['businesses'].each do |result|
          name = result['name']
          rating = result['rating']
          price = result.key?("price") ? result['price'].length : nil
          yelp_id = result['id']
          latitude = result['coordinates']['latitude']
          longitude = result['coordinates']['longitude']
          image_url = result.key?("image_url") ? result['image_url'] : nil
          address = result['location']['display_address'].join(', ')
          city = result['location']['city']
          state = result['location']['state']
          country = result['location']['country']
          zip_code = result['location']['zip_code']

          Restaurant.where(yelp_id: yelp_id).first_or_create({name: name, rating: rating, price: price, yelp_id: yelp_id, latitude: latitude, longitude: longitude, image_url: image_url, address: address, city: city, state: state, country: country, zip_code: zip_code})

          counter += 1
          print "\r #{counter}"
        end
      end
    end
  end
