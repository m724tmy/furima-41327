FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    category_id { Faker::Number.between(from: 2, to: 10) }
    status_id { Faker::Number.between(from: 2, to: 5) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 5) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    shipping_day_id { Faker::Number.between(from: 2, to: 5) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
