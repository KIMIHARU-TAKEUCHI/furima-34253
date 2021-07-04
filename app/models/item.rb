class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :postage_payer
  belongs_to :preparation_day
  belongs_to :item_condition

  with_options presence: true do
    validates :image
    validates :name
    validates :item_info
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number" }
  validates :item_condition_id, numericality: { other_than: 1, message: "Condition Select" }
  validates :postage_payer_id, numericality: { other_than: 1, message: "Shipping charge Select" }
  validates :prefectural_id, numericality: { other_than: 1, message: "Ship from Select" }
  validates :preparation_day_id, numericality: { other_than: 1, message: "Guideline Select" }
  validates :category_id, numericality: { other_than: 1, message: "Category Select" }

  def was_attached?
    self.image.attached?
  end

end