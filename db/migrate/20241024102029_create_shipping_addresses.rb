class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|

      t.timestamps
      t.string     :post_code,      null: false
      t.integer    :prefecture_id,  null: false
      t.string     :municipality,   null: false
      t.string     :street_address, null: false
      t.string     :building_name
      t.string     :phone_number,   null: false
      t.references :buy,            null: false, foreign_key: true
    end
  end
end