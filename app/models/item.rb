class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_id , presence: true
  validates :price, presence: true
  validates :user, presence: true







  has_one_attached :image
end
