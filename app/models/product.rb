class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, :status, :shipment_charge, :shipment_source, :date_shipment
  has_one_attached :image

  validates  :shipment_source_id, :date_shipment_id, :shipment_charge_id, presence: true

  validates :price, presence: true, numericality: {greater_than: 299, less_than: 10000000}, format: { with: /\A[a-z0-9]+\z/} 

  validates :name, presence: true, length: {maximum: 40}

  validates :explanation, presence: true, length: {maximum: 1000}

  validates :genre_id, :status_id, numericality: { other_than: 1 } 
end
