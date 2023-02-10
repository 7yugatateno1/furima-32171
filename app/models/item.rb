class Item < ApplicationRecord
  validates :name, :text, :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, :price, :image, presence: true
  belongs_to_active_hash :prefecture
  belongs_to :user
  #has_one :buy_record
  has_one_attached :image
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999 }
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }
  validates :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, numericality: { other_than: 1 } 
end