class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # ヴァリデーション設定
  validates :name, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price,
            presence: true
end
