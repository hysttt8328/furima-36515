class DeliveryCharge < ActiveHash::Base
  self.data = [
    { id: 1, delivery_charge_id: '--' },
    { id: 2, delivery_charge_id: '着払い（購入者負担）' },
    { id: 3, delivery_charge_id: '送料込み（出品者負担）' }
  ]
end
