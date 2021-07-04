class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :image, :price, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id).merge(user_id: current_user.id)
  end

end
