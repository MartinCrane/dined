class AccountRestaurant < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :account_id
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
