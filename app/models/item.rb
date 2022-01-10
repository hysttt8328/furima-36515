class Item < ApplicationRecord
  validate :images_presence
  validates :name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :scheduled_id,:user_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  has_one_attached :image
  belongs_to :user
  belongs_to :category

  def images_presence
    if images.attached?
      if images.length > 1
        errors.add(:image, '1枚まで投稿できます')
      end
    else
      errors.add(:image, '画像がありません')
    end
  end
end
