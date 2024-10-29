FactoryBot.define do
    factory :buy_form do
      post_code { '123-4567' }
      prefecture_id { 2 }
      municipality { '渋谷区' }
      street_address { '渋谷1-2-3' }
      building_name { '渋谷ビル' }
      phone_number { '09012345678' }
      token {"tok_abcdefghijk00000000000000000"}
      association :user_id
      association :item_id
    end
  end