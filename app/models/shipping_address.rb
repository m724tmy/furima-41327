class ShippingAddress < ApplicationRecord
  belongs_to :buy
  belongs_to :prefecture
end
