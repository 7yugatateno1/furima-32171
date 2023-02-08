class Item < ApplicationRecord
  validates :name, :text, :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, :price, :user, presence: true
  belongs_to :user
  has_one :buy_record
end