class DeliveryAddress < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :items
end
