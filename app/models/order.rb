class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :item
  has_one :delivery_address

  validates :price, presence: true
  validates :token, presence: true
end
