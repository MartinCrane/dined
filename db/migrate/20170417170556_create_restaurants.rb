class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :rating
      t.integer :price
      t.string :yelp_id
      t.float :latitude
      t.float :longitude
      t.string :image_url
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code

      t.timestamps
    end
  end
end
