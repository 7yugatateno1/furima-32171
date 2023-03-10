FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    text {"良い商品です"}
    category_id {2}
    condition_id {2}
    delivery_cost_id {2}
    sender_area_id {2}
    delivery_day_id {2}
    price {10000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end