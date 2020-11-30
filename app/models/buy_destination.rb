class BuyDestination

  include ActiveModel::Model
  attr_accessor :user_id, :products_id, :buys_id, :postal_code, :shipment_source_id, :city, :address, :bulding, :phone_number

  with_options presence: true do
    validates :user_id, :products_id, :buys_id, :city, :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source, numericality: { other_than: 0, message: "can't be blank" }
    VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  end

  def save
    Destination.create(postal_code: postal_code, shipment_source: shipment_source, city: city, phone_number: phone_number, building_name: building_name,user_id: user.id, buys_id: buys_id, products_id: product_id)
    Buy.create(products_id: products_id, user_id: user.id)
  end
end