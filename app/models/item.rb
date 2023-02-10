class Item < ApplicationRecord
  validates :name, :text, :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, :price, :image, presence: true
  belongs_to :user
  #has_one :buy_record
  has_one_attached :image
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999 }
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }
  validates :category_id, :condition_id, :delivery_cost_id, :sender_area_id, :delivery_day_id, numericality: { other_than: 1 } 
  #enum condition_id: {"新品、未使用":2, "未使用に近い":3, "目立った傷や汚れなし":4, "やや傷や汚れあり":5, "傷や汚れあり":6, "全体的に状態が悪い":7} 
  #enum ddelivery_cost_id: {"送料込み（出品者負担）":2, "着払い（購入者負担）":3} 
  #enum sender_area_id: {
    #北海道:2,青森県:3,岩手県:4,宮城県:5,秋田県:6,山形県:7,福島県:8,
    #茨城県:9,栃木県:10,群馬県:11,埼玉県:12,千葉県:13,東京都:14,神奈川県:15,
    #新潟県:16,富山県:17,石川県:18,福井県:19,山梨県:20,長野県:21,
    #岐阜県:22,静岡県:23,愛知県:24,三重県:25,
    #滋賀県:26,京都府:27,大阪府:28,兵庫県:29,奈良県:30,和歌山県:31,
    #鳥取県:32,島根県:33,岡山県:34,広島県:35,山口県:36,
    #徳島県:37,香川県:38,愛媛県:39,高知県:40,
    #福岡県:41,佐賀県:42,長崎県:43,熊本県:44,大分県:45,宮崎県:46,鹿児島県:47,沖縄県:48
  #}
  #enum delivery_day_id: {"1日〜2日で発送":2, "2日〜3日で発送": 3, "4日〜7日で発送":4 }
end