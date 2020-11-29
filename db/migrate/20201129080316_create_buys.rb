class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.integer :user_id,            foreign_key: true
      t.integer :products_id,         foreign_key: true

      t.timestamps
    end
  end
end
