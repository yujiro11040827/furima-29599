class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.integer :user_id
      t.integer :prodecut_id
      t.integer :card_information
      t.integer :expiration_date
      t.integer :security_code
      t.timestamps
    end
  end
end
