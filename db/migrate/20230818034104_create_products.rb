class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foregin_key: true
      t.string :product_name, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
