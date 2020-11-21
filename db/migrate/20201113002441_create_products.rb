class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                null: false
      t.integer :user_id,            foreign_key: true
      t.integer :genre_id,           null: false
      t.integer :price,              null: false
      t.integer :status_id,          null: false
      t.integer :shipment_charge_id, null: false
      t.integer :shipment_source_id, null: false
      t.integer :date_shipment_id,   null: false
      t.text :explanation,           null: false

      t.timestamps
    end
  end
end
