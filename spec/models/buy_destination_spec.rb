require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  before do
    @buy_destination = FactoryBot.build(:buy_destination)
  end
  
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
     it "postal_code,shipment_source_id,city,address,phone_numberが存在すれば登録できる" do
       expect(@buy_destination).to be_valid
     end
    end
  end
end
