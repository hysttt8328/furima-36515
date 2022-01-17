class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path, notice: ''
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :scheduled_id, :price, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    @user = @item.user
    redirect_to(items_path) unless @user == current_user
  end
  
end