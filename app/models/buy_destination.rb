class BuyDestination

  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :buy_id, :postal_code, :shipment_source_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id, :product_id, :shipment_source_id, :city, :address, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    VALID_PHONE_NUMBER_REGEX = /\A\d{10}\z|\A\d{11}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  end

  def save
    buy = Buy.create(product_id: product_id, user_id: user_id)
    Destination.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, address: address, phone_number: phone_number, building: building, buy_id: buy.id)
  end
end