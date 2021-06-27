class Item < ApplicationRecord
  
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.integer :price, null: false
      t.text :item_info, null: false
      t.integer :prefectural_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :preparation_day_id, null: false
      t.integer :postage_payer_id, null: false
      t.integer :category_id, null: false
      t.references :user, null: false, foreign_key: true
    end
  end

  belongs_to :user
  belongs_to :name
  has_one_attached :image

  validates :name, presence: true

  def was_attached?
    self.image.attached?
  end

end
