class BuyForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number

  # バリデーションの定義
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only numbers.' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "must be other than 1" }

  def save
    # 購入情報を保存
    buy = Buy.create(user_id:, item_id:)

    # 発送先情報を保存
    ShippingAddress.create(
      post_code:, prefecture_id:, municipality:,
      street_address:, building_name:, phone_number:, buy_id: buy.id
    )
  end
end
