class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true

  validates :name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :scheduled_id, presence: true

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, presence: true, numericality: { only_integer: true, message: 'Half-width number' }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_id, numericality: { other_than: 1, message: "can't be blank" }

  has_one_attached :image
  belongs_to :user
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled
end
