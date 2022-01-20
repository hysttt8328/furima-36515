class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = OrderDeliveryAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderDeliveryAddress.new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
       @order_delivery_address.save
       redirect_to root_path
    else
      @orders = @item.orders.includes(:user)
      render action: :index
    end
  end

  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address_num, :building_name, :phone, :item_id).merge(token: params[:token], user_id: current_user.id)
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