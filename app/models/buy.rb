class Buy < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :product
end
