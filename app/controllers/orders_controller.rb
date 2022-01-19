class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_08c66292b01c862a82f0d682" 
    Payjp::Charge.create(
      amount: order_params[:price],
        card: order_params[:token],
          currency: 'jpy'
    )
  end

end