require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  before do
    @buy_destination = FactoryBot.build(:buy_destination)
  end
  
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
     it "postal_code,shipment_source_id,city,address,phone_number,tokenが存在すれば登録できる" do
       expect(@buy_destination).to be_valid
     end
     it "buildingが空でも登録できる" do
       expect(@buy_destination).to be_valid
       @buy_destination.building = ''
     end
    end

    context '商品購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @buy_destination.postal_code = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがないと登録できない" do
        @buy_destination.postal_code = '7610111'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Postal code is invalid")
      end
      it "shipment_sourceが空だと登録できない" do
        @buy_destination.shipment_source_id = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Shipment source can't be blank")
      end
      it "cityが空だと登録できない" do
        @buy_destination.city = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと登録できない" do
        @buy_destination.address = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @buy_destination.phone_number = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが12桁以上だと登録できない" do
        @buy_destination.phone_number = '090123456789'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberにハイフンがあると登録できない" do
        @buy_destination.phone_number = '090-1234-5678'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空だと登録できない" do
        @buy_destination.token = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
