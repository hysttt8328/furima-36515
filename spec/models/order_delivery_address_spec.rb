require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.save
    @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1 
  end

describe '商品購入' do
  context '商品購入ができる時' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_delivery_address).to be_valid
    end

    it 'building_nameは空でも保存できること' do
      @order_delivery_address.building_name = ''
      expect(@order_delivery_address).to be_valid
    end
  end

  context '商品購入ができない時' do
    it 'tokenが空だと保存できないこと' do
      @order_delivery_address.token = ''
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空だと保存できないこと' do
      @order_delivery_address.post_code = ''
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_delivery_address.post_code = '1234567'
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Post code is invalid. Include  Enter it as follows (e.g. 123-4567)')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @order_delivery_address.prefecture_id = 1
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @order_delivery_address.city = ''
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
    end

    it 'cityが全角文字以外だと保存できないこと' do
      @order_delivery_address.city = 'ｱｲｳｴｵ'
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City is invalid. Input full-width characters")
    end

    it 'house_numberが空だと保存できないこと' do
      @order_delivery_address.house_number = ''
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'telephone_numberが空だと保存できないこと' do
      @order_delivery_address.telephone_number = ''
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが半角数字以外だと保存できないこと' do
      @order_delivery_address.telephone_number = '１１１１１１１１１１１'
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Telephone number is invalid")
    end

    it 'telephone_numberが12桁以上では保存できないこと' do
      @order_delivery_address.telephone_number = "090123456789"
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Telephone number is invalid") 
    end

    it 'telephone_numberが9桁以下では保存できないこと' do
      @order_delivery_address.telephone_number = "090123456"
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Telephone number is invalid") 
    end

    it 'userが紐付いていないと保存できないこと' do
      @order_delivery_address.user_id = nil
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @order_delivery_address.item_id = nil
      @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
end