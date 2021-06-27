class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(items_params)
    if @items.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def items_params
    params.requere(:items).permit(:name, :image, :price, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id, :user)
  end

end
