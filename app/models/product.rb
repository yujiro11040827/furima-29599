class Product < ApplicationRecord
  belongs_to :user, :genre, :status, :shipment_charge, :shipment_source, :date_shipment
end
