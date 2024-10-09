FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }    # ランダムな商品名を生成
    description { Faker::Lorem.paragraph }   # ランダムな段落を生成
    category_id { Faker::Number.between(from: 2, to: 10) }  # ランダムなカテゴリーID（1以外）を生成
    status_id { Faker::Number.between(from: 2, to: 5) }     # ランダムなステータスID
    shipping_fee_id { Faker::Number.between(from: 2, to: 5) } # ランダムな送料ID
    prefecture_id { Faker::Number.between(from: 2, to: 47) }  # ランダムな都道府県ID
    shipping_day_id { Faker::Number.between(from: 2, to: 5) } # ランダムな発送日数ID
    price { Faker::Number.between(from: 300, to: 9_999_999) } # ランダムな価格（¥300〜¥9,999,999）v
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
