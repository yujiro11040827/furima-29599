class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.string :seller
      t.string :status
      t.integer :shipment_source
      t.integer :date_shipment
      t.string :image
      t.string :explanation
      t.timestamps
    end
  end
end
