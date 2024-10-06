class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :description, :price, presence: true
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 }
end
