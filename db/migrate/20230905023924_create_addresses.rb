class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :purchase, null: false, foregin_key: true
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :area, null: false
      t.string :building_name
      t.string :telephone, null: false
      t.timestamps
    end
  end
end
