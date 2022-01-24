class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include  Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
    validates :house_number
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid. Input only number"}
    validates :token
  end

    

    def save
      order = Order.create(user_id: user_id, item_id: item_id )
      DeliveryAddress.create(post_code: post_code,  prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
    end
end
