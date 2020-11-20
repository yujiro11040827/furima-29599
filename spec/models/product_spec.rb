require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end


 describe '商品出品' do
   context '商品出品がうまくいくとき' do
    it "name,genre,price,status,shipment_source,date_shipment,shipment_charge,explanationが存在すれば登録できる" do
      expect(@product).to be_valid
    end
   end

    context '商品出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空だと登録できない" do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it "priceが空だと登録できない" do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字でないと登録できない" do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it "statusが空だと登録できない" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status is not a number")
      end
      it "shipment_sourceが空だと登録できない" do
        @product.shipment_source_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipment source can't be blank")
      end
      it "date_shipmentが空だと登録できない" do
        @product.date_shipment_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Date shipment can't be blank")
      end
      it "shipment_chargeが空だと登録できない" do
        @product.shipment_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipment charge can't be blank")
      end
      it "priceが300未満だと登録できない" do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 299")
      end
      it "priceが10000000より高いと登録できない" do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end