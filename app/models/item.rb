class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :postage_payer
  belongs_to :preparation_day
  belongs_to :item_condition

  validates :name, :price, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id, presence: true
  #validates :item_id, :item_info, :prefectural_id, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id, numericality: { other_than: 1 } 
  def was_attached?
    self.image.attached?
  end

end