class ItemsController < ApplicationController
  def index
    @items = Items.includes(:user)
  end

  def new
    @tweet = Items.new
  end

  def create
    Items.create(items_params)
  end

  private
  def items_params
    params.requere(:items).permit(:name, :image, :price, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id, :user)
  end

end
