class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :user_id
      t.integer :postal_code
      t.string :prefecture
      t.string :city
      t.integer :address
      t.string :buliding
      t.integer :phone_number
      t.timestamps
    end
  end
end
