class Item < ApplicationRecord
  belongs_to :user
  belongs_to :name
  has_one_attached :image
  belongs_to :items

  validates :name, :price, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id, presence: true
  validates :name, :price, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id, numericality: { other_than: 1 } 

  def was_attached?
    self.image.attached?
  end

end
