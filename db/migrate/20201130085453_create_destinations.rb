class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :buy_id,               foreign_key: true
      t.string :postal_code,            null: false
      t.integer :shipment_source_id,    null: false
      t.string :city,                   null: false
      t.string :address,                null: false
      t.string :building
      t.string :phone_number,           null: false
      t.timestamps
    end
  end
end
