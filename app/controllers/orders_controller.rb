class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :item,]
  before_action :authenticate_user!, only: :index

  def index
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
      else
      @order_delivery_address = OrderDeliveryAddress.new
    end
  end

  def new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
       @order_delivery_address.save
       redirect_to root_path
    else
      render  :index
    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(token: params[:token], item_id: params[:item_id]  , user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end