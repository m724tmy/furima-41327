class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|

      t.timestamps
      t.references :user, null: false, foreign_key: true 
      t.references :item, null: false, foreign_key: true 
    end
  end
end