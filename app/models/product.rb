class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, :genre, :status, :shipment_charge, :shipment_source, :date_shipment

  validates :name, :price, :explanation, presence: true

  validates :genre_id, :status_id, numericality: { other_than: 1 } 
end
